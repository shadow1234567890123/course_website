package ouc.zhx.domain;

import java.util.Date;

public class PlayerInfo {
    private Integer groupId; //组号
    private String name;
    private String parentPath;//棋手存储路径的父目录 可用于提交文件时进行覆盖
    private String submitDate;//棋手提交时间
    private String comment; //备注
    private Integer gameId;
    private boolean ifSubmit;//在特定棋类是否提交过棋手

    public boolean isIfSubmit() {
        return ifSubmit;
    }

    public void setIfSubmit(boolean ifSubmit) {
        this.ifSubmit = ifSubmit;
    }

    public Integer getGameId() {
        return gameId;
    }

    public void setGameId(Integer gameId) {
        this.gameId = gameId;
    }

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getParentPath() {
        return parentPath;
    }

    public void setParentPath(String parentPath) {
        this.parentPath = parentPath;
    }

    public String getSubmitDate() {
        return submitDate;
    }

    public void setSubmitDate(String submitDate) {
        this.submitDate = submitDate;
    }
}
