package ouc.zhx.domain;

public class CourseInfo {
    private int year;
    private String projectName;
    private String phaseName;
    private String phaseType;
    private int score;

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getPhaseName() {
        return phaseName;
    }

    public void setPhaseName(String phaseName) {
        this.phaseName = phaseName;
    }

    public String getPhaseType() {
        return phaseType;
    }

    public void setPhaseType(String phaseType) {
        this.phaseType = phaseType;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
}
