package ouc.zhx.domain;

import java.util.List;

/**
 * 小组信息
 */
public class GroupInformation {
    private Integer groupId;//组号
    private String groupName;//组名
    private String declaration;//小组宣言
    private Integer courseId;//课程号
    private List<GroupReport> groupReports;//导航属性
    private List<User> users;//导航属性
    private List<GroupTaskCode> groupTaskCodes;//导航属性

    public Integer getGroupId() {
        return groupId;
    }

    public void setGroupId(Integer groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getDeclaration() {
        return declaration;
    }

    public void setDeclaration(String declaration) {
        this.declaration = declaration;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }
}

