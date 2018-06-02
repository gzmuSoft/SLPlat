package edu.gzmu.service;

import com.baomidou.mybatisplus.plugins.Page;
import edu.gzmu.mapper.ClassMapper;
import edu.gzmu.model.Class;
import edu.gzmu.model.Specialty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import top.ibase4j.core.base.BaseService;

import java.util.Map;

/**
 * <p>
 * 班级  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "Class")
public class ClassService extends BaseService<Class> {
    @Autowired
    private SpecialtyService specialtyService;

    /**
     * 依赖注入
     */
    private final ClassMapper classMapper;

    /**
     * set方法
     * @param classMapper 属性注入
     */
    @Autowired
    public ClassService(ClassMapper classMapper) {
        this.classMapper = classMapper;
    }

    /**
     * 通过班级id查询
     * @param var 集合
     * @return 查询到的班级
     */
    public Class queryByClassId(Map<String, Object> var){
        return classMapper.queryById(var);
    }


//TODO 待确定是否删除
//    @Autowired
//    private SpecialtyService specialtyService;
//    private Specialty specialty;
//    private Class aClass;
//
    public Class queryById(Long id) {
        //SpecialtyService specialtyService = new SpecialtyService();
        Class item = super.queryById(id);
        if (item != null && item.getSpecialtyId() != null) {
            Specialty specialty = specialtyService.queryById(item.getSpecialtyId());
            if (specialty != null) {
                item.setSpecialty(specialty);
            }
        }
        return item;
    }

    public Page<Class> query(Map<String, Object> params) {
        Specialty specialty = null;
        Page<Class> pageInfo = super.query(params);
        for (Class item : pageInfo.getRecords()) {
            if (item.getSpecialtyId() != null) {
                specialty = specialtyService.queryById(item.getSpecialtyId());
                if (specialty != null) {
                    item.setSpecialty(specialty);
                }
            }
        }
        return pageInfo;
    }
}