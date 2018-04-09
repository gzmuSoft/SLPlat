package edu.gzmu.service;

import edu.gzmu.model.UserRole;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户角色关联  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "UserRole")
public class UserRoleService extends BaseService<UserRole> {
	
}