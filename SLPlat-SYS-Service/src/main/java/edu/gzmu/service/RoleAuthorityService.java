package edu.gzmu.service;

import edu.gzmu.model.RoleAuthority;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 角色权限关联  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "RoleAuthority")
public class RoleAuthorityService extends BaseService<RoleAuthority> {
	
}