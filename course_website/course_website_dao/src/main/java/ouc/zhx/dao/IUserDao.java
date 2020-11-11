package ouc.zhx.dao;

import org.apache.ibatis.annotations.Select;
import ouc.zhx.domain.GroupInformation;
import ouc.zhx.domain.User;

import java.util.List;

public interface IUserDao {

    @Select("select * from user")
    public List<User> findAll();

    @Select("insert into user(courseId,groupId,studentId,name,username,password,professionalGrade,role) values (#{courseId},#{groupId},#{studentId},#{name},#{username},#{password},#{professionalGrade},#{role})")
    public void saveUser(User user);

    @Select("select * from user where username=#{username}")
    public User findByUsername(String username);

    @Select("select * from groupinformation where courseId=#{courseId}")
    public List<GroupInformation> findAllGroupByCourseId(int courseId);

    @Select("select * from user where courseId=#{courseId}")
    public List<User> findAllStudentByCourseId(int courseId);

    @Select("update user set groupId=#{arg2},role='组长' where courseId=#{arg0} and studentId=#{arg1}")
    public void updateUserToGroupLeaderByCourseIdAndStudentId(int courseId,String studentId,int groupId);

    @Select("select * from user where courseId=#{courseId} and groupId is null")
    public List<User> findAllStudentWithoutGroupByCourseId(int courseId);

    @Select("update user set groupId=#{arg2} where courseId=#{arg0} and studentId=#{arg1}")
    public void updateUserGroupIdByCourseIdAndStudentId(int courseId,String studentId,int groupId);

    @Select("select * from user where courseId=#{arg0} and groupId=#{arg1}")
    public List<User> findGroupInfoByCourseIdAndGroupId(int courseId,int groupId);

    @Select("select * from user where courseId=#{arg0} and groupId=#{arg1} and role='学生'")
    public List<User> findGroupInfoWithoutGroupLeader(int courseId,int groupId);

    @Select("update user set groupId=#{arg2},role='学生' where courseId=#{arg0} and studentId=#{arg1}")
    public void updateUserToGroupMemberByCourseIdAndStudentId(int courseId,String studentId,int groupId);

    @Select("select count(*) from groupinformation where courseId=#{courseId}")
    public int groupCount(int courseId);

    @Select("update user set groupId=null where courseId=#{arg0} and studentId=#{arg1}")
    public void updateUserGroupMemberToNull(int courseId,String studentId);

    @Select("select * from user where courseId=#{courseId} and groupId is null and role IN('组长','学生')")
    public List<User> findStudentWithoutGroupId(int courseId);

    @Select("delete from user where courseId=#{arg0} and studentId=#{arg1}")
    public void delUser(int courseId,String studentId);

    @Select("update user set password=#{arg2} where courseId=#{arg0} and studentId=#{arg1}")
    void updateUserPassword(int courseId, String studentId, String newPassword);

}
