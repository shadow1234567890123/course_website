package ouc.zhx.domain;

/**
 * 各小组小组互评总得分
 */
public class GroupEvaluationTotalScore {
    private Integer courseId;//课程号
    private Integer projectId;//项目号
    private Integer groupId;//被点评组组号
    private Integer evaluationGroupId;//点评组组号
    private Integer evaluationTotalScore;//被点评组总得分

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
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

    public Integer getEvaluationTotalScore() {
        return evaluationTotalScore;
    }

    public void setEvaluationTotalScore(Integer evaluationTotalScore) {
        this.evaluationTotalScore = evaluationTotalScore;
    }
}

