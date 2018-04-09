package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 角色授权表
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("角色授权表")
@TableName("sys_role_menu")
@SuppressWarnings("serial")
public class SysRoleMenu extends SLPlatBaseModel {
	@TableField("role_id")
	private Long roleId;
	@TableField("menu_id")
	private Long menuId;
	@ApiModelProperty(value = "权限标识")
	@TableField("permission_")
	private String permission;

	public SysRoleMenu() {
	}

	public SysRoleMenu(Long roleId, Long menuId) {
		this.roleId = roleId;
		this.menuId = menuId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getMenuId() {
		return menuId;
	}

	public void setMenuId(Long menuId) {
		this.menuId = menuId;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission == null ? null : permission.trim();
	}

	/**
	 * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
	 */
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(super.getSubToString());
		sb.append(", roleId=").append(roleId);
		sb.append(", menuId=").append(menuId);
		sb.append(", permission=").append(permission);
		sb.append("]");
		return sb.toString();
	}

	/**
	 * 判断两个对象是否相等
	 */
	@Override
	public boolean equals(Object that) {
		if (!super.equals(that)) {
			return false;
		}
		else {
			SysRoleMenu other = (SysRoleMenu) that;
			return (this.getRoleId() == null ? other.getRoleId() == null : this.getRoleId().equals(other.getRoleId()))
					&& (this.getMenuId() == null ? other.getMenuId() == null : this.getMenuId().equals(other.getMenuId()))
					&& (this.getPermission() == null ? other.getPermission() == null : this.getPermission().equals(other.getPermission()));
		}
	}

	/**
	 * 获取当前对象的hashCode编码值
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((getRoleId() == null) ? 0 : getRoleId().hashCode());
		result = prime * result + ((getMenuId() == null) ? 0 : getMenuId().hashCode());
		result = prime * result + ((getPermission() == null) ? 0 : getPermission().hashCode());
		return result;
	}
}
