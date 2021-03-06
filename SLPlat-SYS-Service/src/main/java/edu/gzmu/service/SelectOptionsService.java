package edu.gzmu.service;

import edu.gzmu.model.SelectOptions;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 选择题选项  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "SelectOptions")
public class SelectOptionsService extends BaseService<SelectOptions> {
	
}