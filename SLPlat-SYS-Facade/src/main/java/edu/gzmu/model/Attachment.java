package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 附件文档
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("附件文档")
@SuppressWarnings("serial")
public class Attachment extends SLPlatBaseModel {
    @ApiModelProperty(value = "类型")
	@TableField("type_id")
	private Long typeId;
    @ApiModelProperty(value = "路径")
	@TableField("path_")
	private String path;

	public Long getTypeId() {
		return typeId;
	}

	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", typeId=").append(typeId);
        sb.append(", path=").append(path);
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
            Attachment other = (Attachment) that;
            return (this.getTypeId() == null ? other.getTypeId() == null : this.getTypeId().equals(other.getTypeId()))
                    && (this.getPath() == null ? other.getPath() == null : this.getPath().equals(other.getPath()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getTypeId() == null) ? 0 : getTypeId().hashCode());
        result = prime * result + ((getPath() == null) ? 0 : getPath().hashCode());
        return result;
    }
}