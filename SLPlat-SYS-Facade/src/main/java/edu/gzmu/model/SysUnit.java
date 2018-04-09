package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 单位表
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("单位表")
@TableName("sys_unit")
@SuppressWarnings("serial")
public class SysUnit extends SLPlatBaseModel {
	@ApiModelProperty(value = "负责人")
	@TableField("principal_")
	private String principal;
	@ApiModelProperty(value = "联系电话")
	@TableField("phone_")
	private String phone;
	@ApiModelProperty(value = "地址")
	@TableField("address_")
	private String address;

	public String getPrincipal() {
		return principal;
	}

	public void setPrincipal(String principal) {
		this.principal = principal;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
	 */
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(super.getSubToString());
		sb.append(", principal=").append(principal);
		sb.append(", phone=").append(phone);
		sb.append(", address=").append(address);
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
			SysUnit other = (SysUnit) that;
			return true
					&& (this.getPrincipal() == null ? other.getPrincipal() == null : this.getPrincipal().equals(other.getPrincipal()))
					&& (this.getPhone() == null ? other.getPhone() == null : this.getPhone().equals(other.getPhone()))
					&& (this.getAddress() == null ? other.getAddress() == null : this.getAddress().equals(other.getAddress()))
					;
		}
	}

	/**
	 * 获取当前对象的hashCode编码值
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((getPrincipal() == null) ? 0 : getPrincipal().hashCode());
		result = prime * result + ((getPhone() == null) ? 0 : getPhone().hashCode());
		result = prime * result + ((getAddress() == null) ? 0 : getAddress().hashCode());
		return result;
	}
}