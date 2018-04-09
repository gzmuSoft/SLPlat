package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 角色信息表
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("角色信息表")
@TableName("sys_role")
@SuppressWarnings("serial")
public class SysRole extends SLPlatBaseModel {
	@ApiModelProperty(value = "所属部门编号")
	@TableField("dept_id")
	private Long deptId;
	@ApiModelProperty(value = "角色类型(1:业务角色;2:管理角色 ;3:系统内置角色)")
	@TableField("role_type")
	private Integer roleType;

	@TableField(exist = false)
	private String deptName;
	@TableField(exist = false)
	private String permission;
	@TableField(exist = false)
	private String roleTypeInfo;

	/**
	 * 返回roleType值所表示的含义的字符串信息
	 * @return roleType值所表示的含义的字符串信息
	 */
	public String getRoleTypeInfo() {
		return roleTypeInfo;
	}

	/**
	 * 根据roleType的值，设置roleTypeInfo为其所表示的含义的字符串信息
	 */
	public void setRoleTypeInfo() {
		if (roleType.equals(1)) {
			roleTypeInfo = "业务角色";
		} else if (roleType.equals(2)) {
			roleTypeInfo = "管理角色";
		} else if (roleType.equals(3)) {
			roleTypeInfo = "系统内置角色";
		}
	}
	/**
	 * @return the value of sys_role.dept_id
	 */
	public Long getDeptId() {
		return deptId;
	}

	/**
	 * @param deptId
	 *            the value for sys_role.dept_id
	 */
	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}

	/**
	 * @return the value of sys_role.role_type
	 */
	public Integer getRoleType() {
		return roleType;
	}

	/**
	 * @param roleType
	 *            the value for sys_role.role_type
	 */
	public void setRoleType(Integer roleType) {
		this.roleType = roleType;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	/**
	 * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
	 */
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(super.getSubToString());
		sb.append(", deptId=").append(deptId);
		sb.append(", roleType=").append(roleType);
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
			SysRole other = (SysRole) that;
			return (this.getDeptId() == null ? other.getDeptId() == null : this.getDeptId().equals(other.getDeptId()))
					&& (this.getRoleType() == null ? other.getRoleType() == null : this.getRoleType().equals(other.getRoleType()));
		}
	}

	/**
	 * 获取当前对象的hashCode编码值
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((getDeptId() == null) ? 0 : getDeptId().hashCode());
		result = prime * result + ((getRoleType() == null) ? 0 : getRoleType().hashCode());
		return result;
	}
}