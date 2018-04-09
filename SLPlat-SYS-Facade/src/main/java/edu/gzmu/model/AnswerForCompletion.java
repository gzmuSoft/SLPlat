package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 填空题答案
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("填空题答案")
@TableName("answer_for_completion")
@SuppressWarnings("serial")
public class AnswerForCompletion extends SLPlatBaseModel {
    @ApiModelProperty(value = "填空题编号")
	@TableField("completion_id")
	private Long completionId;
    @ApiModelProperty(value = "答案")
	@TableField("answer_")
	private String answer;
    @ApiModelProperty(value = "同义词(答案的同义词组)")
	private String synonyms;

	public Long getCompletionId() {
		return completionId;
	}

	public void setCompletionId(Long completionId) {
		this.completionId = completionId;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getSynonyms() {
		return synonyms;
	}

	public void setSynonyms(String synonyms) {
		this.synonyms = synonyms;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", completionId=").append(completionId);
        sb.append(", answer=").append(answer);
        sb.append(", synonyms=").append(synonyms);
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
            AnswerForCompletion other = (AnswerForCompletion) that;
            return (this.getCompletionId() == null ? other.getCompletionId() == null : this.getCompletionId().equals(other.getCompletionId()))
                    && (this.getAnswer() == null ? other.getAnswer() == null : this.getAnswer().equals(other.getAnswer()))
                    && (this.getSynonyms() == null ? other.getSynonyms() == null : this.getSynonyms().equals(other.getSynonyms()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getCompletionId() == null) ? 0 : getCompletionId().hashCode());
        result = prime * result + ((getAnswer() == null) ? 0 : getAnswer().hashCode());
        result = prime * result + ((getSynonyms() == null) ? 0 : getSynonyms().hashCode());
        return result;
    }
}