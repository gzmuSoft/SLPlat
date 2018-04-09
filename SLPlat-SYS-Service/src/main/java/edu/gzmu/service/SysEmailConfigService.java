package edu.gzmu.service;

import edu.gzmu.model.SysEmailConfig;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import top.ibase4j.core.base.BaseService;

/**
 * <p>
 * 邮件配置  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "sysEmailConfig")
public class SysEmailConfigService extends BaseService<SysEmailConfig> {

}
