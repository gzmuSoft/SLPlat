package edu.gzmu.service;

import edu.gzmu.model.SysUnit;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import top.ibase4j.core.base.BaseService;

/**
 * <p>
 * 单位  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "sysUnit")
public class SysUnitService extends BaseService<SysUnit> {

}
