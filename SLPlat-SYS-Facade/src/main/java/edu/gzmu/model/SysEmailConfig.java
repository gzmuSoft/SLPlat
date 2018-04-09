package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.io.Serializable;

/**
 * <p>
 * 邮件配置表
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("邮件配置表")
@TableName("sys_email_config")
@SuppressWarnings("serial")
public class SysEmailConfig extends SLPlatBaseModel {
	@ApiModelProperty(value = "SMTP服务器")
	@TableField("smtp_host")
	private String smtpHost;
	@ApiModelProperty(value = "SMTP服务器端口")
	@TableField("smtp_port")
	private String smtpPort;
	@ApiModelProperty(value = "发送方式")
	@TableField("send_method")
	private String sendMethod;
	@ApiModelProperty(value = "名称")
	@TableField("sender_name")
	private String senderName;
	@ApiModelProperty(value = "发邮件邮箱账号")
	@TableField("sender_account")
	private String senderAccount;
	@ApiModelProperty(value = "发邮件邮箱密码")
	@TableField("sender_password")
	private String senderPassword;


	public String getSmtpHost() {
		return smtpHost;
	}

	public void setSmtpHost(String smtpHost) {
		this.smtpHost = smtpHost;
	}

	public String getSmtpPort() {
		return smtpPort;
	}

	public void setSmtpPort(String smtpPort) {
		this.smtpPort = smtpPort;
	}

	public String getSendMethod() {
		return sendMethod;
	}

	public void setSendMethod(String sendMethod) {
		this.sendMethod = sendMethod;
	}

	public String getSenderName() {
		return senderName;
	}

	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}

	public String getSenderAccount() {
		return senderAccount;
	}

	public void setSenderAccount(String senderAccount) {
		this.senderAccount = senderAccount;
	}

	public String getSenderPassword() {
		return senderPassword;
	}

	public void setSenderPassword(String senderPassword) {
		this.senderPassword = senderPassword;
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
		sb.append(", smtpHost=").append(smtpHost);
		sb.append(", smtpPort=").append(smtpPort);
		sb.append(", sendMethod=").append(sendMethod);
		sb.append(", senderName=").append(senderName);
		sb.append(", senderAccount=").append(senderAccount);
		sb.append(", senderPassword=").append(senderPassword);
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
			SysEmailConfig other = (SysEmailConfig) that;
			return (this.getSmtpHost() == null ? other.getSmtpHost() == null : this.getSmtpHost().equals(other.getSmtpHost()))
					&& (this.getSmtpPort() == null ? other.getSmtpPort() == null : this.getSmtpPort().equals(other.getSmtpPort()))
					&& (this.getSendMethod() == null ? other.getSendMethod() == null : this.getSendMethod().equals(other.getSendMethod()))
					&& (this.getSenderName() == null ? other.getSenderName() == null : this.getSenderName().equals(other.getSenderName()))
					&& (this.getSenderAccount() == null ? other.getSenderAccount() == null : this.getSenderAccount().equals(other.getSenderAccount()))
					&& (this.getSenderPassword() == null ? other.getSenderPassword() == null : this.getSenderPassword().equals(other.getSenderPassword()));
		}
	}

	/**
	 * 获取当前对象的hashCode编码值
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((getSmtpHost() == null) ? 0 : getSmtpHost().hashCode());
		result = prime * result + ((getSmtpPort() == null) ? 0 : getSmtpPort().hashCode());
		result = prime * result + ((getSendMethod() == null) ? 0 : getSendMethod().hashCode());
		result = prime * result + ((getSenderName() == null) ? 0 : getSenderName().hashCode());
		result = prime * result + ((getSenderAccount() == null) ? 0 : getSenderAccount().hashCode());
		result = prime * result + ((getSenderPassword() == null) ? 0 : getSenderPassword().hashCode());
		return result;
	}
}
