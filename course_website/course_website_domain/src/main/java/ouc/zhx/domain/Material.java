package ouc.zhx.domain;

import org.springframework.web.multipart.MultipartFile;

/**
 * 课程资料
 */
public class Material {
    private Long materialId;//标号
    private String uploaderName;//上传者名字
    private String fileName;//文件名
    private String uploadTime;//上传时间
    private String studentId;//上传者学号
    private String filePath;//文件路径
    private MultipartFile upload;//上传的文件
    private int courseId;//课程号

    public int getCourseId() {
        return courseId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public MultipartFile getUpload() {
        return upload;
    }

    public void setUpload(MultipartFile upload) {
        this.upload = upload;
    }

    public Long getMaterialId() {
        return materialId;
    }

    public void setMaterialId(Long materialId) {
        this.materialId = materialId;
    }

    public String getUploaderName() {
        return uploaderName;
    }

    public void setUploaderName(String uploaderName) {
        this.uploaderName = uploaderName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(String uploadTime) {
        this.uploadTime = uploadTime;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}

