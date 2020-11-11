package ouc.zhx.domain;

public class CalculateProjectScore {
    //private int year;
    private String studentId;
    private String studentName;
    private int groupId;
    private String score1;
    private String score2;
    private String score3;


    private Integer groupContribution;//小组贡献度（新添加）
    private Integer groupEvaluation;//小组互评（新添加）

    private Integer reportScore;
    private Integer projectScore;


//    public int getYear() {
//        return year;
//    }
//
//    public void setYear(int year) {
//        this.year = year;
//    }



    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getScore1() {
        return score1;
    }

    public void setScore1(String score1) {
        this.score1 = score1;
    }

    public String getScore2() {
        return score2;
    }

    public void setScore2(String score2) {
        this.score2 = score2;
    }

    public String getScore3() {
        return score3;
    }

    public void setScore3(String score3) {
        this.score3 = score3;
    }

    public Integer getGroupContribution() {
        return groupContribution;
    }

    public void setGroupContribution(Integer groupContribution) {
        this.groupContribution = groupContribution;
    }

    public Integer getGroupEvaluation() {
        return groupEvaluation;
    }

    public void setGroupEvaluation(Integer groupEvaluation) {
        this.groupEvaluation = groupEvaluation;
    }

    public Integer getReportScore() {
        return reportScore;
    }

    public void setReportScore(Integer reportScore) {
        this.reportScore = reportScore;
    }

    public Integer getProjectScore() {
        return projectScore;
    }

    public void setProjectScore(Integer projectScore) {
        this.projectScore = projectScore;
    }

    @Override
    public String toString() {
        return "CalculateProjectScore{" +
                "studentId='" + studentId + '\'' +
                ", studentName='" + studentName + '\'' +
                ", score1='" + score1 + '\'' +
                ", score2='" + score2 + '\'' +
                ", score3='" + score3 + '\'' +
                ", groupContribution=" + groupContribution +
                ", groupEvaluation=" + groupEvaluation +
                ", reportScore=" + reportScore +
                ", projectScore=" + projectScore +
                '}';
    }
}
