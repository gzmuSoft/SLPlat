package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 题目与知识点关联
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("题目与知识点关联")
@TableName("question_knowledge_point")
@SuppressWarnings("serial")
public class QuestionKnowledgePoint extends SLPlatBaseModel {
    @ApiModelProperty(value = "0：单项选择题，1：多项选择题，2：填空题，3：填空题，4：简答题，5：编程题")
	@TableField("question_type")
	private Long questionType;
    @ApiModelProperty(value = "题目编号")
	@TableField("question_id")
	private Long questionId;
    @ApiModelProperty(value = "知识点编号")
	@TableField("knowledge_point_id")
	private Long knowledgePointId;

	public Long getQuestionType() {
		return questionType;
	}

	public void setQuestionType(Long questionType) {
		this.questionType = questionType;
	}

	public Long getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}

	public Long getKnowledgePointId() {
		return knowledgePointId;
	}

	public void setKnowledgePointId(Long knowledgePointId) {
		this.knowledgePointId = knowledgePointId;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", questionType=").append(questionType);
        sb.append(", questionId=").append(questionId);
        sb.append(", knowledgePointId=").append(knowledgePointId);
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
            QuestionKnowledgePoint other = (QuestionKnowledgePoint) that;
            return (this.getQuestionType() == null ? other.getQuestionType() == null : this.getQuestionType().equals(other.getQuestionType()))
                    && (this.getQuestionId() == null ? other.getQuestionId() == null : this.getQuestionId().equals(other.getQuestionId()))
                    && (this.getKnowledgePointId() == null ? other.getKnowledgePointId() == null : this.getKnowledgePointId().equals(other.getKnowledgePointId()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getQuestionType() == null) ? 0 : getQuestionType().hashCode());
        result = prime * result + ((getQuestionId() == null) ? 0 : getQuestionId().hashCode());
        result = prime * result + ((getKnowledgePointId() == null) ? 0 : getKnowledgePointId().hashCode());
        return result;
    }
}