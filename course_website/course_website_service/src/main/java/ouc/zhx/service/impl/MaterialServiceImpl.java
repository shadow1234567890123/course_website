package ouc.zhx.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ouc.zhx.dao.IMaterialDao;
import ouc.zhx.domain.Material;
import ouc.zhx.service.IMaterialService;

import java.util.List;

@Service
public class MaterialServiceImpl implements IMaterialService{

    @Autowired
    IMaterialDao materialDao;

    public void saveMaterial(Material material) {
        materialDao.saveMaterial(material);
    }

    public List<Material> findAllMaterial() {
        return materialDao.findAllMaterial();
    }
}
