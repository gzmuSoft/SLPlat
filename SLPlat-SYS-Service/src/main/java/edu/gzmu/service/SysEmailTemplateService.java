package edu.gzmu.service;

import edu.gzmu.model.SysEmailTemplate;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import top.ibase4j.core.base.BaseService;

/**
 * <p>
 * 邮件模板  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "sysEmailTemplate")
public class SysEmailTemplateService extends BaseService<SysEmailTemplate> {

}
