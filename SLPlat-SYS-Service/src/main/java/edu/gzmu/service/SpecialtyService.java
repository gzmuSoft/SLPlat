package edu.gzmu.service;

import com.baomidou.mybatisplus.plugins.Page;
import edu.gzmu.mapper.SchoolMapper;
import edu.gzmu.mapper.SpecialtyMapper;
import edu.gzmu.model.College;
import edu.gzmu.model.School;
import edu.gzmu.model.Specialty;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import top.ibase4j.core.base.BaseService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 专业  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "Specialty")
public class SpecialtyService extends BaseService<Specialty> {
    @Autowired
    private CollegeService collegeService;

    private SchoolMapper schoolMapper;
    private SpecialtyMapper specialtyMapper;

    public SpecialtyService() {
    }
    /**
     * 依赖注入
     * @param schoolMapper 属性注入
     */
    @Autowired
    public SpecialtyService(SchoolMapper schoolMapper, SpecialtyMapper specialtyMapper) {
        this.schoolMapper = schoolMapper;
        this.specialtyMapper = specialtyMapper;
    }

    /**
     * 三级联动获取列表
     * @return 列表
     */
    public List<School> queryHierarchyTwo() {
        return schoolMapper.queryHierarchyTwo();
    }

    /**
     * 通过id查询
     * @param var 前台参数
     * @return 专业
     */
    public Specialty queryBySpecialtyId(Map<String, Object> var) {
        return specialtyMapper.queryById(var);
    }

    public Specialty queryById(Long id) {
        Specialty specialty = super.queryById(id);
        if (specialty != null && specialty.getCollegeId() != null) {
            College college = collegeService.queryById(specialty.getCollegeId());
            if (college != null) {
                specialty.setCollege(college);
            }
        }
        return specialty;
    }
    public Page<Specialty> query(Map<String, Object> params) {
        College college = null;
        Page<Specialty> pageInfo = super.query(params);
        for (Specialty specialty : pageInfo.getRecords()) {
            if (specialty.getCollegeId() != null) {
                college = collegeService.queryById(specialty.getCollegeId());
                if (college != null) {
                    specialty.setCollege(college);
                }
            }
        }
        return pageInfo;
    }
}