package ouc.zhx.domain;

import java.util.List;

/**
 * 用户信息
 */
public class User {
    private String studentId;    //学号
    private String name;         //姓名
    private String username;    //用户名
    private String password;    //密码
    private String professionalGrade; //专业年级
    private String role;              //角色
    private List<Course> courses;//导航属性
    private List<CourseScore> courseScores;//导航属性
    private List<StudentParticipateProject> studentParticipateProjects;//导航属性
    private List<IndividualTaskCode> individualTaskCodes;//导航属性


    public List<Course> getCourses() {
        return courses;
    }

    public void setCourses(List<Course> courses) {
        this.courses = courses;
    }

    private int courseId;

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    private Integer groupId;

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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getProfessionalGrade() {
        return professionalGrade;
    }

    public void setProfessionalGrade(String professionalGrade) {
        this.professionalGrade = professionalGrade;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }
}

