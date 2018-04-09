package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 课程讲授
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("课程讲授")
@TableName("course_teaching")
@SuppressWarnings("serial")
public class CourseTeaching extends SLPlatBaseModel {
    @ApiModelProperty(value = "课程编号")
	@TableField("course_id")
	private Long courseId;
    @ApiModelProperty(value = "授课老师编号")
	@TableField("tutor_id")
	private Long tutorId;
    @ApiModelProperty(value = "辅导老师编号")
	@TableField("counselor_id")
	private Long counselorId;
    @ApiModelProperty(value = "授课班级编号")
	@TableField("lecturer_id")
	private Long lecturerId;
    @ApiModelProperty(value = "开课学期编号")
	@TableField("semester_id")
	private Long semesterId;
    @ApiModelProperty(value = "所用教材编号")
	@TableField("course_material_id")
	private Long courseMaterialId;

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public Long getTutorId() {
		return tutorId;
	}

	public void setTutorId(Long tutorId) {
		this.tutorId = tutorId;
	}

	public Long getCounselorId() {
		return counselorId;
	}

	public void setCounselorId(Long counselorId) {
		this.counselorId = counselorId;
	}

	public Long getLecturerId() {
		return lecturerId;
	}

	public void setLecturerId(Long lecturerId) {
		this.lecturerId = lecturerId;
	}

	public Long getSemesterId() {
		return semesterId;
	}

	public void setSemesterId(Long semesterId) {
		this.semesterId = semesterId;
	}

	public Long getCourseMaterialId() {
		return courseMaterialId;
	}

	public void setCourseMaterialId(Long courseMaterialId) {
		this.courseMaterialId = courseMaterialId;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", courseId=").append(courseId);
        sb.append(", tutorId=").append(tutorId);
        sb.append(", counselorId=").append(counselorId);
        sb.append(", lecturerId=").append(lecturerId);
        sb.append(", semesterId=").append(semesterId);
        sb.append(", courseMaterialId=").append(courseMaterialId);
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
            CourseTeaching other = (CourseTeaching) that;
            return (this.getCourseId() == null ? other.getCourseId() == null : this.getCourseId().equals(other.getCourseId()))
					&& (this.getTutorId() == null ? other.getTutorId() == null : this.getTutorId().equals(other.getTutorId()))
					&& (this.getCounselorId() == null ? other.getCounselorId() == null : this.getCounselorId().equals(other.getCounselorId()))
					&& (this.getLecturerId() == null ? other.getLecturerId() == null : this.getLecturerId().equals(other.getLecturerId()))
					&& (this.getSemesterId() == null ? other.getSemesterId() == null : this.getSemesterId().equals(other.getSemesterId()))
					&& (this.getCourseMaterialId() == null ? other.getCourseMaterialId() == null : this.getCourseMaterialId().equals(other.getCourseMaterialId()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getCourseId() == null) ? 0 : getCourseId().hashCode());
        result = prime * result + ((getTutorId() == null) ? 0 : getTutorId().hashCode());
        result = prime * result + ((getCounselorId() == null) ? 0 : getCounselorId().hashCode());
        result = prime * result + ((getLecturerId() == null) ? 0 : getLecturerId().hashCode());
        result = prime * result + ((getSemesterId() == null) ? 0 : getSemesterId().hashCode());
        result = prime * result + ((getCourseMaterialId() == null) ? 0 : getCourseMaterialId().hashCode());
        return result;
    }
}