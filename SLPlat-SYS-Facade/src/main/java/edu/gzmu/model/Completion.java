package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 填空题
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("填空题")
@SuppressWarnings("serial")
public class Completion extends SLPlatBaseModel {
    @ApiModelProperty(value = "难度系数")
	@TableField("difficult_degree")
	private Long difficultDegree;
    @ApiModelProperty(value = "是否必选(true:是, false:否)")
	@TableField("is_required")
	private Boolean isRequired;
    @ApiModelProperty(value = "所属章节")
	@TableField("section_id")
	private Long sectionId;

	public Long getDifficultDegree() {
		return difficultDegree;
	}

	public void setDifficultDegree(Long difficultDegree) {
		this.difficultDegree = difficultDegree;
	}

	public Boolean getRequired() {
		return isRequired;
	}

	public void setRequired(Boolean isRequired) {
		this.isRequired = isRequired;
	}

	public Long getSectionId() {
		return sectionId;
	}

	public void setSectionId(Long sectionId) {
		this.sectionId = sectionId;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", difficultDegree=").append(difficultDegree);
        sb.append(", isRequired=").append(isRequired);
        sb.append(", sectionId=").append(sectionId);
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
            Completion other = (Completion) that;
            return (this.getDifficultDegree() == null ? other.getDifficultDegree() == null : this.getDifficultDegree().equals(other.getDifficultDegree()))
                    && (this.getRequired() == null ? other.getRequired() == null : this.getRequired().equals(other.getRequired()))
                    && (this.getSectionId() == null ? other.getSectionId() == null : this.getSectionId().equals(other.getSectionId()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getDifficultDegree() == null) ? 0 : getDifficultDegree().hashCode());
        result = prime * result + ((getRequired() == null) ? 0 : getRequired().hashCode());
        result = prime * result + ((getSectionId() == null) ? 0 : getSectionId().hashCode());
        return result;
    }
}