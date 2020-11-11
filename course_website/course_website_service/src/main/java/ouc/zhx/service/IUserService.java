package ouc.zhx.service;

import ouc.zhx.domain.GroupInformation;
import ouc.zhx.domain.User;

import java.util.List;

public interface IUserService {


    //public List<User> findAll();
    List<User> findAll(int page, int size);

    List<User> findAllStudent();

    public void saveUser(User user);

    public User findByUsername(String username);

    public void readFileAndSaveUser(String path) throws Exception;

    public List<GroupInformation> findAllGroupByCourseId(int courseId);

    public List<User> findAllStudentByCourseId(int courseId);

    public void updateUserToGroupLeaderByCourseIdAndStudentId(int courseId,String studentId,int groupId);

    public List<User> findAllStudentWithoutGroupByCourseId(int courseId);

    public void updateUserGroupIdByCourseIdAndStudentId(int courseId,String studentId,int groupId);

    public List<User> findGroupInfoByCourseIdAndGroupId(int courseId,int groupId);

    public List<User> findGroupInfoWithoutGroupLeader(int courseId,int groupId);

    public void updateUserToGroupMemberByCourseIdAndStudentId(int courseId,String studentId,int groupId);

    public int groupCount(int courseId);

    public void updateUserGroupMemberToNull(int courseId,String studentId);

    public List<User> findStudentWithoutGroupId(int courseId);

    public void delUser(int courseId,String studentId);

    void updateUserPassword(int courseId, String studentId, String newPassword);
}
