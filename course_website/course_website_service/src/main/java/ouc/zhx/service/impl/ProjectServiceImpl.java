package ouc.zhx.service.impl;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import ouc.zhx.dao.IProjectDao;
import ouc.zhx.domain.*;
import ouc.zhx.service.ICourseService;
import ouc.zhx.service.IProjectService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
public class ProjectServiceImpl implements IProjectService{

    @Autowired
    IProjectDao projectDao;

    @Autowired
    ICourseService courseService;

    public Project findCurrentProject(int courseId, int projectId) {
        return projectDao.findCurrentProject(courseId,projectId);
    }

    public GroupProgramTask findCurrentStage(int courseId, int projectId, int phaseId) {
        return projectDao.findCurrentStage(courseId,projectId,phaseId);
    }


    //处理学生上传的作业代码
    public int handleStudentCode(HttpServletRequest request,String fullClassName) throws Exception{
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int year = Calendar.getInstance().get(Calendar.YEAR);
        Project currentProject = (Project)session.getAttribute("currentProject");
        GroupProgramTask currentStage = (GroupProgramTask)session.getAttribute("currentStage");

        String basePath=request.getSession().getServletContext().getRealPath("/uploads/");
        String currentProjectAndPhaseId=currentProject.getCourseId()+"-"+currentProject.getProjectId()+"-"+currentStage.getPhaseId()+"/";
        String rootPath=request.getSession().getServletContext().getRealPath("/uploads/")+year+"/"+currentProjectAndPhaseId+"/";
        String uploadPath=null;

        String type = currentStage.getPhaseType();

        if("个人".equals(type)){
            uploadPath=rootPath+user.getStudentId()+"/";
        }else{
            uploadPath=rootPath+"G"+user.getGroupId()+"/";
        }

        String rootFolder=null;

        MultipartHttpServletRequest params=(MultipartHttpServletRequest)request;
        List<MultipartFile> files = params.getFiles("fileFolder");
        for(MultipartFile f:files) {
            File file1;
            String name = "";
            try {
                if (f instanceof CommonsMultipartFile) {
                    //转换成这个对象，然后我们需要通过里面的FileItem来获得相对路径
                    CommonsMultipartFile f2 = (CommonsMultipartFile) f;
                    name = f2.getFileItem().getName();//name为srcAnt/pig/Pig.java
                    //if(rootFolder==null) rootFolder=name.split("/")[0];
                    if(rootFolder==null) rootFolder=uploadPath+name.split("/")[0]; //已修改
                    file1 = new File(uploadPath + "/" + name);
                    file1.mkdirs();
                    file1.createNewFile();
                    f.transferTo(file1);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        //循环输入测试用例
        //-rootPath：从upload一直到阶段号/
        //-uploadPath：从upload一直到阶段号/学号或组号
        //-rootFolder：从upload一直到阶段号/学号或组号/学生上传的文件的名字
        //-fullClassName：全类名
        //-basePath：/uploads/
        int OJScore = circleTest(rootPath, uploadPath, rootFolder,fullClassName,basePath);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if(type.equals("小组")){
            GroupTaskCode groupTaskCode=new GroupTaskCode();
            groupTaskCode.setCourseId(currentProject.getCourseId());
            groupTaskCode.setProjectId(currentProject.getProjectId());
            groupTaskCode.setPhaseId(currentStage.getPhaseId());
            groupTaskCode.setGroupId(user.getGroupId());
            groupTaskCode.setCodePath(uploadPath);
            groupTaskCode.setOJScore(OJScore);
            groupTaskCode.setTime(sdf.format(new Date()));
            courseService.saveOJScoreOfGroupTaskCode(groupTaskCode);
            courseService.saveRecordOfGroupTaskCode(groupTaskCode);
            courseService.saveRecordOfGroupTaskCode(groupTaskCode);
        }else{
            IndividualTaskCode individualTaskCode=new IndividualTaskCode();
            individualTaskCode.setCourseId(currentProject.getCourseId());
            individualTaskCode.setProjectId(currentProject.getProjectId());
            individualTaskCode.setPhaseId(currentStage.getPhaseId());
            individualTaskCode.setStudentId(user.getStudentId());
            individualTaskCode.setCodePath(uploadPath);
            individualTaskCode.setOJScore(OJScore);
            individualTaskCode.setTime(sdf.format(new Date()));
            courseService.saveOJScoreOfIndividualTaskCode(individualTaskCode);
            courseService.saveRecordOfIndividualTaskCode(individualTaskCode);
        }
        return OJScore;
    }

      //修改前的函数
//    public void runStudentCode(String cmd,String path) {
//        try {
//            Runtime rt = Runtime.getRuntime();
//            Process proc = rt.exec(cmd,null,new File(path));
//            java.io.InputStream is =  proc.getInputStream();
//            java.io.InputStream es =  proc.getErrorStream();
//            String line;
//            BufferedReader br;
//            br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
//            while ((line = br.readLine()) != null) {
//                System.out.print(line);
//            }
//            br = new BufferedReader(new InputStreamReader(es, "UTF-8"));
//            while ((line = br.readLine()) != null) {
//                System.out.print(line);
//            }
//        } catch (Exception e) {
//            System.out.println("异常信息");
//        }
//    }

    public void runStudentCode(String cmd,String path) throws IOException {
        java.io.InputStream is=null;
        java.io.InputStream es=null;
        try {
            Runtime rt = Runtime.getRuntime();
            Process proc = rt.exec(cmd,null,new File(path));
            is =  proc.getInputStream();
            es =  proc.getErrorStream();
            String line;
            BufferedReader br;
            br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            while ((line = br.readLine()) != null) {
                System.out.print(line);
            }
            br = new BufferedReader(new InputStreamReader(es, "UTF-8"));
            while ((line = br.readLine()) != null) {
                System.out.print(line);
            }
        } catch (Exception e) {
            System.out.println("异常信息");
        }finally {
            is.close();
            es.close();
        }
    }

    //-rootPath：从upload一直到阶段号/
    //-uploadPath：从upload一直到阶段号/学号或组号
    //-rootFolder：从upload一直到阶段号/学号或组号/学生上传的文件的名字
    //-fullClassName：全类名
    //-basePath：/uploads/
//    private int circleTest(String rootPath, String uploadPath,String rootFolder,String fullClassName,String basePath){
//
//
//        return 0;
//    }
    //-rootPath：从upload一直到阶段号/
    //-uploadPath：从upload一直到阶段号/学号或组号
    //-rootFolder：从upload一直到阶段号/学号或组号/学生上传的文件的名字
    //-fullClassName：全类名
    //-basePath：/uploads/
    private int circleTest(String rootPath, String uploadPath,String rootFolder,String fullClassName,String basePath) throws IOException {

        File file=new File(rootPath+"testCaseAndStandardout");
        String[] fileLists=file.list();
        ArrayList<String> infiles=new ArrayList<String>();
        //获得测试用例文件名（需改为一个文件）
        for(String filename:fileLists) {
            if(filename.endsWith(".in")) {
                infiles.add(filename);
            }
        }
        String input=null;
        String output=null;
        String cmd=null;

        FileInputStream studentout=null;
        FileInputStream standardout =null;

        int OJScore=0;
        int singleCaseScore=100/infiles.size();
        //开始循环测试
        for(int i=0;i<infiles.size();i++){
            input=rootPath+"testCaseAndStandardout/"+infiles.get(i);
            output=uploadPath+infiles.get(i).split("\\.")[0]+".out";
            //cmd="cmd /c ant -Dpath="+rootFolder+",-Dinput="+input+",-Doutput="+output;
            cmd="cmd /c ant -Dpath="+rootFolder+",-Dinput="+input+",-Doutput="+output+",-DclassPath="+uploadPath+"bin"+",-DclassName="+fullClassName;//已修改
            //runStudentCode(cmd,uploadPath);
            runStudentCode(cmd,basePath);
            try {
                studentout=new FileInputStream(output);
                standardout=new FileInputStream(rootPath+"testCaseAndStandardout/"+infiles.get(i).split("\\.")[0]+".out");
                //比较学生输出与标准输出
                if(compareStudentoutAndStandardout(studentout,standardout)){
                    OJScore+=singleCaseScore;
                }

            } catch (FileNotFoundException e) {
                e.printStackTrace();
                return OJScore;
            }finally {
                try {
                    studentout.close();
                    standardout.close();
                } catch (IOException e) {
                    e.printStackTrace();
                    return OJScore;
                }
            }
        }
        return infiles.size()%2==0?OJScore:OJScore+1;

    }

    private boolean compareStudentoutAndStandardout(FileInputStream studentout, FileInputStream standardout) {
        try {
            String studentout_hex=DigestUtils.md5Hex(studentout);
            String standardout_hex=DigestUtils.md5Hex(standardout);
            if(studentout_hex.equals(standardout_hex)){
                return true;
            }else {
                return false;
            }
        } catch (IOException e) {
            return false;
        }
    }
}