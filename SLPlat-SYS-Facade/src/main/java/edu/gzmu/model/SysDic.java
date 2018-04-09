package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;
import io.swagger.annotations.ApiModel;

/**
 * <p>
 * 数据字典明细表
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("数据字典明细表")
@TableName("sys_dic")
@SuppressWarnings("serial")
public class SysDic extends SLPlatBaseModel {
	@TableField("type_")
	private String type;
	@TableField("code_")
	private String code;
	@TableField("code_text")
	private String codeText;
	@TableField("parent_type")
	private String parentType;
	@TableField("parent_code")
	private String parentCode;
	@TableField("editable_")
	private Boolean editable;

	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}

	/**
	 * @param type
	 *            the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}

	/**
	 * @return the value of sys_dic.code_
	 */
	public String getCode() {
		return code;
	}

	/**
	 * @param code
	 *            the value for sys_dic.code_
	 */
	public void setCode(String code) {
		this.code = code == null ? null : code.trim();
	}

	/**
	 * @return the value of sys_dic.code_text
	 */
	public String getCodeText() {
		return codeText;
	}

	/**
	 * @param codeText
	 *            the value for sys_dic.code_text
	 */
	public void setCodeText(String codeText) {
		this.codeText = codeText == null ? null : codeText.trim();
	}

	/**
	 * @return the value of sys_dic.editable_
	 */
	public Boolean getEditable() {
		return editable;
	}

	/**
	 * @param editable
	 *            the value for sys_dic.editable_
	 */
	public void setEditable(Boolean editable) {
		this.editable = editable;
	}

	public String getParentType() {
        return parentType;
    }

    public void setParentType(String parentType) {
        this.parentType = parentType;
    }

    public String getParentCode() {
        return parentCode;
    }

    public void setParentCode(String parentCode) {
        this.parentCode = parentCode;
    }

	/**
	 * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
	 */
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(super.getSubToString());
		sb.append(", type=").append(type);
		sb.append(", code=").append(code);
		sb.append(", codeText=").append(codeText);
		sb.append(", parentType=").append(parentType);
		sb.append(", parentCode=").append(parentCode);
		sb.append(", editable=").append(editable);
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
			SysDic other = (SysDic) that;
			return (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()))
					&& (this.getCode() == null ? other.getCode() == null : this.getCode().equals(other.getCode()))
					&& (this.getCodeText() == null ? other.getCodeText() == null : this.getCodeText().equals(other.getCodeText()))
					&& (this.getParentType() == null ? other.getParentType() == null : this.getParentType().equals(other.getParentType()))
					&& (this.getParentCode() == null ? other.getParentCode() == null : this.getParentCode().equals(other.getParentCode()))
					&& (this.getEditable() == null ? other.getEditable() == null : this.getEditable().equals(other.getEditable()));
		}
	}

	/**
	 * 获取当前对象的hashCode编码值
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
		result = prime * result + ((getCode() == null) ? 0 : getCode().hashCode());
		result = prime * result + ((getCodeText() == null) ? 0 : getCodeText().hashCode());
		result = prime * result + ((getParentType() == null) ? 0 : getParentType().hashCode());
		result = prime * result + ((getParentCode() == null) ? 0 : getParentCode().hashCode());
		result = prime * result + ((getEditable() == null) ? 0 : getEditable().hashCode());
		return result;
	}
}
