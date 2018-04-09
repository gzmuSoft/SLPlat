package edu.gzmu.mapper;

import edu.gzmu.model.SysUserMenu;
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
public interface SysUserMenuMapper extends BaseMapper<SysUserMenu> {
	List<Long> queryMenuIdsByUserId(@Param("userId") Long userId);

	List<Map<String, Object>> queryPermissions(@Param("userId") Long userId);

	List<String> queryPermission(@Param("userId") Long id);
}