package ouc.zhx.dao;

import org.apache.ibatis.annotations.Select;
import ouc.zhx.domain.Material;

import java.util.List;

public interface IMaterialDao {

    @Select("insert into material(uploaderName,fileName,uploadTime,studentId,filePath,courseId) values (#{uploaderName},#{fileName},#{uploadTime},#{studentId},#{filePath},#{courseId})")
    public void saveMaterial(Material material);

    @Select("select * from material")
    public List<Material> findAllMaterial();
}
