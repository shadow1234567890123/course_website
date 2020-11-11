package ouc.zhx.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.Phased;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import ouc.zhx.domain.*;
import ouc.zhx.service.ICourseService;
import ouc.zhx.service.IUserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseController {



    @Autowired
    ICourseService courseService;

    @Autowired
    IUserService userService;


    @RequestMapping("/saveCourse")
    public @ResponseBody void saveCourse(Course course,HttpServletRequest request,HttpServletResponse response) throws Exception{
        course.setCourseName("人工智能");
        course.setCourseNumber("080503211293");
        int year = Calendar.getInstance().get(Calendar.YEAR);
        String path=request.getSession().getServletContext().getRealPath("/uploads/");
        try{
            new File(path,year+"").mkdir();
        }catch (Exception e){
            throw new RuntimeException();
        }
        List<Course> courses = courseService.findAllCourse();
        for(Course c:courses){
            if(c.getYear().equals(course.getYear())) throw new RuntimeException();
        }

        courseService.saveCourse(course);
//        request.getRequestDispatcher("/pages/class-management.jsp").forward(request,response);
//        return;
    }

    @RequestMapping("/saveProject")
    public @ResponseBody void saveProject(Project project,HttpServletRequest request,HttpServletResponse response) throws Exception{
        String courseNameAndYear = request.getParameter("courseNameAndYear");
        String year = courseNameAndYear.substring(4);
        project.setCourseId(courseService.findCourseId(Integer.parseInt(year)));
        project.setProjectId(courseService.projectCountByCourseId(project.getCourseId())+1);
        courseService.saveProject(project);
//        request.getRequestDispatcher("/pages/class-management.jsp").forward(request,response);
//        return;
    }

    @RequestMapping("/saveIndividualTask")
    public @ResponseBody void saveIndividualTask(ProgramTask programTask,MultipartFile build,HttpServletRequest request) throws Exception{
        String courseNameAndYear = request.getParameter("courseNameAndYear");
        String projectName = request.getParameter("projectName");
        String year = courseNameAndYear.substring(4);
        int courseId = courseService.findCourseId(Integer.parseInt(year));
        int projectId=courseService.findProjectIdByCourseIdAndProjectName(courseId,projectName);
        int count=courseService.phaseCount(courseId,projectId);
        programTask.setCourseId(courseId);
        programTask.setProjectId(projectId);
        programTask.setPhaseId(++count);
        programTask.setPhaseType("个人");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        //String path=request.getSession().getServletContext().getRealPath("/uploads/"+user.getStudentId()+"/");
        String path=request.getSession().getServletContext().getRealPath("/uploads/"+year);
        String rootDir=courseId+"-"+projectId+"-"+count;
        File file=new File(path+"/"+rootDir);


        courseService.mkIndividualdirs(file,build);//创建该关卡的目录结构


        MultipartHttpServletRequest params=(MultipartHttpServletRequest)request;
        List<MultipartFile> files = params.getFiles("testCaseAndStandardout");
        for(MultipartFile f:files) {
            File file1;
            String name = "";
            try {
                if (f instanceof CommonsMultipartFile) {
                    //转换成这个对象，然后我们需要通过里面的FileItem来获得相对路径
                    CommonsMultipartFile f2 = (CommonsMultipartFile) f;
                    name = f2.getFileItem().getName();
                    file1 = new File(path+"/"+rootDir + "/testCaseAndStandardout/" + name.split("/")[1]);
                    file1.mkdirs();
                    file1.createNewFile();
                    f.transferTo(file1);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        MultipartFile upload = programTask.getUpload();
        String filename=upload.getOriginalFilename();
        upload.transferTo(new File(path+"/"+rootDir,filename));

        programTask.setFilePath(path+"/"+rootDir+"/"+filename);
        programTask.setFileName(filename);
        courseService.saveIndividualTask(programTask);

//        request.getRequestDispatcher("/pages/class-management.jsp").forward(request,response);
//        return;
    }

    @RequestMapping("/saveGroupTask")
    public @ResponseBody void saveGroupTask(GroupProgramTask groupProgramTask,MultipartFile build,HttpServletRequest request, HttpServletResponse response) throws Exception {
        String courseNameAndYear = request.getParameter("courseNameAndYear");
        String projectName = request.getParameter("projectName");
        String year = courseNameAndYear.substring(4);
        int courseId = courseService.findCourseId(Integer.parseInt(year));
        int projectId = courseService.findProjectIdByCourseIdAndProjectName(courseId,projectName);
        int count = courseService.phaseCount(courseId, projectId);
        groupProgramTask.setCourseId(courseId);
        groupProgramTask.setProjectId(projectId);
        groupProgramTask.setPhaseId(++count);
        groupProgramTask.setPhaseType("小组");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String path=request.getSession().getServletContext().getRealPath("/uploads/"+year);
        String rootDir=courseId+"-"+projectId+"-"+count;
        File file=new File(path+"/"+rootDir);


        courseService.mkGroupdirs(file,build);//创建该关卡的目录结构


        MultipartHttpServletRequest params=(MultipartHttpServletRequest)request;
        List<MultipartFile> files = params.getFiles("testCaseAndStandardout");
        for(MultipartFile f:files) {
            File file1;
            String name = "";
            try {
                if (f instanceof CommonsMultipartFile) {
                    //转换成这个对象，然后我们需要通过里面的FileItem来获得相对路径
                    CommonsMultipartFile f2 = (CommonsMultipartFile) f;
                    name = f2.getFileItem().getName();
                    file1 = new File(path+"/"+rootDir + "/" + "testCaseAndStandardout/" +name.split("/")[1]);
                    file1.mkdirs();
                    file1.createNewFile();
                    f.transferTo(file1);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


        MultipartFile upload = groupProgramTask.getUpload();
        String filename = upload.getOriginalFilename();
        upload.transferTo(new File(path+"/"+rootDir, filename));
        groupProgramTask.setFilePath(path+"/"+rootDir+"/"+filename);
        groupProgramTask.setFileName(filename);
        courseService.saveGroupTask(groupProgramTask);
//        request.getRequestDispatcher("/pages/class-management.jsp").forward(request, response);
//        return;
    }
    @RequestMapping("/findAllCourse")
    public ModelAndView findAllCourse(HttpServletRequest request){
        ModelAndView mv=new ModelAndView();
        List<Course> courses = courseService.findAllCourse();
        //String[] coursesArr=new String[courses.size()];
        List<String> courseList=new ArrayList<String>();
        for(int i=0;i<courses.size();i++){
            courseList.add("人工智能"+courses.get(i).getYear());
            //coursesArr[i]="人工智能"+courses.get(i).getYear();
            System.out.println(courseList.get(i));
        }
        //HttpSession session = request.getSession();
        //session.setAttribute("courses",coursesArr);
        mv.addObject("courses",courseList);
        //mv.addObject("courses",coursesArr);
        mv.setViewName("manual-input");
        return mv;
    }

    @RequestMapping("/findAllCourseAndAllProject")
    public @ResponseBody String[] findAllCourseAndAllProject(HttpServletRequest request){
        List<Course> courses = courseService.findAllCourse();
        String[] coursesArr=new String[courses.size()];
        for(int i=0;i<courses.size();i++){
            //courseList.add("人工智能"+courses.get(i).getYear());
            coursesArr[i]="人工智能"+courses.get(i).getYear();
        }
        return coursesArr;
    }

    @RequestMapping("/showData1")
    public @ResponseBody List<GroupInformation> showData1(String courseNameAndYear,HttpServletRequest request){
        String year = courseNameAndYear.substring(4);
        int courseId = courseService.findCourseId(Integer.parseInt(year));
        return courseService.findAllGroupByCourseId(courseId);
    }

    @RequestMapping("/findProjectNameByCourseId")
    public @ResponseBody String[] findProjectNameByCourseId(String courseNameAndYear,HttpServletRequest request){
        String year = courseNameAndYear.substring(4);
        int courseId = courseService.findCourseId(Integer.parseInt(year));
        String[] projects = courseService.findProjectNameByCourseId(courseId);
        for(int i=0;i<projects.length;i++){
            System.out.println(projects[i]);
        }
        return projects;
    }

    @RequestMapping("/findCourseInfo")
    public @ResponseBody List<CourseInfo> findCourseInfo(){
        return courseService.findCourseInfo();
    }

    @RequestMapping("/download")
    public ResponseEntity<byte[]> download(HttpServletRequest request, @RequestParam("filename") String fileName, Model model) throws Exception{
        String path=request.getServletContext().getRealPath("/uploads/21180231324/");

        File file=new File(path+File.separator+fileName);//修改
        HttpHeaders headers=new HttpHeaders();
        String downloadFileName=new String(fileName.getBytes("UTF-8"),"iso-8859-1");
        headers.setContentDispositionFormData("attachment",downloadFileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }

    @RequestMapping("/findProjectNameByYear")
    public @ResponseBody String[] findProjectNameByYear(){
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        String[] projects = courseService.findProjectNameByCourseId(courseId);
        return projects;
    }

    @RequestMapping("/uploadReport")
    public @ResponseBody String[] uploadReport(MultipartFile upload,HttpServletRequest request) throws IOException {
        //String[] project=new String[];
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        String[] projects = courseService.findProjectNameByCourseId(courseId);
        String projectName = request.getParameter("project");
        int projectId = courseService.findProjectIdByCourseIdAndProjectName(courseId,projectName);
        GroupReport report=new GroupReport();
        report.setCourseId(courseId);
        report.setProjectId(projectId);
        HttpSession session = request.getSession();
        User user = (User)(session.getAttribute("user"));
        report.setGroupId(user.getGroupId());
        String path=session.getServletContext().getRealPath("/uploads/"+user.getStudentId());
        String fileName=upload.getOriginalFilename();
        report.setReportURL(path+File.separator+fileName);
        File filepath=new File(path,fileName);
        if(!filepath.getParentFile().exists()){
            filepath.getParentFile().mkdirs();
        }
        upload.transferTo(new File(path+File.separator+fileName));
        courseService.saveReport(report);
        return projects;
    }

    @RequestMapping("/inputGroupContribution")
    public @ResponseBody void inputGroupContribution(String project,String[] contribution,HttpServletRequest request){
        StudentParticipateProject studentParticipateProject=new StudentParticipateProject();
        HttpSession session = request.getSession();
        List<User> currentGroupInfo = (List<User>)session.getAttribute("currentGroupInfo");
        System.out.println(project);
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        int projectId = courseService.findProjectIdByCourseIdAndProjectName(courseId, project);
        int count=contribution.length;
        for(int i=0;i<count;i++){
            studentParticipateProject.setCourseId(courseId);
            studentParticipateProject.setStudentId(currentGroupInfo.get(i).getStudentId());
            studentParticipateProject.setProjectId(projectId);
            studentParticipateProject.setContribution(Double.parseDouble(contribution[i]));
            courseService.saveStudentParticipateProject(studentParticipateProject);
        }
    }

    @RequestMapping("/reportScore")
    public @ResponseBody void reportScore(String course,String project,String[] score,HttpServletRequest request){
        String year = course.substring(4);
        int courseId = courseService.findCourseId(Integer.parseInt(year));
        int groupCount = userService.groupCount(courseId);
        int projectId = courseService.findProjectIdByCourseIdAndProjectName(courseId,project);
        for(int i=1;i<=groupCount;i++){
            courseService.saveReportScore(courseId,projectId,i,Integer.parseInt(score[i-1]));
        }

    }

    @RequestMapping("/regularScore")
    public @ResponseBody void regularScore(String course,String[] regularScore){
        String year = course.substring(4);
        int courseId = courseService.findCourseId(Integer.parseInt(year));
        List<User> users = userService.findAllStudentByCourseId(courseId);
        int count=users.size();
        for(int i=0;i<count;i++){
            courseService.saveRegularScore(courseId,users.get(i).getStudentId(),Integer.parseInt(regularScore[i]));
        }
    }

    @RequestMapping("/findPhaseNameByCourseIdAndProjectId")
    public @ResponseBody String[] findPhaseNameByCourseIdAndProjectId(String courseNameAndYear,String projectName,HttpServletRequest request){
        String year = courseNameAndYear.substring(4);
        int courseId = courseService.findCourseId(Integer.parseInt(year));
        int projectId = courseService.findProjectIdByCourseIdAndProjectName(courseId,projectName);
        String[] phaseName=courseService.findPhaseNameByCourseIdAndProjectId(courseId,projectId);
        return phaseName;

    }

    @RequestMapping("/codeQualityScore")
    public @ResponseBody void codeQualityScore(String course,String project,String phase,String[] score){
        String year = course.substring(4);
        int courseId = courseService.findCourseId(Integer.parseInt(year));
        int projectId = courseService.findProjectIdByCourseIdAndProjectName(courseId,project);
        int phaseId=courseService.findPhaseIdByCourseIdAndProjectIdAndPhaseName(courseId,projectId,phase);
        System.out.println("阶段号："+phaseId);
        int groupCount = userService.groupCount(courseId);
        GroupTaskCode groupTaskCode=new GroupTaskCode();
        groupTaskCode.setCourseId(courseId);
        groupTaskCode.setProjectId(projectId);
        groupTaskCode.setPhaseId(phaseId);
        for(int i=0;i<groupCount;i++){
            groupTaskCode.setGroupId(i+1);
            groupTaskCode.setCodeQualityScore(Integer.parseInt(score[i]));
            courseService.saveCodeQualityScore(groupTaskCode);
        }

    }

    @RequestMapping("/showData3")
    public @ResponseBody List<GroupInformation> showData3(String project,HttpServletRequest request){
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int groupId=user.getGroupId();
        List<GroupInformation> groupInformation = courseService.findGroupWithoutSelf(courseId, groupId);

        int[] groupIdWithoutSelf=new int[groupInformation.size()];
        for(int i=0;i<groupIdWithoutSelf.length;i++){
            groupIdWithoutSelf[i]=groupInformation.get(i).getGroupId();
        }
        for(int i=0;i<groupIdWithoutSelf.length;i++){
            System.out.println(groupIdWithoutSelf[i]);
        }
        session.setAttribute("groupIdWithoutSelf",groupIdWithoutSelf);

        return  groupInformation;
    }

    @RequestMapping("/saveGroupEvaluation")
    public @ResponseBody void saveGroupEvaluation(String project,String[] score,HttpServletRequest request){
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        int projectId = courseService.findProjectIdByCourseIdAndProjectName(courseId,project);
        HttpSession session = request.getSession();
        int[] groupIdWithoutSelf = (int[])session.getAttribute("groupIdWithoutSelf");
        GroupEvaluationTotalScore groupEvaluationTotalScore=new GroupEvaluationTotalScore();
        groupEvaluationTotalScore.setCourseId(courseId);
        groupEvaluationTotalScore.setProjectId(projectId);
        User user = (User)session.getAttribute("user");
        groupEvaluationTotalScore.setEvaluationGroupId(user.getGroupId());//点评组组号(登录的人)
        for(int i=0;i<groupIdWithoutSelf.length;i++){
            groupEvaluationTotalScore.setGroupId(groupIdWithoutSelf[i]);
            groupEvaluationTotalScore.setEvaluationTotalScore(Integer.parseInt(score[i]));
            courseService.saveGroupEvaluationTotalScore(groupEvaluationTotalScore);
        }
    }

    @RequestMapping("/downloadCurrentStage")
    public ResponseEntity<byte[]> downloadCurrentStage(HttpServletRequest request) throws Exception{

        HttpSession session = request.getSession();
        String currentStagePDFPath = (String) session.getAttribute("currentStagePDFPath");
        String currentStagePDFName = (String) session.getAttribute("currentStagePDFName");

        File file=new File(currentStagePDFPath);//修改
        HttpHeaders headers=new HttpHeaders();
        String downloadFileName=new String(currentStagePDFName.getBytes("UTF-8"),"iso-8859-1");
        headers.setContentDispositionFormData("attachment",downloadFileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }

//    @RequestMapping("/showData2")
//    public @ResponseBody List<CourseInfo> showData2(HttpServletRequest request){
//        int year = Calendar.getInstance().get(Calendar.YEAR);
//        int courseId = courseService.findCourseId(year);
//        HttpSession session = request.getSession();
//        User user = (User) session.getAttribute("user");
//        int groupId=user.getGroupId();
//        String studentId=user.getStudentId();
//        int projectId=0;
//        int phaseId=0;
//        String currentData = new SimpleDateFormat("yyyy年MM月dd日").format(new Date());
//        List<CourseInfo> courseInfos=courseService.findCourseInfoByYear(year,currentData);
//        for (CourseInfo courseInfo: courseInfos) {
//            if("小组".equals(courseInfo.getPhaseType())){
//                projectId=courseService.findProjectIdByCourseIdAndProjectName(courseId,courseInfo.getProjectName());
//                phaseId=courseService.findPhaseIdByCourseIdAndProjectIdAndPhaseName(courseId,projectId,courseInfo.getPhaseName());
//                try {
//                    courseInfo.setScore(courseService.findOJScorerFromGroupTaskCode(courseId,projectId,phaseId,groupId));
//                }catch (Exception e){
//                    courseInfo.setScore(0);
//                }
//
//            }else{
//                projectId=courseService.findProjectIdByCourseIdAndProjectName(courseId,courseInfo.getProjectName());
//                phaseId=courseService.findPhaseIdByCourseIdAndProjectIdAndPhaseName(courseId,projectId,courseInfo.getPhaseName());
//                try {
//                    courseInfo.setScore(courseService.findOJScorerFromIndividualTaskCode(courseId,projectId,phaseId,studentId));
//                }catch (Exception e){
//                    courseInfo.setScore(0);
//                }
//            }
//        }
//        return courseInfos;
//    }

    @RequestMapping("/showData2")
    public @ResponseBody List<Project> showData2(HttpServletRequest request){
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int groupId=user.getGroupId();
        String studentId=user.getStudentId();
        int projectId=0;
        int phaseId=0;
        String currentData = new SimpleDateFormat("yyyy年MM月dd日").format(new Date());
        List<Project> projects=courseService.findProjectByCourseIdAndCurrentData(courseId,currentData);
        ArrayList<ProgramTask> list=new ArrayList<ProgramTask>();
        for (Project project: projects) {
            project.setGroupContribution(courseService.getContribution(courseId,studentId,project.getProjectId()));
            project.setGroupEvaluation(courseService.getGroupEvaluation(courseId,project.getProjectId(),groupId));
            project.setReportScore(courseService.getReportScore(courseId,project.getProjectId(),groupId));
            project.setTotalScore(courseService.getTotalScore(courseId,studentId,project.getProjectId()));
            list.addAll(courseService.getGroupTaskList(courseId,project.getProjectId(),groupId,currentData));
            list.addAll(courseService.getIndividualTaskList(courseId,project.getProjectId(),studentId,currentData));
            project.setProgramTasks(list);

            list=new ArrayList<ProgramTask>();
        }

        return projects;
    }

//    @RequestMapping("/showData2")
//    public ModelAndView showData2(HttpServletRequest request){
//        ModelAndView mv=new ModelAndView();
//        int year = Calendar.getInstance().get(Calendar.YEAR);
//        int courseId = courseService.findCourseId(year);
//        HttpSession session = request.getSession();
//        User user = (User) session.getAttribute("user");
//        int groupId=user.getGroupId();
//        String studentId=user.getStudentId();
//        int projectId=0;
//        int phaseId=0;
//        String currentData = new SimpleDateFormat("yyyy年MM月dd日").format(new Date());
//        List<Project> projects=courseService.findProjectByCourseIdAndCurrentData(courseId,currentData);
//        ArrayList<ProgramTask> list=new ArrayList<ProgramTask>();
//        for (Project project: projects) {
//            project.setGroupContribution(courseService.getContribution(courseId,studentId,project.getProjectId()));
//            project.setGroupEvaluation(courseService.getGroupEvaluation(courseId,project.getProjectId(),groupId));
//            project.setReportScore(courseService.getReportScore(courseId,project.getProjectId(),groupId));
//            project.setTotalScore(courseService.getTotalScore(courseId,studentId,project.getProjectId()));
//            list.addAll(courseService.getGroupTaskList(courseId,project.getProjectId(),groupId,currentData));
//            list.addAll(courseService.getIndividualTaskList(courseId,project.getProjectId(),studentId,currentData));
//            project.setProgramTasks(list);
//
//            list=new ArrayList<ProgramTask>();
//        }
//        mv.addObject("projects",projects);
//
//        return mv;
//    }

    @RequestMapping("/findAllProjectsByCurrentYear")
    public @ResponseBody String[] findAllProjectsByCurrentYear(){
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        String[] projects = courseService.findProjectNameByCourseId(courseId);
        return projects;
    }
    int courseId=0;
    int projectId=0;

    @RequestMapping("/showData4")
    public @ResponseBody List<CalculateProjectScore> showData4(String project,HttpServletRequest request){
        System.out.println(project);
        int year = Calendar.getInstance().get(Calendar.YEAR);
        courseId = courseService.findCourseId(year);
        projectId = courseService.findProjectIdByCourseIdAndProjectName(courseId,project);
        List<CalculateProjectScore> calculateProjectScore = courseService.calProjectScore(courseId, projectId);
        HttpSession session = request.getSession();
        session.setAttribute("calculateProjectScore",calculateProjectScore);

        return calculateProjectScore;
    }
    @RequestMapping("/saveSingleProjectScore")
    public @ResponseBody void saveSingleProjectScore(String[] projectScore,HttpServletRequest request){

        HttpSession session = request.getSession();
        List<CalculateProjectScore> calculateProjectScore = (List<CalculateProjectScore>)session.getAttribute("calculateProjectScore");

        for(int i=0;i<calculateProjectScore.size();i++){
            courseService.saveSingleProjectScore(courseId,calculateProjectScore.get(i).getStudentId(),projectId,Integer.parseInt(projectScore[i]));
        }
    }

    @RequestMapping("/calAllProjectScore")
    public @ResponseBody List<AllProjectScore> calAllProjectScore(HttpServletRequest request){
        int year = Calendar.getInstance().get(Calendar.YEAR);
        courseId = courseService.findCourseId(year);
        List<AllProjectScore> allProjectScore = courseService.calAllProjectScore(year);
        HttpSession session = request.getSession();
        session.setAttribute("allProjectScore",allProjectScore);
        return allProjectScore;
    }

    @RequestMapping("/saveProjectTotalScore")
    public @ResponseBody void saveProjectTotalScore(String[] projectTotalScore,HttpServletRequest request){

        HttpSession session = request.getSession();
        List<AllProjectScore> allProjectScore = (List<AllProjectScore>)session.getAttribute("allProjectScore");
        for(int i=0;i<allProjectScore.size();i++){

            courseService.saveProjectTotalScore(courseId,allProjectScore.get(i).getStudentId(),Double.parseDouble(projectTotalScore[i]));
        }


    }

    @RequestMapping("/calCourseScore")
    public @ResponseBody List<CourseScore> calCourseScore(HttpServletRequest request){
        int year = Calendar.getInstance().get(Calendar.YEAR);
        courseId = courseService.findCourseId(year);
        List<CourseScore> courseScore = courseService.calCourseScore(year);
        HttpSession session = request.getSession();
        session.setAttribute("courseScore",courseScore);
        return courseScore;
    }

    @RequestMapping("/saveCourseTotalScore")
    public @ResponseBody void saveCourseTotalScore(String[] totalScore,HttpServletRequest request) {
        int year = Calendar.getInstance().get(Calendar.YEAR);
        courseId = courseService.findCourseId(year);
        HttpSession session = request.getSession();
        List<CourseScore> courseScore = (List<CourseScore>)session.getAttribute("courseScore");
        for(int i=0;i<courseScore.size();i++){
            courseService.saveCourseTotalScore(courseId,courseScore.get(i).getStudentId(),Integer.parseInt(totalScore[i]));
        }
    }
}