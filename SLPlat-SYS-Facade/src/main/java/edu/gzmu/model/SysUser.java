package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.Date;

/**
 * <p>
 * 用户管理
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("用户管理")
@TableName("sys_user")
@SuppressWarnings("serial")
public class SysUser extends SLPlatBaseModel {
	@ApiModelProperty(value = "登陆帐户")
	@TableField("account_")
	private String account;
	@ApiModelProperty(value = "密码")
	@TableField("password_")
	private String password;
	@ApiModelProperty(value = "用户类型(1普通用户2管理员3系统用户)")
	@TableField("user_type")
	private String userType;
	@ApiModelProperty(value = "性别(0:未知;1:男;2:女)")
	@TableField("sex_")
	private Integer sex;
	@ApiModelProperty(value = "头像")
	@TableField("avatar_")
	private String avatar;
	@ApiModelProperty(value = "电话")
	@TableField("phone_")
	private String phone;
	@ApiModelProperty(value = "邮箱")
	@TableField("email_")
	private String email;
	@ApiModelProperty(value = "身份证号码")
	@TableField("id_card")
	private String idCard;
	@ApiModelProperty(value = "微信")
	@TableField("wei_xin")
	private String weiXin;
	@ApiModelProperty(value = "微博")
	@TableField("wei_bo")
	private String weiBo;
	@ApiModelProperty(value = "QQ")
	@TableField("qq_")
	private String qq;
	@ApiModelProperty(value = "出生日期")
	@TableField("birth_day")
	private Date birthDay;
	@ApiModelProperty(value = "部门编号")
	@TableField("dept_id")
	private Long deptId;
	@ApiModelProperty(value = "职位")
	@TableField("position_")
	private String position;
	@ApiModelProperty(value = "详细地址")
	@TableField("address_")
	private String address;
	@ApiModelProperty(value = "工号")
	@TableField("staff_no")
	private String staffNo;

	@TableField(exist = false)
	private String oldPassword;
	@TableField(exist = false)
	private String deptName;
	@TableField(exist = false)
	private String userTypeText;
	@TableField(exist = false)
	private String permission;

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getWeiXin() {
		return weiXin;
	}

	public void setWeiXin(String weiXin) {
		this.weiXin = weiXin;
	}

	public String getWeiBo() {
		return weiBo;
	}

	public void setWeiBo(String weiBo) {
		this.weiBo = weiBo;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public Long getDeptId() {
		return deptId;
	}

	public void setDeptId(Long deptId) {
		this.deptId = deptId;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStaffNo() {
		return staffNo;
	}

	public void setStaffNo(String staffNo) {
		this.staffNo = staffNo;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getUserTypeText() {
		return userTypeText;
	}

	public void setUserTypeText(String userTypeText) {
		this.userTypeText = userTypeText;
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
		sb.append(", account=").append(account);
		sb.append(", password=").append(password);
		sb.append(", userType=").append(userType);
		sb.append(", sex=").append(sex);
		sb.append(", avatar=").append(avatar);
		sb.append(", phone=").append(phone);
		sb.append(", email=").append(email);
		sb.append(", idCard=").append(idCard);
		sb.append(", weiXin=").append(weiXin);
		sb.append(", weiBo=").append(weiBo);
		sb.append(", qq=").append(qq);
		sb.append(", birthDay=").append(birthDay);
		sb.append(", deptId=").append(deptId);
		sb.append(", position=").append(position);
		sb.append(", address=").append(address);
		sb.append(", staffNo=").append(staffNo);
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
			SysUser other = (SysUser) that;
			return (this.getAccount() == null ? other.getAccount() == null : this.getAccount().equals(other.getAccount()))
					&& (this.getPassword() == null ? other.getPassword() == null : this.getPassword().equals(other.getPassword()))
					&& (this.getUserType() == null ? other.getUserType() == null : this.getUserType().equals(other.getUserType()))
					&& (this.getSex() == null ? other.getSex() == null : this.getSex().equals(other.getSex()))
					&& (this.getAvatar() == null ? other.getAvatar() == null : this.getAvatar().equals(other.getAvatar()))
					&& (this.getPhone() == null ? other.getPhone() == null : this.getPhone().equals(other.getPhone()))
					&& (this.getEmail() == null ? other.getEmail() == null : this.getEmail().equals(other.getEmail()))
					&& (this.getIdCard() == null ? other.getIdCard() == null : this.getIdCard().equals(other.getIdCard()))
					&& (this.getWeiXin() == null ? other.getWeiXin() == null : this.getWeiXin().equals(other.getWeiXin()))
					&& (this.getWeiBo() == null ? other.getWeiBo() == null : this.getWeiBo().equals(other.getWeiBo()))
					&& (this.getQq() == null ? other.getQq() == null : this.getQq().equals(other.getQq()))
					&& (this.getBirthDay() == null ? other.getBirthDay() == null : this.getBirthDay().equals(other.getBirthDay()))
					&& (this.getDeptId() == null ? other.getDeptId() == null : this.getDeptId().equals(other.getDeptId()))
					&& (this.getPosition() == null ? other.getPosition() == null : this.getPosition().equals(other.getPosition()))
					&& (this.getAddress() == null ? other.getAddress() == null : this.getAddress().equals(other.getAddress()))
					&& (this.getStaffNo() == null ? other.getStaffNo() == null : this.getStaffNo().equals(other.getStaffNo()));
		}
	}

	/**
	 * 获取当前对象的hashCode编码值
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((getAccount() == null) ? 0 : getAccount().hashCode());
		result = prime * result + ((getPassword() == null) ? 0 : getPassword().hashCode());
		result = prime * result + ((getUserType() == null) ? 0 : getUserType().hashCode());
		result = prime * result + ((getSex() == null) ? 0 : getSex().hashCode());
		result = prime * result + ((getAvatar() == null) ? 0 : getAvatar().hashCode());
		result = prime * result + ((getPhone() == null) ? 0 : getPhone().hashCode());
		result = prime * result + ((getEmail() == null) ? 0 : getEmail().hashCode());
		result = prime * result + ((getIdCard() == null) ? 0 : getIdCard().hashCode());
		result = prime * result + ((getWeiXin() == null) ? 0 : getWeiXin().hashCode());
		result = prime * result + ((getWeiBo() == null) ? 0 : getWeiBo().hashCode());
		result = prime * result + ((getQq() == null) ? 0 : getQq().hashCode());
		result = prime * result + ((getBirthDay() == null) ? 0 : getBirthDay().hashCode());
		result = prime * result + ((getDeptId() == null) ? 0 : getDeptId().hashCode());
		result = prime * result + ((getPosition() == null) ? 0 : getPosition().hashCode());
		result = prime * result + ((getAddress() == null) ? 0 : getAddress().hashCode());
		result = prime * result + ((getStaffNo() == null) ? 0 : getStaffNo().hashCode());
		return result;
	}
}