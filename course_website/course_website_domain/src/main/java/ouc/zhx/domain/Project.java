package ouc.zhx.domain;

import java.util.Date;
import java.util.List;

/**
 * 项目信息
 */
public class Project {
    private Integer projectId;//项目号
    private String projectName;//项目名称
    private String reportProportion;//研发报告占比
    private String individualTaskProportion;//个人任务占比
    private String groupTaskProportion;//小组任务占比
    private String deadline;//截止日期
    private Integer courseId;//课程号
    private String startDate;//开始日期
    private String  projectDescription;//项目描述

    private Double groupContribution;//小组贡献度（新添加）
    private Double groupEvaluation;//小组互评（新添加）
    private Integer reportScore;//研发报告得分
    private Double totalScore;//总得分

    private List<GroupReport> groupReports;//导航属性
    private List<ProgramTask> programTasks;//导航属性
    private List<StudentParticipateProject> studentParticipateProjects;//导航属性



    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getReportProportion() {
        return reportProportion;
    }

    public void setReportProportion(String reportProportion) {
        this.reportProportion = reportProportion;
    }

    public String getIndividualTaskProportion() {
        return individualTaskProportion;
    }

    public void setIndividualTaskProportion(String individualTaskProportion) {
        this.individualTaskProportion = individualTaskProportion;
    }

    public String getGroupTaskProportion() {
        return groupTaskProportion;
    }

    public void setGroupTaskProportion(String groupTaskProportion) {
        this.groupTaskProportion = groupTaskProportion;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getProjectDescription() {
        return projectDescription;
    }

    public void setProjectDescription(String projectDescription) {
        this.projectDescription = projectDescription;
    }

    public Double getGroupContribution() {
        return groupContribution;
    }

    public void setGroupContribution(Double groupContribution) {
        this.groupContribution = groupContribution;
    }

    public Double getGroupEvaluation() {
        return groupEvaluation;
    }

    public void setGroupEvaluation(Double groupEvaluation) {
        this.groupEvaluation = groupEvaluation;
    }

    public Integer getReportScore() {
        return reportScore;
    }

    public void setReportScore(Integer reportScore) {
        this.reportScore = reportScore;
    }

    public Double getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(Double totalScore) {
        this.totalScore = totalScore;
    }

    public List<GroupReport> getGroupReports() {
        return groupReports;
    }

    public void setGroupReports(List<GroupReport> groupReports) {
        this.groupReports = groupReports;
    }

    public List<ProgramTask> getProgramTasks() {
        return programTasks;
    }

    public void setProgramTasks(List<ProgramTask> programTasks) {
        this.programTasks = programTasks;
    }

    public List<StudentParticipateProject> getStudentParticipateProjects() {
        return studentParticipateProjects;
    }

    public void setStudentParticipateProjects(List<StudentParticipateProject> studentParticipateProjects) {
        this.studentParticipateProjects = studentParticipateProjects;
    }
}

