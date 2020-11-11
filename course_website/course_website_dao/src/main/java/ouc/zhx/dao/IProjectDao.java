package ouc.zhx.dao;

import org.apache.ibatis.annotations.Select;
import ouc.zhx.domain.GroupProgramTask;
import ouc.zhx.domain.Material;
import ouc.zhx.domain.Project;

import java.util.List;

public interface IProjectDao {

    @Select("select * from project where courseId=#{arg0} and projectId=#{arg1}")
    public Project findCurrentProject(int courseId,int projectId);

    @Select("select * from groupprogramtask where courseId=#{arg0} and projectId=#{arg1} and phaseId=#{arg1}")
    public GroupProgramTask findCurrentStage(int courseId, int projectId, int phaseId);
}
