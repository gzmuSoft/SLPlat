package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 培养方案
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("培养方案")
@TableName("education_program")
@SuppressWarnings("serial")
public class EducationProgram extends SLPlatBaseModel {
    @ApiModelProperty(value = "年份")
	@TableField("year_")
	private Long year;
    @ApiModelProperty(value = "专业编号")
	@TableField("specialty_id")
	private Long specialtyId;
    @ApiModelProperty(value = "理论教学学分")
	@TableField("theoretical_teaching_credit")
	private Long theoreticalTeachingCredit;
    @ApiModelProperty(value = "实践教学学分")
	@TableField("practice_teaching_credit")
	private Long practiceTeachingCredit;
    @ApiModelProperty(value = "简介")
	@TableField("brief_introduction")
	private String briefIntroduction;
    @ApiModelProperty(value = "附件文档")
	@TableField("attachment_id")
	private Long attachmentId;

	public Long getYear() {
		return year;
	}

	public void setYear(Long year) {
		this.year = year;
	}

	public Long getSpecialtyId() {
		return specialtyId;
	}

	public void setSpecialtyId(Long specialtyId) {
		this.specialtyId = specialtyId;
	}

	public Long getTheoreticalTeachingCredit() {
		return theoreticalTeachingCredit;
	}

	public void setTheoreticalTeachingCredit(Long theoreticalTeachingCredit) {
		this.theoreticalTeachingCredit = theoreticalTeachingCredit;
	}

	public Long getPracticeTeachingCredit() {
		return practiceTeachingCredit;
	}

	public void setPracticeTeachingCredit(Long practiceTeachingCredit) {
		this.practiceTeachingCredit = practiceTeachingCredit;
	}

	public String getBriefIntroduction() {
		return briefIntroduction;
	}

	public void setBriefIntroduction(String briefIntroduction) {
		this.briefIntroduction = briefIntroduction;
	}

	public Long getAttachmentId() {
		return attachmentId;
	}

	public void setAttachmentId(Long attachmentId) {
		this.attachmentId = attachmentId;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", year=").append(year);
        sb.append(", specialtyId=").append(specialtyId);
        sb.append(", theoreticalTeachingCredit=").append(theoreticalTeachingCredit);
        sb.append(", practiceTeachingCredit=").append(practiceTeachingCredit);
        sb.append(", briefIntroduction=").append(briefIntroduction);
        sb.append(", attachmentId=").append(attachmentId);
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
            EducationProgram other = (EducationProgram) that;
            return (this.getYear() == null ? other.getYear() == null : this.getYear().equals(other.getYear()))
					&& (this.getSpecialtyId() == null ? other.getSpecialtyId() == null : this.getSpecialtyId().equals(other.getSpecialtyId()))
					&& (this.getTheoreticalTeachingCredit() == null ? other.getTheoreticalTeachingCredit() == null : this.getTheoreticalTeachingCredit().equals(other.getTheoreticalTeachingCredit()))
					&& (this.getPracticeTeachingCredit() == null ? other.getPracticeTeachingCredit() == null : this.getPracticeTeachingCredit().equals(other.getPracticeTeachingCredit()))
					&& (this.getBriefIntroduction() == null ? other.getBriefIntroduction() == null : this.getBriefIntroduction().equals(other.getBriefIntroduction()))
					&& (this.getAttachmentId() == null ? other.getAttachmentId() == null : this.getAttachmentId().equals(other.getAttachmentId()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getYear() == null) ? 0 : getYear().hashCode());
        result = prime * result + ((getSpecialtyId() == null) ? 0 : getSpecialtyId().hashCode());
        result = prime * result + ((getTheoreticalTeachingCredit() == null) ? 0 : getTheoreticalTeachingCredit().hashCode());
        result = prime * result + ((getPracticeTeachingCredit() == null) ? 0 : getPracticeTeachingCredit().hashCode());
        result = prime * result + ((getBriefIntroduction() == null) ? 0 : getBriefIntroduction().hashCode());
        result = prime * result + ((getAttachmentId() == null) ? 0 : getAttachmentId().hashCode());
        return result;
    }
}