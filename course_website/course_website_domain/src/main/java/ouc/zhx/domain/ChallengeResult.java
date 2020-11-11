package ouc.zhx.domain;

import java.util.Date;

public class ChallengeResult {
    private Integer id;//标号
    private Integer groupId1; //组号
    private Integer groupId2; //组号
    private String challenger1;//挑战者 组名 提供的基础棋手的名字
    private String challenger2;//被挑战者
    private Integer matchCount;//对战次数
    private Double winRate;//胜率
    private Integer winCount;//胜利次数
    private Date challengeDate;//挑战时间

    public Integer getGroupId1() {
        return groupId1;
    }

    public void setGroupId1(Integer groupId1) {
        this.groupId1 = groupId1;
    }

    public Integer getGroupId2() {
        return groupId2;
    }

    public void setGroupId2(Integer groupId2) {
        this.groupId2 = groupId2;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getChallenger1() {
        return challenger1;
    }

    public void setChallenger1(String challenger1) {
        this.challenger1 = challenger1;
    }

    public String getChallenger2() {
        return challenger2;
    }

    public void setChallenger2(String challenger2) {
        this.challenger2 = challenger2;
    }

    public Integer getMatchCount() {
        return matchCount;
    }

    public void setMatchCount(Integer matchCount) {
        this.matchCount = matchCount;
    }

    public Double getWinRate() {
        return winRate;
    }

    public void setWinRate(Double winRate) {
        this.winRate = winRate;
    }

    public Integer getWinCount() {
        return winCount;
    }

    public void setWinCount(Integer winCount) {
        this.winCount = winCount;
    }

    public Date getChallengeDate() {
        return challengeDate;
    }

    public void setChallengeDate(Date challengeDate) {
        this.challengeDate = challengeDate;
    }
}
