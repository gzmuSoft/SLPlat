package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 用户
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("用户")
@SuppressWarnings("serial")
public class User extends SLPlatBaseModel {
    @ApiModelProperty(value = "用户来源（0：学生、1：教师、2：专家）")
	@TableField("source_of_user")
	private Long sourceOfUser;
    @ApiModelProperty(value = "用户实体编号")
	@TableField("user_entity_id")
	private Long userEntityId;
    @ApiModelProperty(value = "帐号")
	@TableField("login_name")
	private String loginName;
    @ApiModelProperty(value = "密码MD5(密码+盐)")
	@TableField("password_")
	private String password;
    @ApiModelProperty(value = "盐")
	@TableField("salt_")
	private String salt;
    @ApiModelProperty(value = "头像")
	@TableField("head_img_id")
	private Long headImgId;
    @ApiModelProperty(value = "电话")
	@TableField("phone_")
	private String phone;
    @ApiModelProperty(value = "邮箱")
	@TableField("email_")
	private String email;
    @ApiModelProperty(value = "性别")
	@TableField("gender_id")
	private Long genderId;
    @ApiModelProperty(value = "状态(true:正常, false:禁止)")
	@TableField("is_locked")
	private Boolean isLocked;

	public Long getSourceOfUser() {
		return sourceOfUser;
	}

	public void setSourceOfUser(Long sourceOfUser) {
		this.sourceOfUser = sourceOfUser;
	}

	public Long getUserEntityId() {
		return userEntityId;
	}

	public void setUserEntityId(Long userEntityId) {
		this.userEntityId = userEntityId;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSalt() {
		return salt;
	}

	public void setSalt(String salt) {
		this.salt = salt;
	}

	public Long getHeadImgId() {
		return headImgId;
	}

	public void setHeadImgId(Long headImgId) {
		this.headImgId = headImgId;
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

	public Long getGenderId() {
		return genderId;
	}

	public void setGenderId(Long genderId) {
		this.genderId = genderId;
	}

	public Boolean getLocked() {
		return isLocked;
	}

	public void setLocked(Boolean isLocked) {
		this.isLocked = isLocked;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", sourceOfUser=").append(sourceOfUser);
        sb.append(", userEntityId=").append(userEntityId);
        sb.append(", loginName=").append(loginName);
        sb.append(", password=").append(password);
        sb.append(", salt=").append(salt);
        sb.append(", headImgId=").append(headImgId);
        sb.append(", phone=").append(phone);
        sb.append(", email=").append(email);
        sb.append(", genderId=").append(genderId);
        sb.append(", isLocked=").append(isLocked);
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
            User other = (User) that;
            return (this.getSourceOfUser() == null ? other.getSourceOfUser() == null : this.getSourceOfUser().equals(other.getSourceOfUser()))
					&& (this.getUserEntityId() == null ? other.getUserEntityId() == null : this.getUserEntityId().equals(other.getUserEntityId()))
					&& (this.getLoginName() == null ? other.getLoginName() == null : this.getLoginName().equals(other.getLoginName()))
					&& (this.getPassword() == null ? other.getPassword() == null : this.getPassword().equals(other.getPassword()))
					&& (this.getSalt() == null ? other.getSalt() == null : this.getSalt().equals(other.getSalt()))
					&& (this.getHeadImgId() == null ? other.getHeadImgId() == null : this.getHeadImgId().equals(other.getHeadImgId()))
					&& (this.getPhone() == null ? other.getPhone() == null : this.getPhone().equals(other.getPhone()))
					&& (this.getEmail() == null ? other.getEmail() == null : this.getEmail().equals(other.getEmail()))
					&& (this.getGenderId() == null ? other.getGenderId() == null : this.getGenderId().equals(other.getGenderId()))
					&& (this.getLocked() == null ? other.getLocked() == null : this.getLocked().equals(other.getLocked()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getSourceOfUser() == null) ? 0 : getSourceOfUser().hashCode());
        result = prime * result + ((getUserEntityId() == null) ? 0 : getUserEntityId().hashCode());
        result = prime * result + ((getLoginName() == null) ? 0 : getLoginName().hashCode());
        result = prime * result + ((getPassword() == null) ? 0 : getPassword().hashCode());
        result = prime * result + ((getSalt() == null) ? 0 : getSalt().hashCode());
        result = prime * result + ((getHeadImgId() == null) ? 0 : getHeadImgId().hashCode());
        result = prime * result + ((getPhone() == null) ? 0 : getPhone().hashCode());
        result = prime * result + ((getEmail() == null) ? 0 : getEmail().hashCode());
        result = prime * result + ((getGenderId() == null) ? 0 : getGenderId().hashCode());
        result = prime * result + ((getLocked() == null) ? 0 : getLocked().hashCode());
        return result;
    }
}