package edu.gzmu.service;

import com.baomidou.mybatisplus.plugins.Page;
import edu.gzmu.model.SysDept;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import top.ibase4j.core.base.BaseService;

import java.util.Map;

/**
 * <p>
 * 部门  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "sysDept")
public class SysDeptService extends BaseService<SysDept> {
	public SysDept queryById(Long id) {
		SysDept sysDept = super.queryById(id);
		if (sysDept != null) {
			if (sysDept.getParentId() != null) {
				SysDept parent = super.queryById(sysDept.getParentId());
				if (parent != null) {
					sysDept.setParentName(parent.getName());
				} else {
					sysDept.setParentId(null);
				}
			}
		}
		return sysDept;
	}

	public Page<SysDept> query(Map<String, Object> params) {
		Page<SysDept> pageInfo = super.query(params);
		for (SysDept sysDept : pageInfo.getRecords()) {
			if (sysDept.getParentId() != null) {
				SysDept tmp = super.queryById(sysDept.getParentId());
				if (tmp != null) {
					sysDept.setParentName(tmp.getName());
				}
			}
		}
		return pageInfo;
	}
}
