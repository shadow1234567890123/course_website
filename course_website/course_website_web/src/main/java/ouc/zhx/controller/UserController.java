package ouc.zhx.controller;
import com.github.pagehelper.PageInfo;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import ouc.zhx.domain.GroupInformation;
import ouc.zhx.domain.User;
import ouc.zhx.service.ICourseService;
import ouc.zhx.service.IUserService;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private ICourseService courseService;

    @RequestMapping("/findAll")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1") int page,@RequestParam(name = "size",required = true,defaultValue = "4") int size,HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        List<User> users = userService.findAll(page,size);
        //pageInfo是一个分页Bean
        PageInfo pageInfo=new PageInfo(users);
        HttpSession session = request.getSession();
        session.setAttribute("pageInfo",pageInfo);
        //mv.addObject("pageInfo",pageInfo);
        mv.setViewName("student-management");
        return mv;
    }

    @RequestMapping("/findAllStudent")
    public @ResponseBody List<User> findAllStudent(String courseNameAndYear){
        String year = courseNameAndYear.substring(4);
        int courseId = courseService.findCourseId(Integer.parseInt(year));
        List<User> users =userService.findAllStudentByCourseId(courseId);
        return users;
    }

    @RequestMapping("/findAllGroupByCourseId")
    public @ResponseBody List<GroupInformation> findAllGroupByCourseId(int courseId){
        List<GroupInformation> groups =userService.findAllGroupByCourseId(courseId);
        return groups;
    }


    @RequestMapping("/saveUser")
    public void saveUser(User user){
        userService.saveUser(user);
    }

    @RequestMapping("/fileUpload")
    public void fileUpload(MultipartFile upload,HttpServletRequest request,HttpServletResponse response) throws Exception {

        String path=request.getSession().getServletContext().getRealPath("/uploads/");
        File file=new File(path);
        if(!file.exists()){
            file.mkdir();
        }
        String filename=upload.getOriginalFilename();
        upload.transferTo(new File(path,filename));
        userService.readFileAndSaveUser(path);
        request.getRequestDispatcher("/pages/student-management.jsp").forward(request,response);
        return;
    }

    @RequestMapping("/login")
    public ModelAndView login(String username, String password,HttpServletRequest request) throws Exception{
        User user = userService.findByUsername(username);

        ModelAndView mv=new ModelAndView();
        if(user!=null&&password.equals(user.getPassword())){
            if(user.getRole().equals("学生")){
                mv.addObject("user",user);
                mv.setViewName("main-student");
                //mv.setViewName("main");
                HttpSession session=request.getSession();
                session.setAttribute("user",user);
                User u = (User) session.getAttribute("user");
                return mv;
            }else if(user.getRole().equals("组长")){
                mv.addObject("user",user);
                mv.setViewName("main-groupleader");
                //mv.setViewName("main");
                HttpSession session=request.getSession();
                session.setAttribute("user",user);
                User u = (User) session.getAttribute("user");
                return mv;
            }else{
                mv.addObject("user",user);
                mv.setViewName("main-teacher");
                //mv.setViewName("main");
                HttpSession session=request.getSession();
                session.setAttribute("user",user);
                return mv;
            }

        }else{
            String message="用户名或密码错误";
            mv.addObject("error","账号或密码错误");
            mv.setViewName("login");
            return mv;
        }
    }
    @RequestMapping("/changePassword")
    public ModelAndView changePassword(HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        User user = (User) request.getSession().getAttribute("user");
        mv.addObject("user",user);
        mv.setViewName("changePassword");
        return mv;
    }

    @RequestMapping("/modifyPassword")
    public ModelAndView modifyPassword(String newPassword,HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        HttpSession session=request.getSession();
        User u = (User) session.getAttribute("user");
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);

        userService.updateUserPassword(courseId,u.getStudentId(),newPassword);
        mv.setViewName("login");
        return mv;
    }


    @RequestMapping("/findAllStudentByCourseId")
    public @ResponseBody String[] findAllStudentByCourseId(){
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        List<User> users =userService.findAllStudentByCourseId(courseId);
        int count=users.size();
        String[] userList=new String[count];
        for(int i=0;i<count;i++){
            User user=users.get(i);
            userList[i]=user.getStudentId()+"("+user.getName()+")";
        }
        return userList;
    }

    @RequestMapping("/findAllStudentWithoutGroupByCourseId")
    public ModelAndView findAllStudentWithoutGroupByCourseId(){
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        ModelAndView mv=new ModelAndView();
        List<User> users =userService.findAllStudentWithoutGroupByCourseId(courseId);
        int count=users.size();
        System.out.println(count);
        String[] userList=new String[count];
        for(int i=0;i<count;i++){
            User user=users.get(i);
            userList[i]=user.getStudentId()+"("+user.getName()+")";
        }
        mv.addObject("userList",userList);
        mv.setViewName("group-management");
        return mv;
    }

    @RequestMapping("/setGroupLeader")
    public void setGroupLeader(String[] teamLeaderList,HttpServletRequest request,HttpServletResponse response) throws Exception{
        int count=teamLeaderList.length;
        List<Integer> groupId=new ArrayList<Integer>();
        for(int i=0;i<count;i++){
            groupId.add(i+1);
        }
        Collections.shuffle(groupId);
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        for(int i=0;i<count;i++){
            userService.updateUserToGroupLeaderByCourseIdAndStudentId(courseId,teamLeaderList[i].substring(0,11),groupId.get(i));

        }
        request.getRequestDispatcher("/user/findAll?page=1&size=7").forward(request,response);
        return;
    }

    @RequestMapping("/createGroup")
    public @ResponseBody void createGroup(String[] groupMember,GroupInformation groupInformation,HttpServletRequest request){
        int count=groupMember.length;
        HttpSession session=request.getSession();
        User u = (User) session.getAttribute("user");


        Integer groupId = u.getGroupId();
        System.out.println(groupId);
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        System.out.println("课程号是："+courseId);

        groupInformation.setCourseId(courseId);
        groupInformation.setGroupId(groupId);

        for(int i=0;i<count;i++){
            userService.updateUserGroupIdByCourseIdAndStudentId(courseId,groupMember[i].substring(0,11),groupId);
        }
        courseService.saveGroupInformation(groupInformation);

    }

    @RequestMapping("/findGroupInfo")
    public @ResponseBody List<User> findGroupInfo(int groupId,HttpServletRequest request){
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        List<User> groupInfo = userService.findGroupInfoByCourseIdAndGroupId(courseId, groupId);
        HttpSession session=request.getSession();
        session.setAttribute("currentGroupInfo",groupInfo);
        return groupInfo;
    }

    @RequestMapping("/findGroupInfoWithoutGroupLeader")
    public @ResponseBody String[] findGroupInfoWithoutGroupLeader(int groupId,HttpServletRequest request){
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        List<User> groupInfo = userService.findGroupInfoWithoutGroupLeader(courseId, groupId);
        int count=groupInfo.size();
        String[] nameAndStudentId=new String[count];
        for(int i=0;i<count;i++){
            User user = groupInfo.get(i);
            nameAndStudentId[i]=user.getStudentId()+"("+user.getName()+")";
        }
        return nameAndStudentId;
    }

    @RequestMapping("/transferLeader")
    public @ResponseBody void transferLeader(String newGroupLeader,HttpServletRequest request){
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        System.out.println(newGroupLeader);
        String newStudentId=newGroupLeader.substring(0,11);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        userService.updateUserToGroupLeaderByCourseIdAndStudentId(courseId,newStudentId,user.getGroupId());
        userService.updateUserToGroupMemberByCourseIdAndStudentId(courseId,user.getStudentId(),user.getGroupId());

    }

    @RequestMapping("/delGroupMember")
    public @ResponseBody void delGroupMember(String studentId){
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        userService.updateUserGroupMemberToNull(courseId,studentId);
    }

    @RequestMapping("/findStudentWithoutGroupId")
    public @ResponseBody String[] findStudentWithoutGroupId(){
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        List<User> students = userService.findStudentWithoutGroupId(courseId);
        int count=students.size();
        String[] nameAndStudentId=new String[count];
        for(int i=0;i<count;i++){
            User user = students.get(i);
            nameAndStudentId[i]=user.getStudentId()+"("+user.getName()+")";
        }
        return nameAndStudentId;
    }

    @RequestMapping("/addGroupMember")
    public @ResponseBody void addGroupMember(String[] newGroupMemberList,HttpServletRequest request){
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("user");
        int groupId=user.getGroupId();
        String studentId=null;
        for(int i=0;i<newGroupMemberList.length;i++){
            studentId=newGroupMemberList[i].substring(0,11);
            userService.updateUserGroupIdByCourseIdAndStudentId(courseId,studentId,groupId);
        }
    }

    @RequestMapping("/delUser")
    public void delUser(String studentId,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
    //public ModelAndView delUser(String studentId,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        ModelAndView mv=new ModelAndView();
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        userService.delUser(courseId,studentId);

        request.getRequestDispatcher("/user/findAll?page=1&size=7").forward(request,response);
        return;
    }

    @RequestMapping("/addStudentForm")
    public void addStudentForm(User user,String optionsRadios, HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        user.setCourseId(courseId);
        user.setPassword(user.getStudentId());
        if("1".equals(optionsRadios)){
            user.setRole("组长");
        }else {
            user.setRole("学生");
        }
        userService.saveUser(user);
        request.getRequestDispatcher("/user/findAll?page=1&size=7").forward(request,response);
        return;
    }
}