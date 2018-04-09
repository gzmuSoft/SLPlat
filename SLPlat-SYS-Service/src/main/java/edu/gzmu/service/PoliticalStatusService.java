package edu.gzmu.service;

import edu.gzmu.model.PoliticalStatus;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 政治面貌  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "PoliticalStatus")
public class PoliticalStatusService extends BaseService<PoliticalStatus> {
	
}