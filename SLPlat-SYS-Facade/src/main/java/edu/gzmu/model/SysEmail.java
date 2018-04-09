package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

/**
 * <p>
 * 邮件表
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("邮件表")
@TableName("sys_email")
@SuppressWarnings("serial")
public class SysEmail extends SLPlatBaseModel {
	@ApiModelProperty(value = "使用发送")
	@TableField("sender_")
	private String sender;
	@ApiModelProperty(value = "发送标题")
	@TableField("email_Title")
	private String emailTitle;
	@ApiModelProperty(value = "发送内容")
	@TableField("email_Content")
	private String emailContent;

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getEmailTitle() {
		return emailTitle;
	}

	public void setEmailTitle(String emailTitle) {
		this.emailTitle = emailTitle;
	}

	public String getEmailContent() {
		return emailContent;
	}

	public void setEmailContent(String emailContent) {
		this.emailContent = emailContent;
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
		sb.append(", sender=").append(sender);
		sb.append(", emailTitle=").append(emailTitle);
		sb.append(", emailContent=").append(emailContent);
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
			SysEmail other = (SysEmail) that;
			return (this.getSender() == null ? other.getSender() == null : this.getSender().equals(other.getSender()))
					&& (this.getEmailTitle() == null ? other.getEmailTitle() == null : this.getEmailTitle().equals(other.getEmailTitle()))
					&& (this.getEmailContent() == null ? other.getEmailContent() == null : this.getEmailContent().equals(other.getEmailContent()));
		}
	}

	/**
	 * 获取当前对象的hashCode编码值
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((getSender() == null) ? 0 : getSender().hashCode());
		result = prime * result + ((getEmailTitle() == null) ? 0 : getEmailTitle().hashCode());
		result = prime * result + ((getEmailContent() == null) ? 0 : getEmailContent().hashCode());
		return result;
	}
}
