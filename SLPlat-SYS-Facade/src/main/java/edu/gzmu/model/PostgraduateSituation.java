package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.Date;

/**
 * <p>
 * 考研情况
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("考研情况")
@TableName("postgraduate_situation")
@SuppressWarnings("serial")
public class PostgraduateSituation extends SLPlatBaseModel {
    @ApiModelProperty(value = "学生编号")
	@TableField("student_id")
	private Long studentId;
    @ApiModelProperty(value = "时间")
	@TableField("time_")
	private Date time;
    @ApiModelProperty(value = "学校")
	@TableField("school_")
	private String school;
    @ApiModelProperty(value = "专业")
	@TableField("specialty_")
	private String specialty;
    @ApiModelProperty(value = "true：第一志愿，false：调剂")
	@TableField("is_adjust")
	private Boolean isAdjust;
    @ApiModelProperty(value = "true：录取，false：未录取")
	@TableField("status_")
	private Boolean status;

	public Long getStudentId() {
		return studentId;
	}

	public void setStudentId(Long studentId) {
		this.studentId = studentId;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getSpecialty() {
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	public Boolean getAdjust() {
		return isAdjust;
	}

	public void setAdjust(Boolean isAdjust) {
		this.isAdjust = isAdjust;
	}

	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", studentId=").append(studentId);
        sb.append(", time=").append(time);
        sb.append(", school=").append(school);
        sb.append(", specialty=").append(specialty);
        sb.append(", isAdjust=").append(isAdjust);
        sb.append(", status=").append(status);
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
            PostgraduateSituation other = (PostgraduateSituation) that;
            return (this.getStudentId() == null ? other.getStudentId() == null : this.getStudentId().equals(other.getStudentId()))
					&& (this.getTime() == null ? other.getTime() == null : this.getTime().equals(other.getTime()))
					&& (this.getSchool() == null ? other.getSchool() == null : this.getSchool().equals(other.getSchool()))
					&& (this.getSpecialty() == null ? other.getSpecialty() == null : this.getSpecialty().equals(other.getSpecialty()))
					&& (this.getAdjust() == null ? other.getAdjust() == null : this.getAdjust().equals(other.getAdjust()))
					&& (this.getStatus() == null ? other.getStatus() == null : this.getStatus().equals(other.getStatus()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getStudentId() == null) ? 0 : getStudentId().hashCode());
        result = prime * result + ((getTime() == null) ? 0 : getTime().hashCode());
        result = prime * result + ((getSchool() == null) ? 0 : getSchool().hashCode());
        result = prime * result + ((getSpecialty() == null) ? 0 : getSpecialty().hashCode());
        result = prime * result + ((getAdjust() == null) ? 0 : getAdjust().hashCode());
        result = prime * result + ((getStatus() == null) ? 0 : getStatus().hashCode());
        return result;
    }
}