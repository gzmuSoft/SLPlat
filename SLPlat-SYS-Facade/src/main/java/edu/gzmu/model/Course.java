package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import edu.gzmu.model.base.SLPlatBaseModel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.Date;

/**
 * <p>
 * 课程
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("课程")
@SuppressWarnings("serial")
public class Course extends SLPlatBaseModel {
    @ApiModelProperty(value = "专业编号")
	@TableField("specialty_id")
	private Long specialtyId;
    @ApiModelProperty(value = "课程代码")
	@TableField("code_")
	private String code;
    @ApiModelProperty(value = "学分")
	@TableField("credit_")
	private Long credit;
    @ApiModelProperty(value = "学时")
	@TableField("class_hours")
	private Long classHours;
    @ApiModelProperty(value = "开课时间")
	@TableField("start_time")
	private Date startTime;
    @ApiModelProperty(value = "理论课时")
	@TableField("theory_hours")
	private Long theoryHours;
    @ApiModelProperty(value = "实践课时")
	@TableField("practical_hours")
	private Long practicalHours;
    @ApiModelProperty(value = "课程类型编号")
	@TableField("type_id")
	private Long typeId;
    @ApiModelProperty(value = "课程性质")
	@TableField("course_property")
	private String courseProperty;
    @ApiModelProperty(value = "是否精品课程(true:是, false:否)")
	@TableField("is_boutique_course")
	private Boolean isBoutiqueCourse;
    @ApiModelProperty(value = "课程简介")
	@TableField("introduction_")
	private String introduction;
    @ApiModelProperty(value = "课程目标")
	@TableField("target_")
	private String target;

	public Long getSpecialtyId() {
		return specialtyId;
	}

	public void setSpecialtyId(Long specialtyId) {
		this.specialtyId = specialtyId;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Long getCredit() {
		return credit;
	}

	public void setCredit(Long credit) {
		this.credit = credit;
	}

	public Long getClassHours() {
		return classHours;
	}

	public void setClassHours(Long classHours) {
		this.classHours = classHours;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Long getTheoryHours() {
		return theoryHours;
	}

	public void setTheoryHours(Long theoryHours) {
		this.theoryHours = theoryHours;
	}

	public Long getPracticalHours() {
		return practicalHours;
	}

	public void setPracticalHours(Long practicalHours) {
		this.practicalHours = practicalHours;
	}

	public Long getTypeId() {
		return typeId;
	}

	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}

	public String getCourseProperty() {
		return courseProperty;
	}

	public void setCourseProperty(String courseProperty) {
		this.courseProperty = courseProperty;
	}

	public Boolean getBoutiqueCourse() {
		return isBoutiqueCourse;
	}

	public void setBoutiqueCourse(Boolean isBoutiqueCourse) {
		this.isBoutiqueCourse = isBoutiqueCourse;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", specialtyId=").append(specialtyId);
        sb.append(", code=").append(code);
        sb.append(", credit=").append(credit);
        sb.append(", classHours=").append(classHours);
        sb.append(", startTime=").append(startTime);
        sb.append(", theoryHours=").append(theoryHours);
        sb.append(", practicalHours=").append(practicalHours);
        sb.append(", typeId=").append(typeId);
        sb.append(", courseProperty=").append(courseProperty);
        sb.append(", isBoutiqueCourse=").append(isBoutiqueCourse);
        sb.append(", introduction=").append(introduction);
        sb.append(", target=").append(target);
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
            Course other = (Course) that;
            return (this.getSpecialtyId() == null ? other.getSpecialtyId() == null : this.getSpecialtyId().equals(other.getSpecialtyId()))
					&& (this.getCode() == null ? other.getCode() == null : this.getCode().equals(other.getCode()))
					&& (this.getCredit() == null ? other.getCredit() == null : this.getCredit().equals(other.getCredit()))
					&& (this.getClassHours() == null ? other.getClassHours() == null : this.getClassHours().equals(other.getClassHours()))
					&& (this.getStartTime() == null ? other.getStartTime() == null : this.getStartTime().equals(other.getStartTime()))
					&& (this.getTheoryHours() == null ? other.getTheoryHours() == null : this.getTheoryHours().equals(other.getTheoryHours()))
					&& (this.getPracticalHours() == null ? other.getPracticalHours() == null : this.getPracticalHours().equals(other.getPracticalHours()))
					&& (this.getTypeId() == null ? other.getTypeId() == null : this.getTypeId().equals(other.getTypeId()))
					&& (this.getCourseProperty() == null ? other.getCourseProperty() == null : this.getCourseProperty().equals(other.getCourseProperty()))
					&& (this.getBoutiqueCourse() == null ? other.getBoutiqueCourse() == null : this.getBoutiqueCourse().equals(other.getBoutiqueCourse()))
					&& (this.getIntroduction() == null ? other.getIntroduction() == null : this.getIntroduction().equals(other.getIntroduction()))
					&& (this.getTarget() == null ? other.getTarget() == null : this.getTarget().equals(other.getTarget()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getSpecialtyId() == null) ? 0 : getSpecialtyId().hashCode());
        result = prime * result + ((getCode() == null) ? 0 : getCode().hashCode());
        result = prime * result + ((getCredit() == null) ? 0 : getCredit().hashCode());
        result = prime * result + ((getClassHours() == null) ? 0 : getClassHours().hashCode());
        result = prime * result + ((getStartTime() == null) ? 0 : getStartTime().hashCode());
        result = prime * result + ((getTheoryHours() == null) ? 0 : getTheoryHours().hashCode());
        result = prime * result + ((getPracticalHours() == null) ? 0 : getPracticalHours().hashCode());
        result = prime * result + ((getTypeId() == null) ? 0 : getTypeId().hashCode());
        result = prime * result + ((getCourseProperty() == null) ? 0 : getCourseProperty().hashCode());
        result = prime * result + ((getBoutiqueCourse() == null) ? 0 : getBoutiqueCourse().hashCode());
        result = prime * result + ((getIntroduction() == null) ? 0 : getIntroduction().hashCode());
        result = prime * result + ((getTarget() == null) ? 0 : getTarget().hashCode());
        return result;
    }
}