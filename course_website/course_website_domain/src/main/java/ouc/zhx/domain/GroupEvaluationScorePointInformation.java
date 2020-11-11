package ouc.zhx.domain;

/**
 * 小组互评评分点信息
 */
public class GroupEvaluationScorePointInformation {
    private Integer courseId;//课程号
    private Integer scorePointId;//评分点序号
    private String scorePointName;//评分点名称
    private Integer scorePointTotalScore;//评分点总分

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getScorePointId() {
        return scorePointId;
    }

    public void setScorePointId(Integer scorePointId) {
        this.scorePointId = scorePointId;
    }

    public String getScorePointName() {
        return scorePointName;
    }

    public void setScorePointName(String scorePointName) {
        this.scorePointName = scorePointName;
    }

    public Integer getScorePointTotalScore() {
        return scorePointTotalScore;
    }

    public void setScorePointTotalScore(Integer scorePointTotalScore) {
        this.scorePointTotalScore = scorePointTotalScore;
    }
}

