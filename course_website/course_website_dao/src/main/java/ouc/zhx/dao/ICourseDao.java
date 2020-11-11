
package ouc.zhx.dao;

import org.apache.ibatis.annotations.Select;
import ouc.zhx.domain.*;

import java.util.List;

public interface ICourseDao{

    @Select("insert into course(courseId,courseName,year,courseNumber) values (#{courseId},#{courseName},#{year},#{courseNumber})")
    public void saveCourse(Course course);

    @Select("insert into project(projectId,projectName,reportProportion,individualTaskProportion,groupTaskProportion,deadline,courseId,startDate,projectDescription) values (#{projectId},#{projectName},#{reportProportion},#{individualTaskProportion},#{groupTaskProportion},#{deadline},#{courseId},#{startDate},#{projectDescription})")
    public void saveProject(Project project);

    @Select("insert into groupprogramtask(courseId,projectId,phaseId,runTimeRequirement,similarityThreshold,startDate,deadline,phaseName,phaseType,filePath,fileName) values (#{courseId},#{projectId},#{phaseId},#{runTimeRequirement},#{similarityThreshold},#{startDate},#{deadline},#{phaseName},#{phaseType},#{filePath},#{fileName})")
    public void saveIndividualTask(ProgramTask programTask);

    @Select("insert into groupprogramtask(courseId,projectId,phaseId,runTimeRequirement,similarityThreshold,deadline,phaseName,phaseType,startDate,OJScoreProportion,codeQualityScoreProportion,filePath,fileName) values (#{courseId},#{projectId},#{phaseId},#{runTimeRequirement},#{similarityThreshold},#{deadline},#{phaseName},#{phaseType},#{startDate},#{OJScoreProportion},#{codeQualityScoreProportion},#{filePath},#{fileName})")
    public void saveGroupTask(GroupProgramTask groupProgramTask);

    @Select("select courseId,year from course order by year desc")
    public List<Course> findAllCourse();

    @Select("select courseId from course where year=#{year}")
    public int findCourseId(int year);

    @Select("select projectName from project where courseId=#{courseId}")
    public String[] findProjectNameByCourseId(int courseId);

    @Select("select count(*) from project where courseId=#{courseId}")
    public int projectCountByCourseId(int courseId);

//    @Select("select courseId from course where year=#{year}")
//    public int findCourseIdByCourseYear(int year);

    @Select("select projectId from project where projectName=#{projectName}")
    public int findProjectIdByProjectName(String projectName);

    @Select("select count(*) from groupprogramtask where courseId=#{arg0} and projectId=#{arg1}")
    public int phaseCount(int courseId,int projectId);

    @Select("SELECT c.`year`,p.`projectName`,g.`phaseName`,g.`phaseType`\n" +
            "            FROM course c,project p,groupprogramtask g\n" +
            "            WHERE c.`courseId`=p.`courseId` AND p.`courseId`=g.`courseId` AND p.`projectId`=g.`projectId`\n" +
            "            ORDER BY YEAR DESC,p.projectName ASC,g.`phaseName` ASC")
    public List<CourseInfo> findCourseInfo();

    @Select("select * from groupinformation where courseId=#{courseId}")
    public List<GroupInformation> findAllGroupByCourseId(int courseId);

    @Select("select projectId from project where courseId=#{arg0} and projectName=#{arg1}")
    public int findProjectIdByCourseIdAndProjectName(int courseId,String projectName);

    @Select("insert into groupReport(courseId,projectId,groupId,reportURL) values (#{courseId},#{projectId},#{groupId},#{reportURL}) " +
            "on duplicate key update reportURL=#{reportURL}")
    public void saveReport(GroupReport report);

    @Select("insert into studentparticipateproject(courseId,studentId,projectId,contribution) values (#{courseId},#{studentId},#{projectId},#{contribution}) " +
            "on duplicate key update contribution=#{contribution}")
    public void saveStudentParticipateProject(StudentParticipateProject studentParticipateProject);

    @Select("update groupReport set reportScore=#{arg3} where courseId=#{arg0} and projectId=#{arg1} and groupId=#{arg2}")
    public void saveReportScore(int courseId,int projectId,int groupId,int reportScore);

    @Select("insert into coursescore(courseId,studentId,regularScore) values (#{arg0},#{arg1},#{arg2}) " +
            "on duplicate key update regularScore=#{arg2}")
    public void saveRegularScore(int courseId,String studentId,int regularScore);

    @Select("select phaseName from groupprogramtask where courseId=#{arg0} and projectId=#{arg1} and phaseType='小组'")
    public String[] findPhaseNameByCourseIdAndProjectId(int courseId,int projectId);

    @Select("select phaseId from groupprogramtask where courseId=#{arg0} and projectId=#{arg1} and phaseName=#{arg2}")
    public int findPhaseIdByCourseIdAndProjectIdAndPhaseName(int courseId,int projectId,String phaseName);

    @Select("insert into grouptaskcode(courseId,projectId,phaseId,groupId,codeQualityScore) values (#{courseId},#{projectId},#{phaseId},#{groupId},#{codeQualityScore}) " +
            "on duplicate key update codeQualityScore=#{codeQualityScore}")
    public void saveCodeQualityScore(GroupTaskCode groupTaskCode);

    @Select("select * from groupinformation where courseId=#{arg0} and groupId!=#{arg1}")
    public List<GroupInformation> findGroupWithoutSelf(int courseId,int groupId);

    @Select("insert into groupevaluationtotalscore(courseId,projectId,groupId,evaluationGroupId,evaluationTotalScore) values (#{courseId},#{projectId},#{groupId},#{evaluationGroupId},#{evaluationTotalScore})" +
            "on duplicate key update evaluationTotalScore=#{evaluationTotalScore}")
    public void saveGroupEvaluationTotalScore(GroupEvaluationTotalScore groupEvaluationTotalScore);

    @Select("select * from project where courseId=#{courseId}")
    public List<Project> findAllProjectByCourseId(int courseId);


    @Select("select * from groupprogramtask where courseId=#{arg0} and projectId=#{arg1}")
    public List<GroupProgramTask> findAllPhaseByCourseIdAndProjectId(int courseId,int projectId);

    @Select("insert into grouptaskcode(courseId,projectId,phaseId,groupId,codePath,OJScore) values (#{courseId},#{projectId},#{phaseId},#{groupId},#{codePath},#{OJScore}) " +
            "on duplicate key update codePath=#{codePath},OJScore=#{OJScore}")
    public void saveOJScoreOfGroupTaskCode(GroupTaskCode groupTaskCode);

    @Select("insert into individualtaskcode(courseId,projectId,phaseId,studentId,codePath,OJScore) values (#{courseId},#{projectId},#{phaseId},#{studentId},#{codePath},#{OJScore}) " +
            "on duplicate key update codePath=#{codePath},OJScore=#{OJScore}")
    public void saveOJScoreOfIndividualTaskCode(IndividualTaskCode individualTaskCode);

    @Select("insert into groupinformation(courseId,groupId,groupName,declaration) values (#{courseId},#{groupId},#{groupName},#{declaration})" +
            "on duplicate key update groupName=#{groupName},declaration=#{declaration}")
    public void saveGroupInformation(GroupInformation groupInformation);

    @Select("SELECT c.`year`,p.`projectName`,g.`phaseName`,g.`phaseType`\n" +
            "                        FROM course c,project p,groupprogramtask g\n" +
            "                        WHERE c.`courseId`=p.`courseId` AND p.`courseId`=g.`courseId` AND p.`projectId`=g.`projectId` AND c.`year`=#{arg0} AND g.deadline<#{arg1}\n" +
            "                        ORDER BY p.projectId ASC,g.phaseId ASC")
    public List<CourseInfo> findCourseInfoByYear(int year,String currentData);

    @Select("select OJScore from grouptaskcode where courseId=#{arg0} and projectId=#{arg1} and phaseId=#{arg2} and groupId=#{arg3}")
    public int findOJScorerFromGroupTaskCode(int courseId,int projectId,int phaseId,int groupId);

    @Select("select OJScore from individualtaskcode where courseId=#{arg0} and projectId=#{arg1} and phaseId=#{arg2} and studentId=#{arg3}")
    public int findOJScorerFromIndividualTaskCode(int courseId,int projectId,int phaseId,String studentId);

    @Select("SELECT\n" +
            "            t1.studentId studentId,t1.name studentName,t1.groupId,t1.IOJScore score1,t2.GOJScore score2,t2.GQualityScore score3,t4.groupContribution groupContribution,t5.evaluationTotalScore groupEvaluation,t3.GReportScore reportScore\n" +
            "            FROM\n" +
            "\t\t    (SELECT\n" +
            "\t\t    u.`studentId` studentId,u.`name` NAME,u.groupId groupId,GROUP_CONCAT(i.`OJScore` ORDER BY i.`phaseId`) IOJScore\n" +
            "\t\t    FROM\n" +
            "\t\t    (SELECT *FROM USER WHERE courseId=#{arg0} AND role!=\"助教\") u LEFT JOIN individualtaskcode i\n" +
            "\t\t    ON\n" +
            "\t\t    (u.`studentId`=i.`studentId`) AND i.`projectId`=#{arg1} AND i.`courseId`=#{arg0}\n" +
            "\t\t    GROUP BY\n" +
            "\t\t    studentId) t1,\n" +
            "\t\t    \n" +
            "\t\t    (SELECT \n" +
            "\t\t    u.`studentId` studentId,u.`name` NAME,GROUP_CONCAT(gtc.`OJScore` ORDER BY gtc.`phaseId`) GOJScore,GROUP_CONCAT(gtc.`codeQualityScore` ORDER BY gtc.`phaseId`) GQualityScore \n" +
            "\t\t    FROM \n" +
            "\t\t    (SELECT * FROM USER WHERE courseId=#{arg0} AND role!=\"助教\") u LEFT JOIN grouptaskcode gtc \n" +
            "\t\t    ON \n" +
            "\t\t    (u.`groupId`=gtc.`groupId`) AND u.`courseId`=#{arg0} AND gtc.`projectId`=#{arg1} AND gtc.`courseId`=#{arg0} \n" +
            "\t\t    GROUP BY  \n" +
            "\t\t    studentId) t2, \n" +
            "\t\t    \n" +
            "\t\t    (SELECT  \n" +
            "\t\t    u.`studentId` studentId,u.`name` NAME,GROUP_CONCAT(gr.reportScore) GReportScore \n" +
            "\t\t    FROM \n" +
            "\t\t    (SELECT * FROM USER WHERE courseId=#{arg0} AND role!=\"助教\") u LEFT JOIN groupreport gr \n" +
            "\t\t    ON \n" +
            "\t\t    (u.`groupId`=gr.groupId) AND u.`courseId`=#{arg0} AND gr.projectId=#{arg1} AND gr.courseId=#{arg0} \n" +
            "\t\t    GROUP BY \n" +
            "\t\t    u.`studentId`) t3,\n" +
            "\t\t    \n" +
            "\t\t    (SELECT  \n" +
            "\t\t    u.`studentId` studentId,u.`name` NAME,GROUP_CONCAT(spp.contribution) groupContribution \n" +
            "\t\t    FROM \n" +
            "\t\t    (SELECT * FROM USER WHERE courseId=#{arg0} and role!=\"助教\") u LEFT JOIN studentparticipateproject spp \n" +
            "\t\t    ON \n" +
            "\t\t    (u.`studentId`=spp.studentId) AND u.`courseId`=#{arg0} AND spp.projectId=#{arg1} AND spp.courseId=#{arg0} \n" +
            "\t\t    GROUP BY \n" +
            "\t\t    u.`studentId`) t4,\n" +
            "\t\t    \n" +
            "\t\t    (SELECT  \n" +
            "\t\t    u.`studentId` studentId,u.`name` NAME,AVG(evaluationTotalScore) evaluationTotalScore \n" +
            "\t\t    FROM \n" +
            "\t\t    (SELECT * FROM USER WHERE courseId=#{arg0} AND role!=\"助教\") u LEFT JOIN groupevaluationtotalscore gets\n" +
            "\t\t    ON \n" +
            "\t\t    (u.`groupId`=gets.groupId) AND u.`courseId`=#{arg0} AND gets.projectId=#{arg1} AND gets.courseId=#{arg0} \n" +
            "\t\t    GROUP BY\n" +
            "\t\t    u.`studentId`) t5\n" +
            "            WHERE \n" +
            "            t1.studentId=t2.studentId AND t2.studentId=t3.studentId AND t3.studentId=t4.studentId AND t4.studentId=t5.studentId;")
    public List<CalculateProjectScore> calProjectScore(int courseId,int projectId);

    @Select("SELECT\n" +
            "\tt1.studentId studentId,t1.name name,GROUP_CONCAT(rs.currentProjectScore ORDER BY rs.projectId) allScore\n" +
            "FROM\n" +
            "\t(SELECT * FROM USER WHERE courseId=#{courseId} AND role!=\"助教\") t1 LEFT JOIN projectScore rs\n" +
            "ON \n" +
            "\t(t1.studentId=rs.studentId)\n" +
            "GROUP BY\n" +
            "\tt1.studentId;")
    public List<AllProjectScore> calAllProjectScore(int courseId);

    @Select("SELECT \n" +
            "\tu.`studentId` studentId,u.`name` NAME,sc.allProjectScore allProjectScore, sc.regularScore regularScore, sc.courseTotalScore courseTotalScore \n" +
            "FROM \n" +
            "\t(SELECT courseId,studentId,NAME FROM USER WHERE courseId=#{courseId} AND role!=\"助教\") u left join coursescore sc\n" +
            "ON\n" +
            "\t(u.courseId=sc.`courseId` AND u.studentId=sc.`studentId`) AND u.courseId=#{courseId}")
    public List<CourseScore> calCourseScore(int courseId);

    @Select("insert into projectscore(courseId,studentId,projectId,currentProjectScore) values (#{arg0},#{arg1},#{arg2},#{arg3})" +
            "on duplicate key update currentProjectScore=#{arg3}")
    void saveSingleProjectScore(int courseId, String studentId, int projectId, int currentProjectScore);

    @Select("insert into coursescore(courseId,studentId,allProjectScore) values (#{arg0},#{arg1},#{arg2})" +
            "on duplicate key update allProjectScore=#{arg2}")
    void saveProjectTotalScore(int courseId, String studentId, double allProjectScore);

    @Select("insert into coursescore(courseId,studentId,courseTotalScore) values (#{arg0},#{arg1},#{arg2})" +
            "on duplicate key update courseTotalScore=#{arg2}")
    void saveCourseTotalScore(int courseId, String studentId, int courseTotalScore);

    @Select("insert into individualtaskcoderecord(courseId,projectId,phaseId,studentId,OJScore,time) values (#{courseId},#{projectId},#{phaseId},#{studentId},#{OJScore},#{time})")
    void saveRecordOfIndividualTaskCode(IndividualTaskCode individualTaskCode);

    @Select("select * from individualtaskcoderecord where courseId=#{arg0} and projectId=#{arg1} and phaseId=#{arg2} and studentId=#{arg3} order by Id asc")
    List<IndividualTaskCode> findRecordOfIndividual(int courseId, int projectId, int phaseId, String studentId);

    @Select("insert into grouptaskcoderecord(courseId,projectId,phaseId,groupId,OJScore,time) values (#{courseId},#{projectId},#{phaseId},#{groupId},#{OJScore},#{time})")
    void saveRecordOfGroupTaskCode(GroupTaskCode groupTaskCode);

    @Select("select * from grouptaskcoderecord where courseId=#{arg0} and projectId=#{arg1} and phaseId=#{arg2} and groupId=#{arg3} order by Id asc")
    List<GroupTaskCode> findRecordOfGroup(int courseId, int projectId, int phaseId, Integer groupId);

    @Select("SELECT p.`courseId` courseId,p.`projectId` projectId,p.`projectName`\n" +
            "FROM \n" +
            "\tproject p\n" +
            "WHERE\n" +
            "\tp.`startDate`<#{arg1} and courseId=#{arg0}")
    List<Project> findProjectByCourseIdAndCurrentData(int courseId, String currentData);

    @Select("SELECT contribution FROM studentparticipateproject WHERE courseId=#{arg0} and studentId=#{arg1} and projectId=#{arg2} ;")
    Double getContribution(int courseId, String studentId, Integer projectId);

    @Select("SELECT SUM(evaluationTotalScore)/COUNT(evaluationTotalScore) a FROM groupevaluationtotalscore WHERE courseId=#{arg0} and projectId=#{arg1} and groupId=#{arg2};")
    Double getGroupEvaluation(int courseId, Integer projectId, int groupId);

    @Select("SELECT reportScore FROM groupreport WHERE courseId=#{arg0} and projectId=#{arg1} and groupId=#{arg2};")
    Integer getReportScore(int courseId, Integer projectId, int groupId);

    @Select("SELECT currentProjectScore FROM projectscore WHERE courseId=#{arg0} and studentId=#{arg1} and projectId=#{arg2}")
    Double getTotalScore(int courseId, String studentId, Integer projectId);

    @Select("SELECT\n" +
            "\tgpt.phaseId phaseId,gpt.phaseName phaseName,gpt.phaseType phaseType,gtc.OJScore OJScore,gtc.codeQualityScore codeQualityScore,gpt.deadline deadline\n" +
            "FROM\n" +
            "\tgroupprogramtask gpt,grouptaskcode gtc\n" +
            "WHERE\t\n" +
            "\tgtc.groupId=#{arg2} AND gpt.courseId=gtc.courseId AND gpt.phaseId=gtc.phaseId AND gpt.courseId=#{arg0} AND gpt.projectId=gtc.projectId AND gpt.projectId=#{arg1} AND gpt.deadline<#{arg3}")
    List<ProgramTask> getGroupTaskList(int courseId, int projectId, int groupId, String currentData);

    @Select("SELECT\n" +
            "\tgpt.phaseId phaseId,gpt.phaseName phaseName,gpt.phaseType phaseType,itc.OJScore OJScore,gpt.deadline deadline\n" +
            "FROM\n" +
            "\tgroupprogramtask gpt,individualtaskcode itc\n" +
            "WHERE\t\n" +
            "\titc.studentId=#{arg2} AND gpt.courseId=itc.courseId AND gpt.phaseId=itc.phaseId AND gpt.courseId=#{arg0} AND gpt.projectId=itc.projectId AND gpt.projectId=#{arg1} AND gpt.deadline<#{arg3}")
    List<ProgramTask> getIndividualTaskList(int courseId, Integer projectId, String studentId, String currentData);

    @Select("SELECT DISTINCT groupId FROM USER WHERE courseId=#{courseId}")
    List<Integer> findGroupIdByCourseId(int courseId);

    @Select("SELECT COUNT(groupId) FROM USER WHERE courseId=#{arg0} AND groupId=#{arg1};")
    Integer findGroupMemberCountBycourseIdAndGroupId(int courseId, Integer groupId);
}
