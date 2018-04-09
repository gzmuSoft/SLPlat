package edu.gzmu.service;

import edu.gzmu.model.SysMsg;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import top.ibase4j.core.base.BaseService;

/**
 * <p>
 * 短信  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "sysMsg")
public class SysMsgService extends BaseService<SysMsg> {
	
}