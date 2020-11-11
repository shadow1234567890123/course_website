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
        //�ж��Ƿ��ύ������
        session.setAttribute("playerList",playerInfos);
        session.setAttribute("gameList",games);
        System.out.println(playerInfos.size()+"---"+games.size());
        mv.setViewName("match");
        return mv;
    }

    @RequestMapping("/chooseGame")
    public @ResponseBody List<PlayerInfo> chooseGame(@RequestParam(name = "gameId",required = true,defaultValue = "1") int gameId, HttpServletRequest request){
        //ͨ��ѡ�е�gameɸѡ�����б�
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
        String path = request.getSession().getServletContext().getRealPath("/");//�ҵ�jago��Ŀ¼
        int index=path.indexOf("course_website_web");
        path=path.substring(0,index)+"jago\\src\\main\\java\\";   //�ύ�ļ���ͳһ�洢Ŀ¼
        HttpSession session=request.getSession();
        User user= (User) session.getAttribute("user");
        PlayerInfo playerInfo=(PlayerInfo) session.getAttribute("playerInfo");
        int groupId=user.getGroupId();
        System.out.println("�ҵ����"+groupId);
        boolean fileSubmitFlag=true;
        String filePath="";
        String name = "";
        String player1Name="";
        ArrayList<String> fileList=new ArrayList<String>(); //��Ҫ���±�����ļ�
        ArrayList<String> classList=new ArrayList<String>();//��Ҫ���¼��ص����ļ�
        for(MultipartFile f:files) {
            File file1;
            int count=0;
            try {
                if (f instanceof CommonsMultipartFile) {
                    //ת�����������Ȼ��������Ҫͨ�������FileItem��������·��
                    CommonsMultipartFile f2 = (CommonsMultipartFile) f;
                    name = f2.getFileItem().getName();
                    System.out.println("name="+name);
                    if(name==""&&count==0){
                        //δ�ύ����
                        System.out.println("δ�ύ����");
                        player1Name=playerInfo.getName();
                        fileSubmitFlag=false;
                        break;
                    }
                    classList.add(name.replace(".java","").replace('/','.'));
                    if (name.contains("AI")) {
                        player1Name=name.replace(".java","").replace('/','.');
                    }
                    file1 = new File(path + "/" + name);
                    //����ύ���������ϵ�ÿ�����·�����Ա���б���
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
            //�����ύ������Ҫ��java�ļ��������±���
            Compilejava compilejava=new Compilejava();
            String compileResult=compilejava.executeCmd(fileList,classList);
            System.err.println(compileResult);
            //�������ֻ��һ���ύ�����������    �����ύ���ڡ���ע���洢·�������ࡢ��ս���֡���ս����
//            String playerName=name.substring(0,name.indexOf("/"));
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//���Է�����޸����ڸ�ʽ
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
            System.out.println(player1Name+"�Ƿ������������Ϣ"+flag+" currentTime="+currentTime);
        }
        //����ύ������
         Thread thread=new BattleThread(player1Name,groupId2,matchCount);
        ////        �Ĵ洢·�����������ּ��ս
        thread.start();
        String projectPath=request.getSession().getServletContext().getRealPath("");
        //��ȡ�ύ���ֺ��������Ϣ
        playerInfo=challengeService.queryPlayer(groupId,Integer.parseInt(gameId));
        session.setAttribute("playerInfo",playerInfo);
        return playerInfo.getSubmitDate();
    }

    @RequestMapping("/playerInfo")
    public @ResponseBody PlayerInfo queryInfo(@RequestParam(name = "gameId",required = true,defaultValue = "0") int gameId, HttpServletRequest request){
        //ͨ��ѡ�е�gameɸѡ�����б�
        HttpSession session=request.getSession();
        //�����������û���ύ������
        User user= (User) session.getAttribute("user");
        int groupId=user.getGroupId();
        System.out.println(groupId+"gameId="+gameId);
        PlayerInfo playerInfo=challengeService.queryPlayer(groupId,gameId);
        if(playerInfo==null){
            playerInfo=new PlayerInfo();
            playerInfo.setIfSubmit(false);
        }else{
            System.out.println("��ţ�"+playerInfo.getGroupId()+"��һ���ύʱ�䣺"+playerInfo.getSubmitDate());
            session.setAttribute("playerInfo",playerInfo);
            playerInfo.setIfSubmit(true);
        }
        return playerInfo;
    }
}
