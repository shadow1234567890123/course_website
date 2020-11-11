package ouc.zhx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ouc.zhx.dao.ICourseDao;
import ouc.zhx.dao.IProjectDao;
import ouc.zhx.dao.IUserDao;
import ouc.zhx.domain.*;
import ouc.zhx.service.ICourseService;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

@Service
public class CourseServiceImpl implements ICourseService{

    @Autowired
    ICourseDao courseDao;

    @Autowired
    IUserDao userDao;

    @Autowired
    IProjectDao projectDao;

    @Autowired
    ICourseService courseService;

    public void saveCourse(Course course) {
        courseDao.saveCourse(course);
    }

    public void saveProject(Project project) {
        courseDao.saveProject(project);
    }

    public void saveIndividualTask(ProgramTask programTask){ courseDao.saveIndividualTask(programTask);}

    public void saveGroupTask(GroupProgramTask groupProgramTask) {
        courseDao.saveGroupTask(groupProgramTask);
    }

    public List<Course> findAllCourse(){return courseDao.findAllCourse();}

    public int findCourseId(int year) {
        return courseDao.findCourseId(year);
    }

    public String[] findProjectNameByCourseId(int courseId) {
        return courseDao.findProjectNameByCourseId(courseId);
    }

    public int projectCountByCourseId(int courseId) {
        return courseDao.projectCountByCourseId(courseId);
    }

    public int findProjectIdByProjectName(String projectName) {
        return courseDao.findProjectIdByProjectName(projectName);
    }

    public int phaseCount(int courseId, int projectId) {
        return courseDao.phaseCount(courseId,projectId);
    }

    public List<CourseInfo> findCourseInfo() {
        return courseDao.findCourseInfo();
    }

    public List<GroupInformation> findAllGroupByCourseId(int courseId) {
        return courseDao.findAllGroupByCourseId(courseId);
    }

    public int findProjectIdByCourseIdAndProjectName(int courseId, String projectName) {
        return courseDao.findProjectIdByCourseIdAndProjectName(courseId,projectName);
    }

    public void saveReport(GroupReport report) {
        courseDao.saveReport(report);
    }

    public void saveStudentParticipateProject(StudentParticipateProject studentParticipateProject) {
        courseDao.saveStudentParticipateProject(studentParticipateProject);
    }

    public void saveReportScore(int courseId, int projectId, int groupId, int reportScore) {
        courseDao.saveReportScore(courseId,projectId,groupId,reportScore);
    }

    public void saveRegularScore(int courseId, String studentId, int regularScore) {
        courseDao.saveRegularScore(courseId,studentId,regularScore);
    }

    public String[] findPhaseNameByCourseIdAndProjectId(int courseId, int projectId) {
        return courseDao.findPhaseNameByCourseIdAndProjectId(courseId,projectId);
    }

    public int findPhaseIdByCourseIdAndProjectIdAndPhaseName(int courseId, int projectId, String phaseName) {
        return courseDao.findPhaseIdByCourseIdAndProjectIdAndPhaseName(courseId,projectId,phaseName);
    }

    public void saveCodeQualityScore(GroupTaskCode groupTaskCode) {
        courseDao.saveCodeQualityScore(groupTaskCode);
    }

    public List<GroupInformation> findGroupWithoutSelf(int courseId, int groupId) {
        return courseDao.findGroupWithoutSelf(courseId,groupId);
    }

    public void saveGroupEvaluationTotalScore(GroupEvaluationTotalScore groupEvaluationTotalScore) {
        courseDao.saveGroupEvaluationTotalScore(groupEvaluationTotalScore);
    }

    public List<Project> findAllProjectByCourseId(int courseId) {
        return courseDao.findAllProjectByCourseId(courseId);
    }

    public List<GroupProgramTask> findAllPhaseByCourseIdAndProjectId(int courseId, int projectId) {
        return courseDao.findAllPhaseByCourseIdAndProjectId(courseId,projectId);
    }

    public void saveOJScoreOfGroupTaskCode(GroupTaskCode groupTaskCode) {
        courseDao.saveOJScoreOfGroupTaskCode(groupTaskCode);
    }

    public void saveOJScoreOfIndividualTaskCode(IndividualTaskCode individualTaskCode) {
        courseDao.saveOJScoreOfIndividualTaskCode(individualTaskCode);
    }

    public void saveGroupInformation(GroupInformation groupInformation){
        courseDao.saveGroupInformation(groupInformation);
    }

    public List<CourseInfo> findCourseInfoByYear(int year,String currentData){
        return courseDao.findCourseInfoByYear(year,currentData);
    }

    public List<Project> findProjectByCourseIdAndCurrentData(int year, String currentData){
        return  courseDao.findProjectByCourseIdAndCurrentData(year,currentData);
    }

    public int findOJScorerFromGroupTaskCode(int courseId, int projectId, int phaseId, int groupId) {
        return courseDao.findOJScorerFromGroupTaskCode(courseId,projectId,phaseId,groupId);
    }

    public int findOJScorerFromIndividualTaskCode(int courseId, int projectId, int phaseId, String studentId) {
        return courseDao.findOJScorerFromIndividualTaskCode(courseId,projectId,phaseId,studentId);
    }

    public Double getContribution(int courseId, String studentId, Integer projectId){
        return  courseDao.getContribution(courseId,studentId,projectId);
    }

    public Double getGroupEvaluation(int courseId, Integer projectId, int groupId){
        return courseDao.getGroupEvaluation(courseId,projectId,groupId);
    }

    public Integer getReportScore(int courseId, Integer projectId, int groupId){
        return  courseDao.getReportScore(courseId,projectId,groupId);
    }

    public Double getTotalScore(int courseId, String studentId, Integer projectId){
        return courseDao.getTotalScore(courseId,studentId,projectId);
    }
    public List<ProgramTask> getGroupTaskList(int courseId, int projectId, int groupId, String currentData){
        return  courseDao.getGroupTaskList(courseId,projectId,groupId,currentData);
    }
    public List<ProgramTask> getIndividualTaskList(int courseId, Integer projectId, String studentId, String currentData){
        return  courseDao.getIndividualTaskList(courseId,projectId,studentId,currentData);
    }

    public List<CalculateProjectScore> calProjectScore(int courseId, int projectId) {
        List<CalculateProjectScore> projectScoreList = courseDao.calProjectScore(courseId, projectId);
        int individualCount=0;
        int groupCount=0;
        int OJScore;
        Project project = projectDao.findCurrentProject(courseId, projectId);
        double individualProportion=Double.parseDouble(project.getIndividualTaskProportion())/100;
        double groupProportion=Double.parseDouble(project.getGroupTaskProportion())/100;
        double reportProportion=Double.parseDouble(project.getReportProportion())/100;

        List<Integer> groupIdList=courseDao.findGroupIdByCourseId(courseId);
        HashMap<Integer,Integer> groupMemberNum=new HashMap<Integer, Integer>();
        for(Integer groupId:groupIdList){
            groupMemberNum.put(groupId,courseDao.findGroupMemberCountBycourseIdAndGroupId(courseId,groupId));
        }
        groupMemberNum.remove(groupMemberNum.size()-1);

        double OJProportion=0;
        double codeQualityProportion=0;
        double singleOJProportion=0;
        double singleCodeQualityProportion=0;
        List<GroupProgramTask> allPhases = courseDao.findAllPhaseByCourseIdAndProjectId(courseId, projectId);
        List<GroupProgramTask> groupPhases=new ArrayList<GroupProgramTask>();
        for(GroupProgramTask task:allPhases){
                if(task.getPhaseType().equals("小组")){
                groupCount++;
                groupPhases.add(task);
            }
            else individualCount++;
        }

        if(groupCount==0){
            System.out.println("groupCount=0");
        }else if(individualCount==0){
            System.out.println("individualCount=0");//待补充
        }else{
            double singleIndividualProportion=individualProportion/individualCount;
            for(CalculateProjectScore calculateProjectScore:projectScoreList){
                OJScore=0;
                try {
                    String[] individualScore=calculateProjectScore.getScore1().split(",");
                    for(int i=0;i<individualCount;i++){//计算个人任务得分
                        OJScore+=Integer.parseInt(individualScore[i])*singleIndividualProportion;
                    }
                }catch (Exception e){}

                try {
                    String[] groupOJScore=calculateProjectScore.getScore2().split(",");
                    double sumOJ=0;
                    for(int i=0;i<groupCount;i++){//计算小组任务OJ得分
                        try {
                            OJProportion=Double.parseDouble(groupPhases.get(i).getOJScoreProportion())/100;
                            //singleOJProportion=groupProportion/groupCount*OJProportion;
                            double groupContribution = calculateProjectScore.getGroupContribution()/(double)100;
                            sumOJ+=((Double.parseDouble(groupOJScore[i])*OJProportion*(0.6+0.4*groupContribution*groupMemberNum.get(calculateProjectScore.getGroupId()))))/3;

                        }catch (Exception e){
                            OJScore+=0;
                        }
                    }
                    OJScore+=sumOJ*groupProportion;
                }catch (Exception e){}

                try {
                    String[] groupCodeQualityScore=calculateProjectScore.getScore3().split(",");//计算小组任务代码质量得分
                    double sumCodeQualityScore=0;
                    for(int i=0;i<groupCount;i++){
                        try {
                            codeQualityProportion= Double.parseDouble(groupPhases.get(i).getCodeQualityScoreProportion())/100;
                            //singleCodeQualityProportion=groupProportion/groupCount*codeQualityProportion;
                            double groupContri = calculateProjectScore.getGroupContribution()/(double)100;
                            sumCodeQualityScore+=(Double.parseDouble(groupCodeQualityScore[i])*codeQualityProportion*(0.6+0.4*groupContri*groupMemberNum.get(calculateProjectScore.getGroupId())))/3;

                        }catch (Exception e){
                            OJScore+=0;
                        }
                    }
                    OJScore+=sumCodeQualityScore*groupProportion;
                }catch (Exception e){}

                try { //计算研发报告得分
                    OJScore+=calculateProjectScore.getReportScore()*reportProportion;
                }catch (Exception e){
                    OJScore+=0;
                }
                calculateProjectScore.setProjectScore(OJScore);

            }


        }



        return projectScoreList;
    }

    public List<AllProjectScore> calAllProjectScore(int year) {
        int courseId = courseService.findCourseId(year);
        int count = courseService.findAllProjectByCourseId(courseId).size();
        List<AllProjectScore> allProjectScores = courseDao.calAllProjectScore(courseId);
        double projectScore;
        for(AllProjectScore allProjectScore:allProjectScores){
            projectScore=0;
            String allScore = allProjectScore.getAllScore();
            if(allScore!=null){
                String[] split = allScore.split(",");
                for(int i=0;i<split.length;i++){
                    projectScore+=Double.parseDouble(split[i]);
                }
                //projectScore=projectScore/3;
                projectScore=(double)Math.round(projectScore/count*10)/10;
            }
            allProjectScore.setTotalProjectScore(projectScore);
        }
        return allProjectScores;
    }

    public List<CourseScore> calCourseScore(int year) {
        int courseId = courseService.findCourseId(year);
        List<CourseScore> courseScores = courseDao.calCourseScore(courseId);
        double score;
        Double allProjectScore;
        Integer regularScore;
        for(CourseScore courseScore:courseScores){
            score=0;
            allProjectScore=courseScore.getAllProjectScore();
            regularScore=courseScore.getRegularScore();
            if(allProjectScore==null&&regularScore==null){
                score=0;
            }else if(allProjectScore==null){
                score=regularScore;
            }else if(regularScore==null){
                //score=(int) (allProjectScore*0.9);
                score = (double)Math.round(allProjectScore * 0.9*10)/10;
            }else{
                //score = (int)(courseScore.getAllProjectScore() * 0.9 + courseScore.getRegularScore());
                score = (double)Math.round(allProjectScore * 0.9*10)/10 + courseScore.getRegularScore();
            }

            courseScore.setCourseTotalScore(score);
        }

        return courseScores;
    }

    public void mkIndividualdirs(File file, MultipartFile build) {
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        List<User> users = userDao.findAllStudentByCourseId(courseId);
        file.mkdir();
        File temp;
        for(User user:users){
            temp= new File(file, user.getStudentId());
            temp.mkdir();
            //String filename=build.getOriginalFilename();
//            try {
//                build.transferTo(new File(temp,filename));
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
        }
        new File(file,"testCaseAndStandardout").mkdir();
    }

    public void saveSingleProjectScore(int courseId, String studentId, int projectId, int score) {
        courseDao.saveSingleProjectScore(courseId,studentId,projectId,score);
    }

    public void saveProjectTotalScore(int courseId, String studentId, double allProjectScore) {
        courseDao.saveProjectTotalScore(courseId,studentId,allProjectScore);
    }

    public void saveCourseTotalScore(int courseId, String studentId, int courseTotalScore) {
        courseDao.saveCourseTotalScore(courseId,studentId,courseTotalScore);
    }

    public void saveRecordOfIndividualTaskCode(IndividualTaskCode individualTaskCode) {
        courseDao.saveRecordOfIndividualTaskCode(individualTaskCode);
    }

    public List<IndividualTaskCode> findRecordOfIndividual(int courseId, int projectId, int phaseId, String studentId) {
        return courseDao.findRecordOfIndividual(courseId,projectId,phaseId,studentId);
    }

    public void saveRecordOfGroupTaskCode(GroupTaskCode groupTaskCode) {
        courseDao.saveRecordOfGroupTaskCode(groupTaskCode);
    }

    public List<GroupTaskCode> findRecordOfGroup(int courseId, int projectId, int phaseId, Integer groupId) {
        return courseDao.findRecordOfGroup(courseId,projectId,phaseId,groupId);
    }

    public void mkGroupdirs(File file, MultipartFile build) {
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        List<GroupInformation> groups = userDao.findAllGroupByCourseId(courseId);
        file.mkdir();
        File temp;
        for(GroupInformation group:groups){
            temp= new File(file, "G"+group.getGroupId() + "");
            temp.mkdir();
            //String filename=build.getOriginalFilename();
//            try {
//                build.transferTo(new File(temp,filename));
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
        }
        new File(file,"testCaseAndStandardout").mkdir();
    }


}
