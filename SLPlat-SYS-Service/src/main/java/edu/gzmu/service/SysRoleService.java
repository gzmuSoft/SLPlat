package edu.gzmu.service;

import com.baomidou.mybatisplus.plugins.Page;
import org.apache.commons.lang3.StringUtils;
import edu.gzmu.model.SysDept;
import edu.gzmu.model.SysRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import top.ibase4j.core.base.BaseService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 角色  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "sysRole")
public class SysRoleService extends BaseService<SysRole> {
	@Autowired
	private SysDeptService sysDeptService;
	@Autowired
	private SysAuthorizeService sysAuthorizeService;

	public SysRole queryById(Long id) {
		SysRole sysRole = super.queryById(id);
		if (sysRole != null) {
			if (sysRole.getDeptId() != null) {
				SysDept sysDept = sysDeptService.queryById(sysRole.getDeptId());
				if (sysDept != null) {
					sysRole.setDeptName(sysDept.getName());
				} else {
					sysRole.setDeptId(null);
				}
			}

			List<String> permissions = sysAuthorizeService.queryRolePermission(sysRole.getId());
			for (String permission : permissions) {
				if (StringUtils.isBlank(sysRole.getPermission())) {
					sysRole.setPermission(permission);
				} else {
					sysRole.setPermission(sysRole.getPermission() + ";" + permission);
				}
			}
		}
		return sysRole;
	}

	public Page<SysRole> query(Map<String, Object> params) {
		Page<SysRole> pageInfo = super.query(params);
		// 权限信息
		for (SysRole bean : pageInfo.getRecords()) {
			if (bean.getDeptId() != null) {
				SysDept sysDept = sysDeptService.queryById(bean.getDeptId());
				if (sysDept != null) {
					bean.setDeptName(sysDept.getName());
				}
			}
			bean.setRoleTypeInfo();
			List<String> permissions = sysAuthorizeService.queryRolePermission(bean.getId());
			for (String permission : permissions) {
				if (StringUtils.isBlank(bean.getPermission())) {
					bean.setPermission(permission);
				} else {
					bean.setPermission(bean.getPermission() + ";" + permission);
				}
			}
		}
		return pageInfo;
	}
}
