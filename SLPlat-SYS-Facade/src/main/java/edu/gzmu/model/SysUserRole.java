package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;
import io.swagger.annotations.ApiModel;

/**
 * <p>
 * 用户授权表
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("用户授权表")
@TableName("sys_user_role")
@SuppressWarnings("serial")
public class SysUserRole extends SLPlatBaseModel {
	@TableField("user_id")
	private Long userId;
	@TableField("role_id")
	private Long roleId;

	public SysUserRole() {
	}

	public SysUserRole(Long userId, Long roleId) {
		this.userId = userId;
		this.roleId = roleId;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
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
		sb.append(", roleId=").append(roleId);
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
			SysUserRole other = (SysUserRole) that;
			return (this.getUserId() == null ? other.getUserId() == null : this.getUserId().equals(other.getUserId()))
					&& (this.getRoleId() == null ? other.getRoleId() == null : this.getRoleId().equals(other.getRoleId()));
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
		result = prime * result + ((getRoleId() == null) ? 0 : getRoleId().hashCode());
		return result;
	}
}
