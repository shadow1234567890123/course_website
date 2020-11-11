package ouc.zhx.domain;

public class AllProjectScore {
    private String studentId;
    private String name;
    private String allScore;
    private Double totalProjectScore;

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

    public String getAllScore() {
        return allScore;
    }

    public void setAllScore(String allScore) {
        this.allScore = allScore;
    }

    public Double getTotalProjectScore() {
        return totalProjectScore;
    }

    public void setTotalProjectScore(Double totalProjectScore) {
        this.totalProjectScore = totalProjectScore;
    }

    @Override
    public String toString() {
        return "AllProjectScore{" +
                "studentId='" + studentId + '\'' +
                ", name='" + name + '\'' +
                ", allScore='" + allScore + '\'' +
                ", totalProjectScore=" + totalProjectScore +
                '}';
    }
}
