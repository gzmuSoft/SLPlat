package edu.gzmu.service;

import edu.gzmu.model.PostgraduateSituation;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 考研情况  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "PostgraduateSituation")
public class PostgraduateSituationService extends BaseService<PostgraduateSituation> {
	
}