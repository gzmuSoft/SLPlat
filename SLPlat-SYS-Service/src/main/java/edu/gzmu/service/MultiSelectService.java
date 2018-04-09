package edu.gzmu.service;

import edu.gzmu.model.MultiSelect;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 多项选择题  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "MultiSelect")
public class MultiSelectService extends BaseService<MultiSelect> {
	
}