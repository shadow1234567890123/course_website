package ouc.zhx.service;

import ouc.zhx.domain.GroupProgramTask;
import ouc.zhx.domain.IndividualTaskCode;
import ouc.zhx.domain.Project;

import javax.servlet.http.HttpServletRequest;

public interface IProjectService {

    public Project findCurrentProject(int courseId,int projectId);

    public GroupProgramTask findCurrentStage(int courseId, int projectId, int phaseId);


    int handleStudentCode(HttpServletRequest request,String fullClassName) throws Exception;

}
