package edu.gzmu.service;

import edu.gzmu.model.Town;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 镇  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "Town")
public class TownService extends BaseService<Town> {
	
}