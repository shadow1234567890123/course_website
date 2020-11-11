package ouc.zhx.domain;

import java.util.List;

/**
 * 某一门课程
 */
public class Course {
    private int courseId; //课程号
    private String courseName;//课程名
    private Integer year;//年份
    private String courseNumber;
    private List<CourseScore> courseScore;//课程成绩 导航属性
    private List<User> users;//导航属性
    private List<Project> projects;//导航属性

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public List<CourseScore> getCourseScore() {
        return courseScore;
    }

    public void setCourseScore(List<CourseScore> courseScore) {
        this.courseScore = courseScore;
    }

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Integer getYear() {
        return year;
    }

    public String getCourseNumber() {
        return courseNumber;
    }

    public void setCourseNumber(String courseNumber) {
        this.courseNumber = courseNumber;
    }

    public void setYear(Integer year) {
        this.year = year;
    }

    public List<Project> getProjects() {
        return projects;
    }

    public void setProjects(List<Project> projects) {
        this.projects = projects;
    }
}

