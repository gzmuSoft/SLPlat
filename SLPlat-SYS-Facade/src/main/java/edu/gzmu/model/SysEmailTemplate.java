package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

/**
 * <p>
 * 邮件模版表
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("邮件模版表")
@TableName("sys_email_template")
@SuppressWarnings("serial")
public class SysEmailTemplate extends SLPlatBaseModel {
	@ApiModelProperty(value = "发送邮件帐号")
	@TableField("email_account")
	private String emailAccount;
	@ApiModelProperty(value = "标题模版")
	@TableField("title_")
	private String title;
	@ApiModelProperty(value = "内容模板")
	@TableField("template_")
	private String template;

	public String getEmailAccount() {
		return emailAccount;
	}

	public void setEmailAccount(String emailAccount) {
		this.emailAccount = emailAccount;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTemplate() {
		return template;
	}

	public void setTemplate(String template) {
		this.template = template;
	}

	protected Serializable pkVal() {
		return getId();
	}

	/**
	 * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
	 */
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(super.getSubToString());
		sb.append(", emailAccount=").append(emailAccount);
		sb.append(", title=").append(title);
		sb.append(", template=").append(template);
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
			SysEmailTemplate other = (SysEmailTemplate) that;
			return (this.getEmailAccount() == null ? other.getEmailAccount() == null : this.getEmailAccount().equals(other.getEmailAccount()))
					&& (this.getTitle() == null ? other.getTitle() == null : this.getTitle().equals(other.getTitle()))
					&& (this.getTemplate() == null ? other.getTemplate() == null : this.getTemplate().equals(other.getTemplate()));
		}
	}

	/**
	 * 获取当前对象的hashCode编码值
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((getEmailAccount() == null) ? 0 : getEmailAccount().hashCode());
		result = prime * result + ((getTitle() == null) ? 0 : getTitle().hashCode());
		result = prime * result + ((getTemplate() == null) ? 0 : getTemplate().hashCode());
		return result;
	}
}
