package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 知识点
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("知识点")
@TableName("knowledge_point")
@SuppressWarnings("serial")
public class KnowledgePoint extends SLPlatBaseModel {
    @ApiModelProperty(value = "知识概述")
	@TableField("overview_")
	private String overview;
    @ApiModelProperty(value = "知识难度")
	@TableField("difficult_degree")
	private Long difficultDegree;
    @ApiModelProperty(value = "所属父知识点编号")
	@TableField("parent_knowledge_point_id")
	private Long parentKnowledgePointId;

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}

	public Long getDifficultDegree() {
		return difficultDegree;
	}

	public void setDifficultDegree(Long difficultDegree) {
		this.difficultDegree = difficultDegree;
	}

	public Long getParentKnowledgePointId() {
		return parentKnowledgePointId;
	}

	public void setParentKnowledgePointId(Long parentKnowledgePointId) {
		this.parentKnowledgePointId = parentKnowledgePointId;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", overview=").append(overview);
        sb.append(", difficultDegree=").append(difficultDegree);
        sb.append(", parentKnowledgePointId=").append(parentKnowledgePointId);
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
            KnowledgePoint other = (KnowledgePoint) that;
            return (this.getOverview() == null ? other.getOverview() == null : this.getOverview().equals(other.getOverview()))
                    && (this.getDifficultDegree() == null ? other.getDifficultDegree() == null : this.getDifficultDegree().equals(other.getDifficultDegree()))
                    && (this.getParentKnowledgePointId() == null ? other.getParentKnowledgePointId() == null : this.getParentKnowledgePointId().equals(other.getParentKnowledgePointId()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getOverview() == null) ? 0 : getOverview().hashCode());
        result = prime * result + ((getDifficultDegree() == null) ? 0 : getDifficultDegree().hashCode());
        result = prime * result + ((getParentKnowledgePointId() == null) ? 0 : getParentKnowledgePointId().hashCode());
        return result;
    }
}