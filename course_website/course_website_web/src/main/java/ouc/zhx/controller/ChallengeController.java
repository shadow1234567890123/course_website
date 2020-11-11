package ouc.zhx.controller;

import core.game.Compilejava;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import ouc.zhx.domain.Game;
import ouc.zhx.domain.PlayerInfo;
import ouc.zhx.domain.User;
import ouc.zhx.service.IChallengeService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/challenge")
public class ChallengeController {

    @Autowired
    private IChallengeService challengeService;

    @RequestMapping("/match")
    public ModelAndView query(HttpServletRequest request) throws Exception{
        HttpSession session=request.getSession();
        ModelAndView mv=new ModelAndView();
        User user= (User) session.getAttribute("user");
        int groupId=user.getGroupId();
        List<PlayerInfo> playerInfos=challengeService.queryAllPlayer(groupId);
        List<Game> games=challengeService.queryAllGame();
        //判断是否提交过棋手
        session.setAttribute("playerList",playerInfos);
        session.setAttribute("gameList",games);
        System.out.println(playerInfos.size()+"---"+games.size());
        mv.setViewName("match");
        return mv;
    }

    @RequestMapping("/chooseGame")
    public @ResponseBody List<PlayerInfo> chooseGame(@RequestParam(name = "gameId",required = true,defaultValue = "1") int gameId, HttpServletRequest request){
        //通过选中的game筛选棋手列表
        HttpSession session=request.getSession();
        ArrayList<PlayerInfo> playerInfos=(ArrayList<PlayerInfo>)session.getAttribute("playerList");
        ArrayList<PlayerInfo> players=new ArrayList<PlayerInfo>();
        System.out.println(playerInfos.size());
        for(int i=0;i<playerInfos.size();i++){
            if(playerInfos.get(i).getGameId()==gameId){
                players.add(playerInfos.get(i));
                System.out.println(playerInfos.get(i).getParentPath());
            }
        }
        return players;
    }

    @RequestMapping("/battle")
    public @ResponseBody String challenge(@RequestParam(value = "gameId") String  gameId,
                                        @RequestParam(value = "groupId2") String  groupId2,
                                        @RequestParam(value = "fileFolder") MultipartFile[] files,
                                        @RequestParam(value = "matchCount") String matchCount,
                                        @RequestParam(value = "newComment") String newComment,
                                        HttpServletRequest request) throws IOException {
        String path = request.getSession().getServletContext().getRealPath("/");//找到jago的目录
        int index=path.indexOf("course_website_web");
        path=path.substring(0,index)+"jago\\src\\main\\java\\";   //提交文件的统一存储目录
        HttpSession session=request.getSession();
        User user= (User) session.getAttribute("user");
        PlayerInfo playerInfo=(PlayerInfo) session.getAttribute("playerInfo");
        int groupId=user.getGroupId();
        System.out.println("我的组号"+groupId);
        boolean fileSubmitFlag=true;
        String filePath="";
        String name = "";
        String player1Name="";
        ArrayList<String> fileList=new ArrayList<String>(); //需要重新编译的文件
        ArrayList<String> classList=new ArrayList<String>();//需要重新加载的类文件
        for(MultipartFile f:files) {
            File file1;
            int count=0;
            try {
                if (f instanceof CommonsMultipartFile) {
                    //转换成这个对象，然后我们需要通过里面的FileItem来获得相对路径
                    CommonsMultipartFile f2 = (CommonsMultipartFile) f;
                    name = f2.getFileItem().getName();
                    System.out.println("name="+name);
                    if(name==""&&count==0){
                        //未提交棋手
                        System.out.println("未提交棋手");
                        player1Name=playerInfo.getName();
                        fileSubmitFlag=false;
                        break;
                    }
                    classList.add(name.replace(".java","").replace('/','.'));
                    if (name.contains("AI")) {
                        player1Name=name.replace(".java","").replace('/','.');
                    }
                    file1 = new File(path + "/" + name);
                    //添加提交到服务器上的每个类的路径，以便进行编译
                    fileList.add(file1.getAbsolutePath());
                    filePath=file1.getAbsolutePath().substring(0,file1.getAbsolutePath().indexOf(f2.getOriginalFilename()));
                    System.out.println(filePath);
                    file1.mkdirs();
                    file1.createNewFile();
                    f.transferTo(file1);
                    count++;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        if(fileSubmitFlag){
            //重新提交棋手需要将java文件进行重新编译
            Compilejava compilejava=new Compilejava();
            String compileResult=compilejava.executeCmd(fileList,classList);
            System.err.println(compileResult);
            //更新棋手或第一次提交该棋类的棋手    更新提交日期、备注及存储路径、棋类、对战棋手、对战场数
//            String playerName=name.substring(0,name.indexOf("/"));
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//可以方便地修改日期格式
            String currentTime = dateFormat.format(now);
            if(playerInfo==null){
                playerInfo=new PlayerInfo();
            }
            playerInfo.setGroupId(groupId);
            playerInfo.setGameId(Integer.parseInt(gameId));
            playerInfo.setName(player1Name);
            playerInfo.setComment(newComment);
            playerInfo.setSubmitDate(currentTime);
            playerInfo.setParentPath(filePath);
            boolean flag=challengeService.updatePlayer(playerInfo);
            System.out.println(player1Name+"是否更新了棋手信息"+flag+" currentTime="+currentTime);
        }
        //获得提交的棋手
         Thread thread=new BattleThread(player1Name,groupId2,matchCount);
        ////        的存储路径，进行棋手间对战
        thread.start();
        String projectPath=request.getSession().getServletContext().getRealPath("");
        //获取提交棋手后的最新信息
        playerInfo=challengeService.queryPlayer(groupId,Integer.parseInt(gameId));
        session.setAttribute("playerInfo",playerInfo);
        return playerInfo.getSubmitDate();
    }

    @RequestMapping("/playerInfo")
    public @ResponseBody PlayerInfo queryInfo(@RequestParam(name = "gameId",required = true,defaultValue = "0") int gameId, HttpServletRequest request){
        //通过选中的game筛选棋手列表
        HttpSession session=request.getSession();
        //该组该棋类有没有提交过棋手
        User user= (User) session.getAttribute("user");
        int groupId=user.getGroupId();
        System.out.println(groupId+"gameId="+gameId);
        PlayerInfo playerInfo=challengeService.queryPlayer(groupId,gameId);
        if(playerInfo==null){
            playerInfo=new PlayerInfo();
            playerInfo.setIfSubmit(false);
        }else{
            System.out.println("组号："+playerInfo.getGroupId()+"上一次提交时间："+playerInfo.getSubmitDate());
            session.setAttribute("playerInfo",playerInfo);
            playerInfo.setIfSubmit(true);
        }
        return playerInfo;
    }
}
