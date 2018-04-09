package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 用户授权表
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("用户授权表")
@TableName("sys_user_menu")
@SuppressWarnings("serial")
public class SysUserMenu extends SLPlatBaseModel {
	@TableField("user_id")
	private Long userId;
	@TableField("menu_id")
	private Long menuId;
	@ApiModelProperty(value = "权限标识")
	@TableField("permission_")
	private String permission;

	public SysUserMenu() {
	}

	public SysUserMenu(Long userId, Long menuId) {
		this.userId = userId;
		this.menuId = menuId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
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
		sb.append(", userId=").append(userId);
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
			SysUserMenu other = (SysUserMenu) that;
			return (this.getUserId() == null ? other.getUserId() == null : this.getUserId().equals(other.getUserId()))
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
		result = prime * result + ((getUserId() == null) ? 0 : getUserId().hashCode());
		result = prime * result + ((getMenuId() == null) ? 0 : getMenuId().hashCode());
		result = prime * result + ((getPermission() == null) ? 0 : getPermission().hashCode());
		return result;
	}
}