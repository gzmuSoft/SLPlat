package edu.gzmu.service;

import com.baomidou.mybatisplus.plugins.Page;
import edu.gzmu.mapper.SchoolMapper;
import edu.gzmu.model.College;
import edu.gzmu.model.School;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import top.ibase4j.core.base.BaseService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 学院  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "College")
public class CollegeService extends BaseService<College> {
    @Autowired
    private SchoolService schoolService;

    private SchoolMapper schoolMapper;

    /**
     * set方法
     * @param schoolMapper 属性注入
     */
    @Autowired
    public void setSchoolMapper(SchoolMapper schoolMapper) {
        this.schoolMapper = schoolMapper;
    }

    /**
     * 二级联动获取下拉框所需的所有列表
     * @return 列表
     */
    public List<School> queryHierarchy(){
        return schoolMapper.queryHierarchy();
    }

    public College queryById(Long id) {
        College college = super.queryById(id);
        if (college != null && college.getSchoolId() != null) {
            School school = schoolService.queryById(college.getSchoolId());
            if (school != null) {
                college.setSchool(school);
            }
        }
        return college;
    }

    public Page<College> query(Map<String, Object> params) {
        School school = null;
        Page<College> pageInfo = super.query(params);
        for (College college : pageInfo.getRecords()) {
            if (college.getSchoolId() != null) {
                school = schoolService.queryById(college.getSchoolId());
                if (school != null) {
                    college.setSchool(school);
                } else {
                    college.setSchool(null);
                }
            }
        }
        return pageInfo;
    }
}