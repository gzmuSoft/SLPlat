package edu.gzmu.service;

import edu.gzmu.model.KnowledgePoint;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 知识点  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "KnowledgePoint")
public class KnowledgePointService extends BaseService<KnowledgePoint> {
	
}