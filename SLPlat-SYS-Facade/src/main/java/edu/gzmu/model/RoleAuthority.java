package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 角色权限关联
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("角色权限关联")
@TableName("role_authority")
@SuppressWarnings("serial")
public class RoleAuthority extends SLPlatBaseModel {
    @ApiModelProperty(value = "角色编号")
	@TableField("role_id")
	private Long roleId;
    @ApiModelProperty(value = "权限编号")
	@TableField("authority_id")
	private Long authorityId;

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public Long getAuthorityId() {
		return authorityId;
	}

	public void setAuthorityId(Long authorityId) {
		this.authorityId = authorityId;
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
        sb.append(", authorityId=").append(authorityId);
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
            RoleAuthority other = (RoleAuthority) that;
            return (this.getRoleId() == null ? other.getRoleId() == null : this.getRoleId().equals(other.getRoleId()))
                    && (this.getAuthorityId() == null ? other.getAuthorityId() == null : this.getAuthorityId().equals(other.getAuthorityId()));
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
        result = prime * result + ((getAuthorityId() == null) ? 0 : getAuthorityId().hashCode());
        return result;
    }
}