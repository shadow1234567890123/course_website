package ouc.zhx.domain;

/**
 * 各小组小组互评评分点得分
 */
public class GroupEvaluationScorePointScore {
    private Integer id;//标号
    private Integer courseId;//课程号
    private Integer scorePointId;//评分点序号
    private Integer groupId;//被点评组组号
    private Integer evaluationGroupId;//点评组组号
    private Integer evaluationPointTotalScore;//某个评分点得分

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

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

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public Integer getEvaluationGroupId() {
        return evaluationGroupId;
    }

    public void setEvaluationGroupId(Integer evaluationGroupId) {
        this.evaluationGroupId = evaluationGroupId;
    }

    public Integer getEvaluationPointTotalScore() {
        return evaluationPointTotalScore;
    }

    public void setEvaluationPointTotalScore(Integer evaluationPointTotalScore) {
        this.evaluationPointTotalScore = evaluationPointTotalScore;
    }
}

