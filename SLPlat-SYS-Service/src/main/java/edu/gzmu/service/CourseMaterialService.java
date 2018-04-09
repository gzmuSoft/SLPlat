package edu.gzmu.service;

import edu.gzmu.model.CourseMaterial;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 课程教材  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "CourseMaterial")
public class CourseMaterialService extends BaseService<CourseMaterial> {
	
}