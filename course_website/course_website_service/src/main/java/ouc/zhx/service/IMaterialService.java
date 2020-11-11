package ouc.zhx.service;

import ouc.zhx.dao.IMaterialDao;
import ouc.zhx.domain.Material;

import java.util.List;

public interface IMaterialService {

    public void saveMaterial(Material material);

    public List<Material> findAllMaterial();
}
