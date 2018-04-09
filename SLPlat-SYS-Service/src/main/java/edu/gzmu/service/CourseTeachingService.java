package edu.gzmu.service;

import edu.gzmu.model.CourseTeaching;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 课程讲授  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "CourseTeaching")
public class CourseTeachingService extends BaseService<CourseTeaching> {
	
}