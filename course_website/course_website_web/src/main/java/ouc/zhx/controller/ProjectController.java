package ouc.zhx.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import ouc.zhx.domain.*;
import ouc.zhx.service.ICourseService;
import ouc.zhx.service.IProjectService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/project")
public class ProjectController {

    @Autowired
    IProjectService projectService;

    @Autowired
    ICourseService courseService;

    @RequestMapping("/filesUpload")
    public @ResponseBody int filesUpload(HttpServletRequest request,String fullClassName) throws Exception {

        return projectService.handleStudentCode(request,fullClassName);

    }

    @RequestMapping("/findCurrentProjectAndStage")
    public ModelAndView findCurrentProjectAndStage(HttpServletRequest request) throws ParseException {
        ModelAndView mv=new ModelAndView();
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        List<Project> projects = courseService.findAllProjectByCourseId(courseId);
        Project currentProject=null;
        Date startTime_project;
        Date endTime_project;
        for(int i=0;i<projects.size();i++){
            Project project=projects.get(i);
            System.out.println(project.getStartDate());
            startTime_project = new SimpleDateFormat("yyyy年MM月dd日").parse(project.getStartDate());
            endTime_project = new SimpleDateFormat("yyyy年MM月dd日").parse(project.getDeadline());
            Date now=new Date();

            Calendar calendar=Calendar.getInstance();
            calendar.setTime(now);
            calendar.add(Calendar.DATE, -1);
            Date yesterday=calendar.getTime();

            if(now.after(startTime_project)&&yesterday.before(endTime_project)){
                currentProject=projects.get(i);
                break;
            }
        }
        GroupProgramTask currentStage=null;
        HttpSession session = request.getSession();
        try{
            List<GroupProgramTask> phases = courseService.findAllPhaseByCourseIdAndProjectId(courseId, currentProject.getProjectId());
            Date startTime_stage;
            Date endTime_stage;
            for(int i=0;i<phases.size();i++){
                GroupProgramTask stage=phases.get(i);
                startTime_stage = new SimpleDateFormat("yyyy年MM月dd日").parse(stage.getStartDate());
                endTime_stage = new SimpleDateFormat("yyyy年MM月dd日").parse(stage.getDeadline());
                Date now=new Date();

                Calendar calendar=Calendar.getInstance();
                calendar.setTime(now);
                calendar.add(Calendar.DATE, -1);
                Date yesterday=calendar.getTime();

                if(now.after(startTime_stage)&&yesterday.before(endTime_stage)){
                    currentStage=stage;
                    break;
                }
            }

            try {
                session.setAttribute("currentStagePDFPath",currentStage.getFilePath());
                session.setAttribute("currentStagePDFName",currentStage.getFileName());
            }catch (Exception e){

            }
        }catch (Exception e){

        }

        User user = (User) session.getAttribute("user");
        if(currentStage!=null&&currentProject!=null){
            if(currentStage.getPhaseType().equals("个人")){
                List<IndividualTaskCode> record=courseService.findRecordOfIndividual(currentProject.getCourseId(),currentProject.getProjectId(),currentStage.getPhaseId(),user.getStudentId());
                mv.addObject("record",record);
            }else{
                List<GroupTaskCode> record=courseService.findRecordOfGroup(currentProject.getCourseId(),currentProject.getProjectId(),currentStage.getPhaseId(),user.getGroupId());
                mv.addObject("record",record);
            }
        }else{
            mv.addObject("record",null);
        }



        Integer groupId=user.getGroupId();
        String studentId=user.getStudentId();
        int projectId=0;
        int phaseId=0;
        String currentData = new SimpleDateFormat("yyyy年MM月dd日").format(new Date());
        List<Project> ps=courseService.findProjectByCourseIdAndCurrentData(courseId,currentData);
        ArrayList<ProgramTask> list=new ArrayList<ProgramTask>();
        for (Project project: ps) {
            project.setGroupContribution(courseService.getContribution(courseId,studentId,project.getProjectId()));
            project.setGroupEvaluation(courseService.getGroupEvaluation(courseId,project.getProjectId(),groupId));
            project.setReportScore(courseService.getReportScore(courseId,project.getProjectId(),groupId));
            project.setTotalScore(courseService.getTotalScore(courseId,studentId,project.getProjectId()));
            list.addAll(courseService.getGroupTaskList(courseId,project.getProjectId(),groupId,currentData));
            list.addAll(courseService.getIndividualTaskList(courseId,project.getProjectId(),studentId,currentData));
            project.setProgramTasks(list);

            list=new ArrayList<ProgramTask>();
        }


        session.setAttribute("currentProject",currentProject);
        session.setAttribute("currentStage",currentStage);
        mv.addObject("currentProject",currentProject);
        mv.addObject("currentStage",currentStage);
        mv.addObject("ps",ps);
        //mv.addObject("record",record);
        mv.setViewName("current-stage");
        return mv;
    }
}
