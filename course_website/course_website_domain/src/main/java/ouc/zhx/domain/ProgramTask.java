package ouc.zhx.domain;

import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

/**
 * 编程任务信息，有个人编程任务和小组编程任务两个派生类
 */
public class ProgramTask {
    private Integer projectId;//项目号
    private Integer phaseId;//阶段号
    private String phaseDescription;//阶段描述
    private String runTimeRequirement;//运行时间要求
    private String inputSample;//输入样例
    private String outputSample;//输出样例
    private String inputRequirement;//输入格式
    private String outputRequirement;//输出格式
    private String testCaseURI;//测试用例URI
    private String similarityThreshold;//相似度阈值
    private String deadline;//截止日期
    private String startDate;//开始日期
    private Integer courseId;//课程号
    private MultipartFile upload;//关卡pdf
    private String phaseName;//阶段名称
    private String phaseType;//阶段类型（小组、个人）
    private String filePath;//文件路径
    private String fileName;//文件名

    private Integer OJScore;//(新添加)
    private Integer codeQualityScore;//(新添加)

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getPhaseName() {
        return phaseName;
    }

    public void setPhaseName(String phaseName) {
        this.phaseName = phaseName;
    }

    public String getPhaseType() {
        return phaseType;
    }

    public void setPhaseType(String phaseType) {
        this.phaseType = phaseType;
    }

    public MultipartFile getUpload() {
        return upload;
    }

    public void setUpload(MultipartFile upload) {
        this.upload = upload;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public Integer getPhaseId() {
        return phaseId;
    }

    public void setPhaseId(Integer phaseId) {
        this.phaseId = phaseId;
    }

    public String getPhaseDescription() {
        return phaseDescription;
    }

    public void setPhaseDescription(String phaseDescription) {
        this.phaseDescription = phaseDescription;
    }

    public String getRunTimeRequirement() {
        return runTimeRequirement;
    }

    public void setRunTimeRequirement(String runTimeRequirement) {
        this.runTimeRequirement = runTimeRequirement;
    }

    public String getInputSample() {
        return inputSample;
    }

    public void setInputSample(String inputSample) {
        this.inputSample = inputSample;
    }

    public String getOutputSample() {
        return outputSample;
    }

    public void setOutputSample(String outputSample) {
        this.outputSample = outputSample;
    }

    public String getInputRequirement() {
        return inputRequirement;
    }

    public void setInputRequirement(String inputRequirement) {
        this.inputRequirement = inputRequirement;
    }

    public String getOutputRequirement() {
        return outputRequirement;
    }

    public void setOutputRequirement(String outputRequirement) {
        this.outputRequirement = outputRequirement;
    }

    public String getTestCaseURI() {
        return testCaseURI;
    }

    public void setTestCaseURI(String testCaseURI) {
        this.testCaseURI = testCaseURI;
    }

    public String getSimilarityThreshold() {
        return similarityThreshold;
    }

    public void setSimilarityThreshold(String similarityThreshold) {
        this.similarityThreshold = similarityThreshold;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getOJScore() {
        return OJScore;
    }

    public void setOJScore(Integer OJScore) {
        this.OJScore = OJScore;
    }

    public Integer getCodeQualityScore() {
        return codeQualityScore;
    }

    public void setCodeQualityScore(Integer codeQualityScore) {
        this.codeQualityScore = codeQualityScore;
    }
}

