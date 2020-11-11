package ouc.zhx.domain;

/**
 * 项目得分
 */
public class ProjectScore {
    private Integer courseId;//课程号
    private Integer studentId;//学号
    private Integer projectId;//项目号
    private Integer currentProjectScore;//当前项目得分

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public Integer getCurrentProjectScore() {
        return currentProjectScore;
    }

    public void setCurrentProjectScore(Integer currentProjectScore) {
        this.currentProjectScore = currentProjectScore;
    }
}

