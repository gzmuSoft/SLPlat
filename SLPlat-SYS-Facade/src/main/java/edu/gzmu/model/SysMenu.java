package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import edu.gzmu.model.base.SLPlatBaseModel;

import java.util.List;

/**
 * <p>
 * 菜单
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("菜单")
@TableName("sys_menu")
@SuppressWarnings("serial")
public class SysMenu extends SLPlatBaseModel {
	@ApiModelProperty(value = "菜单类型(0:CURD;1:系统菜单;2:业务菜单;)")
	@TableField("menu_type")
	private Integer menuType;
	@ApiModelProperty(value = "上级菜单编号")
	@TableField("parent_id")
	private Long parentId;
	@ApiModelProperty(value = "节点图标CSS类名")
	@TableField("iconcls_")
	private String iconcls;
	@ApiModelProperty(value = "请求地址")
	@TableField("request_")
	private String request;
	@ApiModelProperty(value = "展开状态(1:展开;0:收缩)")
	@TableField("expand_")
	private Boolean expand;
	@ApiModelProperty(value = "叶子节点(0:树枝节点;1:叶子节点)")
	@TableField("is_show")
	private Boolean isShow;
	@ApiModelProperty(value = "权限标识")
	@TableField("permission_")
	private String permission;

	@TableField(exist = false)
	private String parentName;
	@TableField(exist = false)
	private Integer leaf = 1;
	@TableField(exist = false)
	private String typeName;
	@TableField(exist = false)
	private String permissionText;
	@TableField(exist = false)
	private List<SysMenu> menuBeans;

	/**
	 * @return the value of sys_menu.menu_type
	 */
	public Integer getMenuType() {
		return menuType;
	}

	/**
	 * @param menuType
	 *            the value for sys_menu.menu_type
	 */
	public void setMenuType(Integer menuType) {
		this.menuType = menuType;
	}

	/**
	 * @return the value of sys_menu.parent_id
	 */
	public Long getParentId() {
		return parentId;
	}

	/**
	 * @param parentId
	 *            the value for sys_menu.parent_id
	 */
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	/**
	 * @return the value of sys_menu.iconcls_
	 */
	public String getIconcls() {
		return iconcls;
	}

	/**
	 * @param iconcls
	 *            the value for sys_menu.iconcls_
	 */
	public void setIconcls(String iconcls) {
		this.iconcls = iconcls == null ? null : iconcls.trim();
	}

	/**
	 * @return the value of sys_menu.request_
	 */
	public String getRequest() {
		return request;
	}

	/**
	 * @param request
	 *            the value for sys_menu.request_
	 */
	public void setRequest(String request) {
		this.request = request == null ? null : request.trim();
	}

	/**
	 * @return the value of sys_menu.expand_
	 */
	public Boolean getExpand() {
		return expand;
	}

	/**
	 * @param expand
	 *            the value for sys_menu.expand_
	 */
	public void setExpand(Boolean expand) {
		this.expand = expand;
	}

	/**
	 * @return the value of sys_menu.is_show
	 */
	public Boolean getIsShow() {
		return isShow;
	}

	/**
	 * @param isShow
	 *            the value for sys_menu.is_show
	 */
	public void setIsShow(Boolean isShow) {
		this.isShow = isShow;
	}

	/**
	 * @return the value of sys_menu.permission_
	 */
	public String getPermission() {
		return permission;
	}

	/**
	 * @param permission
	 *            the value for sys_menu.permission_
	 */
	public void setPermission(String permission) {
		this.permission = permission == null ? null : permission.trim();
	}

	public Integer getLeaf() {
		return leaf;
	}

	public void setLeaf(Integer leaf) {
		this.leaf = leaf;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getPermissionText() {
		return permissionText;
	}

	public void setPermissionText(String permissionText) {
		this.permissionText = permissionText;
	}

	public List<SysMenu> getMenuBeans() {
		return menuBeans;
	}

	public void setMenuBeans(List<SysMenu> menuBeans) {
		this.menuBeans = menuBeans;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

	/**
	 * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
	 */
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(super.getSubToString());
		sb.append(", menuType=").append(menuType);
		sb.append(", parentId=").append(parentId);
		sb.append(", iconcls=").append(iconcls);
		sb.append(", request=").append(request);
		sb.append(", expand=").append(expand);
		sb.append(", isShow=").append(isShow);
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
			SysMenu other = (SysMenu) that;
			return (this.getMenuType() == null ? other.getMenuType() == null
                    : this.getMenuType().equals(other.getMenuType()))
                    && (this.getParentId() == null ? other.getParentId() == null
                    : this.getParentId().equals(other.getParentId()))
                    && (this.getIconcls() == null ? other.getIconcls() == null
                    : this.getIconcls().equals(other.getIconcls()))
                    && (this.getRequest() == null ? other.getRequest() == null
                    : this.getRequest().equals(other.getRequest()))
                    && (this.getExpand() == null ? other.getExpand() == null : this.getExpand().equals(other.getExpand()))
                    && (this.getIsShow() == null ? other.getIsShow() == null : this.getIsShow().equals(other.getIsShow()))
                    && (this.getPermission() == null ? other.getPermission() == null
                    : this.getPermission().equals(other.getPermission()));
		}
	}

	/**
	 * 获取当前对象的hashCode编码值
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((getMenuType() == null) ? 0 : getMenuType().hashCode());
		result = prime * result + ((getParentId() == null) ? 0 : getParentId().hashCode());
		result = prime * result + ((getIconcls() == null) ? 0 : getIconcls().hashCode());
		result = prime * result + ((getRequest() == null) ? 0 : getRequest().hashCode());
		result = prime * result + ((getExpand() == null) ? 0 : getExpand().hashCode());
		result = prime * result + ((getIsShow() == null) ? 0 : getIsShow().hashCode());
		result = prime * result + ((getPermission() == null) ? 0 : getPermission().hashCode());
		return result;
	}
}