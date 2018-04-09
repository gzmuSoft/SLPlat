package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 角色
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("角色")
@SuppressWarnings("serial")
public class Role extends SLPlatBaseModel {
    @ApiModelProperty(value = "角色描述")
	@TableField("description_")
	private String description;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", description=").append(description);
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
            Role other = (Role) that;
            return (this.getDescription() == null ? other.getDescription() == null : this.getDescription().equals(other.getDescription()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getDescription() == null) ? 0 : getDescription().hashCode());
        return result;
    }
}