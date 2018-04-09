package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 选择题选项
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("选择题选项")
@TableName("select_options")
@SuppressWarnings("serial")
public class SelectOptions extends SLPlatBaseModel {
    @ApiModelProperty(value = "题目类型(true:单选, false:多选)")
	@TableField("question_type")
	private Boolean questionType;
    @ApiModelProperty(value = "题目编号")
	@TableField("question_id")
	private Long questionId;
    @ApiModelProperty(value = "是否为答案(true:是, false:否)")
	@TableField("is_answer")
	private Boolean isAnswer;

	public Boolean getQuestionType() {
		return questionType;
	}

	public void setQuestionType(Boolean questionType) {
		this.questionType = questionType;
	}

	public Long getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}

	public Boolean getAnswer() {
		return isAnswer;
	}

	public void setAnswer(Boolean isAnswer) {
		this.isAnswer = isAnswer;
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
        sb.append(", isAnswer=").append(isAnswer);
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
            SelectOptions other = (SelectOptions) that;
            return (this.getQuestionType() == null ? other.getQuestionType() == null : this.getQuestionType().equals(other.getQuestionType()))
                    && (this.getQuestionId() == null ? other.getQuestionId() == null : this.getQuestionId().equals(other.getQuestionId()))
                    && (this.getAnswer() == null ? other.getAnswer() == null : this.getAnswer().equals(other.getAnswer()));
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
        result = prime * result + ((getAnswer() == null) ? 0 : getAnswer().hashCode());
        return result;
    }
}