package edu.gzmu.service;

import com.baomidou.mybatisplus.plugins.Page;
import edu.gzmu.model.SysUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import top.ibase4j.core.base.BaseService;
import top.ibase4j.model.SysEvent;

import java.util.Map;
/**
 * <p>
 * 系统日志  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "sysEvent")
public class SysEventService extends BaseService<SysEvent> {
	@Autowired
	private SysUserService sysUserService;

	public Page<SysEvent> query(Map<String, Object> params) {
		Page<SysEvent> page = super.query(params);
		for (SysEvent sysEvent : page.getRecords()) {
			if (sysEvent != null) {
				Long createBy = sysEvent.getCreateBy();
				if (createBy != null) {
					SysUser sysUser = sysUserService.queryById(createBy);
					if (sysUser != null) {
						sysEvent.setUserName(sysUser.getName());
					} else {
						sysEvent.setUserName(createBy.toString());
					}
				}
			}
		}
		return page;
	}
}
