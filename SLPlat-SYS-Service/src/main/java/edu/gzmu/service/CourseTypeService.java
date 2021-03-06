package edu.gzmu.service;

import edu.gzmu.model.CourseType;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 课程类型  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "CourseType")
public class CourseTypeService extends BaseService<CourseType> {
    public CourseType queryById(Long id){
        CourseType courseType = super.queryById(id);
        return courseType;
    }
}