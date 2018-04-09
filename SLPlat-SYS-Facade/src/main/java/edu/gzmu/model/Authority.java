package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 权限
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("权限")
@SuppressWarnings("serial")
public class Authority extends SLPlatBaseModel {
    @ApiModelProperty(value = "所属上级")
	@TableField("prent_id")
	private Long prentId;
    @ApiModelProperty(value = "类型(1:目录,2:菜单,3:按钮)")
	@TableField("type_")
	private Long type;
    @ApiModelProperty(value = "权限值")
	@TableField("permission_value")
	private String permissionValue;
    @ApiModelProperty(value = "路径")
	@TableField("uri_")
	private String uri;
    @ApiModelProperty(value = "图标")
	@TableField("icon_")
	private String icon;
    @ApiModelProperty(value = "状态(true:正常, false:禁止)")
	@TableField("status_")
	private Boolean status;

	public Long getPrentId() {
		return prentId;
	}

	public void setPrentId(Long prentId) {
		this.prentId = prentId;
	}

	public Long getType() {
		return type;
	}

	public void setType(Long type) {
		this.type = type;
	}

	public String getPermissionValue() {
		return permissionValue;
	}

	public void setPermissionValue(String permissionValue) {
		this.permissionValue = permissionValue;
	}

	public String getUri() {
		return uri;
	}

	public void setUri(String uri) {
		this.uri = uri;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", prentId=").append(prentId);
        sb.append(", type=").append(type);
        sb.append(", permissionValue=").append(permissionValue);
        sb.append(", uri=").append(uri);
        sb.append(", icon=").append(icon);
        sb.append(", status=").append(status);
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
            Authority other = (Authority) that;
            return (this.getPrentId() == null ? other.getPrentId() == null : this.getPrentId().equals(other.getPrentId()))
					&& (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()))
					&& (this.getPermissionValue() == null ? other.getPermissionValue() == null : this.getPermissionValue().equals(other.getPermissionValue()))
					&& (this.getUri() == null ? other.getUri() == null : this.getUri().equals(other.getUri()))
					&& (this.getIcon() == null ? other.getIcon() == null : this.getIcon().equals(other.getIcon()))
					&& (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getPrentId() == null) ? 0 : getPrentId().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        result = prime * result + ((getPermissionValue() == null) ? 0 : getPermissionValue().hashCode());
        result = prime * result + ((getUri() == null) ? 0 : getUri().hashCode());
        result = prime * result + ((getIcon() == null) ? 0 : getIcon().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        return result;
    }
}