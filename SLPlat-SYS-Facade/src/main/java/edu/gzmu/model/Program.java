package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 编程题
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("编程题")
@SuppressWarnings("serial")
public class Program extends SLPlatBaseModel {
    @ApiModelProperty(value = "参考答案")
	@TableField("answer_")
	private String answer;
    @ApiModelProperty(value = "难度系数")
	@TableField("difficult_degree")
	private Long difficultDegree;
    @ApiModelProperty(value = "是否必选(true:是, false:否)")
	@TableField("is_required")
	private Boolean isRequired;
    @ApiModelProperty(value = "所属章节")
	@TableField("section_id")
	private Long sectionId;
    @TableField(exist = false)
    private String sectionName;
    @TableField(exist = false)
    private String courseName;
    @TableField(exist = false)
    private Long courseId;

	public String getAnswer() { return answer; }

	public void setAnswer(String answer) { this.answer = answer; }

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

    public String getSectionName() {
        return sectionName;
    }

    public void setSectionName(String sectionName) {
        this.sectionName = sectionName;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Long getCourseId() {
        return courseId;
    }

    public void setCourseId(Long courseId) {
        this.courseId = courseId;
    }
    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", answer=").append(answer);
        sb.append(", difficultDegree=").append(difficultDegree);
        sb.append(", isRequired=").append(isRequired);
        sb.append(", sectionId=").append(sectionId);
        sb.append(", sectionName=").append(sectionName);
        sb.append(", CourseName=").append(courseName);
        sb.append(", CourseId=").append(courseId);
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
            Program other = (Program) that;
            return (this.getAnswer() == null ? other.getAnswer() == null : this.getAnswer().equals(other.getAnswer()))
                    && (this.getDifficultDegree() == null ? other.getDifficultDegree() == null : this.getDifficultDegree().equals(other.getDifficultDegree()))
                    && (this.getRequired() == null ? other.getRequired() == null : this.getRequired().equals(other.getRequired()))
                    && (this.getSectionId() == null ? other.getSectionId() == null : this.getSectionId().equals(other.getSectionId()))
                    && (this.getSectionName() == null ? other.getSectionName() == null : this.getSectionName().equals(other.getSectionName()))
                    && (this.getCourseName() == null ? other.getCourseName() == null : this.getCourseName().equals(other.getCourseName()))
                    && (this.getCourseId() == null ? other.getCourseId() == null : this.getCourseId().equals(other.getCourseId()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getAnswer() == null) ? 0 : getAnswer().hashCode());
        result = prime * result + ((getDifficultDegree() == null) ? 0 : getDifficultDegree().hashCode());
        result = prime * result + ((getRequired() == null) ? 0 : getRequired().hashCode());
        result = prime * result + ((getSectionId() == null) ? 0 : getSectionId().hashCode());
        result = prime * result + ((getSectionName() == null) ? 0 : getSectionName().hashCode());
        result = prime * result + ((getCourseName() == null) ? 0 : getCourseName().hashCode());
        result = prime * result + ((getCourseId() == null) ? 0 : getCourseId().hashCode());
        return result;
    }
}