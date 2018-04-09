package edu.gzmu.mapper;

import edu.gzmu.model.SysRoleMenu;
import org.apache.ibatis.annotations.Param;
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
public interface SysRoleMenuMapper extends BaseMapper<SysRoleMenu> {
	List<Long> queryMenuIdsByRoleId(@Param("roleId") Long roleId);

	List<Map<String, Object>> queryPermissions(@Param("roleId") Long roleId);

	List<String> queryPermission(@Param("roleId") Long id);
}
