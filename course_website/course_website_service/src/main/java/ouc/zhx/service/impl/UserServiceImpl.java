package ouc.zhx.service.impl;

import com.github.pagehelper.PageHelper;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ouc.zhx.dao.IUserDao;
import ouc.zhx.domain.GroupInformation;
import ouc.zhx.domain.User;
import ouc.zhx.service.ICourseService;
import ouc.zhx.service.IUserService;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Calendar;
import java.util.List;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    IUserDao userDao;

    @Autowired
    ICourseService courseService;

//    public List<User> findAll() {
//        //分页查询，pageNum代表页码值，pageSize代表每页显示的条数
//        PageHelper.startPage(1,5);
//        return userDao.findAll();
//    }

    public List<User> findAll(int page, int size) {
         PageHelper.startPage(page,size);
         return userDao.findAll();
    }

    public List<User> findAllStudent() {
        return userDao.findAll();
    }

    public void saveUser(User user) {
        int year = Calendar.getInstance().get(Calendar.YEAR);
        int courseId = courseService.findCourseId(year);
        List<User> users = userDao.findAllStudentByCourseId(courseId);
        for (User u:users){
            if(user.getStudentId()==u.getStudentId()){
                throw new RuntimeException();
            }
        }
        userDao.saveUser(user);
    }

    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }

    public void readFileAndSaveUser(String path) throws Exception {
        InputStream is=new FileInputStream(path+"\\choose-list.xlsx");
        //POIFSFileSystem fs = new POIFSFileSystem(is);
        XSSFWorkbook wb = new XSSFWorkbook(is);
        XSSFSheet sheet = wb.getSheetAt(0);
        int rowNum = sheet.getLastRowNum();
        User user=new User();
        XSSFRow row;
        for(int i=8;i<=rowNum;i++){
            row = sheet.getRow(i);
            user.setStudentId(row.getCell(1)+"");
            user.setName(row.getCell(2)+"");
            user.setUsername(row.getCell(1)+"");
            user.setPassword(row.getCell(1)+"");
            user.setProfessionalGrade(row.getCell(3)+"");
            user.setRole("学生");
            user.setCourseId(1);
            System.out.println("呵呵呵");
            userDao.saveUser(user);
        }
        is.close();
        //wb.close();
    }

    public List<GroupInformation> findAllGroupByCourseId(int courseId) {
        return userDao.findAllGroupByCourseId(courseId);
    }

    public List<User> findAllStudentByCourseId(int courseId) {
        return userDao.findAllStudentByCourseId(courseId);
    }

    public void updateUserToGroupLeaderByCourseIdAndStudentId(int courseId, String studentId, int groupId) {
        userDao.updateUserToGroupLeaderByCourseIdAndStudentId(courseId,studentId,groupId);
    }

    public List<User> findAllStudentWithoutGroupByCourseId(int courseId) {
        return userDao.findAllStudentWithoutGroupByCourseId(courseId);
    }

    public void updateUserGroupIdByCourseIdAndStudentId(int courseId, String studentId, int groupId) {
        userDao.updateUserGroupIdByCourseIdAndStudentId(courseId,studentId,groupId);
    }

    public List<User> findGroupInfoByCourseIdAndGroupId(int courseId, int groupId) {
        return userDao.findGroupInfoByCourseIdAndGroupId(courseId,groupId);
    }

    public List<User> findGroupInfoWithoutGroupLeader(int courseId, int groupId) {
        return userDao.findGroupInfoWithoutGroupLeader(courseId,groupId);
    }

    public void updateUserToGroupMemberByCourseIdAndStudentId(int courseId, String studentId, int groupId) {
        userDao.updateUserToGroupMemberByCourseIdAndStudentId(courseId,studentId,groupId);
    }

    public int groupCount(int courseId) {
        return userDao.groupCount(courseId);
    }

    public void updateUserGroupMemberToNull(int courseId, String studentId) {
        userDao.updateUserGroupMemberToNull(courseId,studentId);
    }

    public List<User> findStudentWithoutGroupId(int courseId) {
        return userDao.findStudentWithoutGroupId(courseId);
    }

    public void delUser(int courseId, String studentId) {
        userDao.delUser(courseId,studentId);
    }

    public void updateUserPassword(int courseId, String studentId, String newPassword) {
        userDao.updateUserPassword(courseId,studentId,newPassword);
    }

}
