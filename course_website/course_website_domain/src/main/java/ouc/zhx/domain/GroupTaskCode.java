package ouc.zhx.domain;

import java.util.Date;

/**
 * 小组编程任务代码
 */
public class GroupTaskCode {
    private Integer courseId;//课程号
    private Integer projectId;//项目号
    private Integer phaseId;//阶段好
    private Integer groupId;//组号
    private String codePath;//代码路径
    private String codeSimilarity;//代码相似度
    private Integer OJScore;//OJ得分
    private Integer codeQualityScore;//代码质量得分
    private String time;

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

    public Integer getPhaseId() {
        return phaseId;
    }

    public void setPhaseId(Integer phaseId) {
        this.phaseId = phaseId;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public String getCodePath() {
        return codePath;
    }

    public void setCodePath(String codePath) {
        this.codePath = codePath;
    }

    public String getCodeSimilarity() {
        return codeSimilarity;
    }

    public void setCodeSimilarity(String codeSimilarity) {
        this.codeSimilarity = codeSimilarity;
    }

    public Integer getOJScore() {
        return OJScore;
    }

    public void setOJScore(Integer OJScore) {
        this.OJScore = OJScore;
    }

    public Integer getCodeQualityScore() {
        return codeQualityScore;
    }

    public void setCodeQualityScore(Integer codeQualityScore) {
        this.codeQualityScore = codeQualityScore;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
}

