package edu.gzmu.mapper;

import edu.gzmu.model.SysMenu;
import top.ibase4j.core.base.BaseMapper;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
public interface SysMenuMapper extends BaseMapper<SysMenu> {
	/** 获取所有权限 */
	public List<Map<String, String>> getPermissions();
}