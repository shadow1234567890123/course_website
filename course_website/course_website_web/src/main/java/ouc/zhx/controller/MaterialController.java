package ouc.zhx.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import ouc.zhx.domain.Material;
import ouc.zhx.domain.User;
import ouc.zhx.service.IMaterialService;
import ouc.zhx.utils.Utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/material")
public class MaterialController {

    @Autowired
    IMaterialService materialService;

    @RequestMapping("/download")
    public ResponseEntity<byte[]> download(HttpServletRequest request, @RequestParam("filename") String fileName,Model model) throws Exception{
        String path=request.getServletContext().getRealPath("/uploads/materials");
        //File file=new File(path+File.separator+filename);
        HttpSession session=request.getSession();//修改
        User user = (User)session.getAttribute("user");//修改
        //File file=new File(path+user.getStudentId()+File.separator+fileName);//修改
        File file=new File(path+File.separator+fileName);//修改
        HttpHeaders headers=new HttpHeaders();
        String downloadFileName=new String(fileName.getBytes("UTF-8"),"iso-8859-1");
        headers.setContentDispositionFormData("attachment",downloadFileName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }

    @RequestMapping("/saveMaterial")
    public void saveMaterial(@ModelAttribute Material material, HttpServletRequest request, HttpServletResponse response) throws Exception{
        HttpSession session=request.getSession();

        User user = (User)session.getAttribute("user");
        //String path=request.getSession().getServletContext().getRealPath("/uploads/"+user.getStudentId());
        String path=session.getServletContext().getRealPath("/uploads/materials");
        String filename=material.getUpload().getOriginalFilename();
        File filepath=new File(path,filename);
        if(!filepath.getParentFile().exists()){
            filepath.getParentFile().mkdirs();
        }
        material.getUpload().transferTo(new File(path+File.separator+filename));
        material.setUploaderName(user.getName());
        material.setStudentId(user.getStudentId());
        material.setCourseId(1);
        material.setFileName(material.getUpload().getOriginalFilename());
        material.setUploadTime(Utils.dateFormatTran(new Date()));//上传时间设置为系统当前时间
        materialService.saveMaterial(material);
        request.getRequestDispatcher("/pages/upload-material.jsp").forward(request,response);
        return;
    }

    @RequestMapping("/test")
    public String test(){
        System.out.println("测试方法执行了");
        return "homepage";
    }

    @RequestMapping("/findAllMaterial")
    public ModelAndView findAllMaterial(){
        ModelAndView mv=new ModelAndView();
        List<Material> materials = materialService.findAllMaterial();
        mv.addObject("materials",materials);
        mv.setViewName("material-list");
        return mv;
    }
}
