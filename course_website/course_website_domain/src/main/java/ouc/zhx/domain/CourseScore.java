package ouc.zhx.domain;

/**
 * 学生某门课程的成绩
 */
public class CourseScore {
    private Integer courseId;//课程号
    private String studentId;//学生学号
    private String name;//学生姓名
    private Double allProjectScore;//所有项目成绩
    private Integer regularScore;//平时成绩
    private Double courseTotalScore;//总成绩（期末成绩）

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getRegularScore() {
        return regularScore;
    }

    public void setRegularScore(Integer regularScore) {
        this.regularScore = regularScore;
    }

    public Double getAllProjectScore() {
        return allProjectScore;
    }

    public void setAllProjectScore(Double allProjectScore) {
        this.allProjectScore = allProjectScore;
    }

    public Double getCourseTotalScore() {
        return courseTotalScore;
    }

    public void setCourseTotalScore(Double courseTotalScore) {
        this.courseTotalScore = courseTotalScore;
    }

    @Override
    public String toString() {
        return "CourseScore{" +
                "courseId=" + courseId +
                ", studentId='" + studentId + '\'' +
                ", name='" + name + '\'' +
                ", allProjectScore=" + allProjectScore +
                ", regularScore=" + regularScore +
                ", courseTotalScore=" + courseTotalScore +
                '}';
    }
}

