package ouc.zhx.domain;

import org.springframework.web.multipart.MultipartFile;

/**
 * 小组研发报告
 */
public class GroupReport {
    private Integer id;//标号
    private Integer projectId;//项目号
    private Integer groupId;//组号
    private String reportURL;//报告路径
    private Integer reportScore;//报告得分
    private Integer courseId;//课程号
    //private MultipartFile upload;//研发报告

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public String getReportURL() {
        return reportURL;
    }

    public void setReportURL(String reportURL) {
        this.reportURL = reportURL;
    }

    public Integer getReportScore() {
        return reportScore;
    }

    public void setReportScore(Integer reportScore) {
        this.reportScore = reportScore;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

//    public MultipartFile getUpload() {
//        return upload;
//    }
//
//    public void setUpload(MultipartFile upload) {
//        this.upload = upload;
//    }
}

