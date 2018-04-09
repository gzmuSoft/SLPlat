package edu.gzmu.mapper;

import edu.gzmu.model.SysMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * Mapper接口
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
public interface SysAuthorizeMapper {

	void deleteUserMenu(@Param("userId") Long userId, @Param("permission") String permission);

	void deleteUserRole(@Param("userId") Long userId);

	void deleteRoleMenu(@Param("roleId") Long roleId, @Param("permission") String permission);

	List<Long> getAuthorize(@Param("userId") Long userId);

	List<String> queryPermissionByUserId(@Param("userId") Long userId);

	List<SysMenu> queryMenusPermission();
}
