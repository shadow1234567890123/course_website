package ouc.zhx.domain;

/**
 * 学生参与项目情况
 */
public class StudentParticipateProject {
    private String studentId;//学号
    private Integer projectId;//项目号
    private Double contribution;//贡献度
    private Integer courseId;//课程号

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public Double getContribution() {
        return contribution;
    }

    public void setContribution(Double contribution) {
        this.contribution = contribution;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }
}

