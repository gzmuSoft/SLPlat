package edu.gzmu.service;

import edu.gzmu.model.SingleSelect;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 单项选择题  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "SingleSelect")
public class SingleSelectService extends BaseService<SingleSelect> {
	
}