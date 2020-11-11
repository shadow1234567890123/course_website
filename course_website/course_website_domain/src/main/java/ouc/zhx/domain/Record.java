package ouc.zhx.domain;

public class Record {
    private Integer id;
    private Integer groupId; //组号
    private String name;//棋手（包含平台提供的棋手）
    private Double winRate;//胜率
    private Integer winCount;//胜利次数
    private Integer matchCount;//对战次数
    private String path;//棋手存储路径

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public Integer getMatchCount() {
        return matchCount;
    }

    public void setMatchCount(Integer matchCount) {
        this.matchCount = matchCount;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }
}
