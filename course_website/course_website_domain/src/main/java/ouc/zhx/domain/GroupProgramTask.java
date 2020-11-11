package ouc.zhx.domain;

import java.util.List;

/**
 * 小组编程任务信息，继承自编程任务信息
 */
public class GroupProgramTask extends ProgramTask{

    private String OJScoreProportion;//OJ评分占比
    private String codeQualityScoreProportion;//代码质量评分占比

    private List<GroupTaskCode> groupTaskCodes;//导航属性


    public String getOJScoreProportion() {
        return OJScoreProportion;
    }

    public void setOJScoreProportion(String OJScoreProportion) {
        this.OJScoreProportion = OJScoreProportion;
    }

    public String getCodeQualityScoreProportion() {
        return codeQualityScoreProportion;
    }

    public void setCodeQualityScoreProportion(String codeQualityScoreProportion) {
        this.codeQualityScoreProportion = codeQualityScoreProportion;
    }
}
