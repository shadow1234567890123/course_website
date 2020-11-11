package ouc.zhx.service;

import org.springframework.web.multipart.MultipartFile;
import ouc.zhx.domain.*;

import java.io.File;
import java.security.acl.Group;
import java.util.Collection;
import java.util.List;

public interface ICourseService {

    public void saveCourse(Course course);

    public void saveProject(Project project);

    public void saveIndividualTask(ProgramTask programTask);

    public void saveGroupTask(GroupProgramTask groupProgramTask);

    public List<Course> findAllCourse();

    public int findCourseId(int year);

    public String[] findProjectNameByCourseId(int courseId);

    public int projectCountByCourseId(int courseId);


    public int findProjectIdByProjectName(String projectName);

    public int phaseCount(int courseId,int projectId);

    public List<CourseInfo> findCourseInfo();

    public List<GroupInformation> findAllGroupByCourseId(int courseId);

    public int findProjectIdByCourseIdAndProjectName(int courseId,String projectName);

    public void saveReport(GroupReport report);

    public void saveStudentParticipateProject(StudentParticipateProject studentParticipateProject);

    public void saveReportScore(int courseId,int projectId,int groupId,int reportScore);

    public void saveRegularScore(int courseId,String studentId,int regularScore);

    public String[] findPhaseNameByCourseIdAndProjectId(int courseId,int projectId);

    public int findPhaseIdByCourseIdAndProjectIdAndPhaseName(int courseId,int projectId,String phaseName);

    public void saveCodeQualityScore(GroupTaskCode groupTaskCode);

    public List<GroupInformation> findGroupWithoutSelf(int courseId,int groupId);

    public void saveGroupEvaluationTotalScore(GroupEvaluationTotalScore groupEvaluationTotalScore);

    public List<Project> findAllProjectByCourseId(int courseId);

    public List<GroupProgramTask> findAllPhaseByCourseIdAndProjectId(int courseId,int projectId);

    public void saveOJScoreOfGroupTaskCode(GroupTaskCode groupTaskCode);

    public void saveOJScoreOfIndividualTaskCode(IndividualTaskCode individualTaskCode);

    public void saveGroupInformation(GroupInformation groupInformation);

    public List<CourseInfo> findCourseInfoByYear(int year,String currentData);

    public int findOJScorerFromGroupTaskCode(int courseId,int projectId,int phaseId,int groupId);

    public int findOJScorerFromIndividualTaskCode(int courseId,int projectId,int phaseId,String studentId);

    public List<CalculateProjectScore> calProjectScore(int courseId,int projectId);

    public List<AllProjectScore> calAllProjectScore(int courseId);

    public List<CourseScore> calCourseScore(int courseId);

    void mkGroupdirs(File file, MultipartFile build);

    void mkIndividualdirs(File file, MultipartFile build);

    void saveSingleProjectScore(int courseId, String studentId, int projectId, int score);

    void saveProjectTotalScore(int courseId, String studentId, double allProjectScore);

    void saveCourseTotalScore(int courseId, String studentId, int courseTotalScore);

    void saveRecordOfIndividualTaskCode(IndividualTaskCode individualTaskCode);

    List<IndividualTaskCode> findRecordOfIndividual(int courseId,int projectId,int phaseId,String studentId);

    void saveRecordOfGroupTaskCode(GroupTaskCode groupTaskCode);

    List<GroupTaskCode> findRecordOfGroup(int courseId,int projectId,int phaseId,Integer groupId);

    List<Project> findProjectByCourseIdAndCurrentData(int year, String currentData);

    Double getContribution(int courseId, String studentId, Integer projectId);

    Double getGroupEvaluation(int courseId, Integer projectId, int groupId);

    Integer getReportScore(int courseId, Integer projectId, int groupId);

    Double getTotalScore(int courseId, String studentId, Integer projectId);

    List<ProgramTask> getGroupTaskList(int courseId, int projectId, int groupId, String currentData);

    List<ProgramTask> getIndividualTaskList(int courseId, Integer projectId, String studentId, String currentData);
}
