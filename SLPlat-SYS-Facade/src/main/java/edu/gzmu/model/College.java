package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 学院
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("学院")
@SuppressWarnings("serial")
public class College extends SLPlatBaseModel {
    @ApiModelProperty(value = "学校编号")
	@TableField("school_id")
	private Long schoolId;
    @ApiModelProperty(value = "学院概况")
	@TableField("college_profile")
	private String collegeProfile;
    @ApiModelProperty(value = "学院代码")
	@TableField("college_code")
	private String collegeCode;
    @ApiModelProperty(value = "在校生人数")
	@TableField("students_number")
	private Long studentsNumber;

	public Long getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(Long schoolId) {
		this.schoolId = schoolId;
	}

	public String getCollegeProfile() {
		return collegeProfile;
	}

	public void setCollegeProfile(String collegeProfile) {
		this.collegeProfile = collegeProfile;
	}

	public String getCollegeCode() {
		return collegeCode;
	}

	public void setCollegeCode(String collegeCode) {
		this.collegeCode = collegeCode;
	}

	public Long getStudentsNumber() {
		return studentsNumber;
	}

	public void setStudentsNumber(Long studentsNumber) {
		this.studentsNumber = studentsNumber;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", schoolId=").append(schoolId);
        sb.append(", collegeProfile=").append(collegeProfile);
        sb.append(", collegeCode=").append(collegeCode);
        sb.append(", studentsNumber=").append(studentsNumber);
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
            College other = (College) that;
            return (this.getSchoolId() == null ? other.getSchoolId() == null : this.getSchoolId().equals(other.getSchoolId()))
                    && (this.getCollegeProfile() == null ? other.getCollegeProfile() == null : this.getCollegeProfile().equals(other.getCollegeProfile()))
                    && (this.getCollegeCode() == null ? other.getCollegeCode() == null : this.getCollegeCode().equals(other.getCollegeCode()))
                    && (this.getStudentsNumber() == null ? other.getStudentsNumber() == null : this.getStudentsNumber().equals(other.getStudentsNumber()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getSchoolId() == null) ? 0 : getSchoolId().hashCode());
        result = prime * result + ((getCollegeProfile() == null) ? 0 : getCollegeProfile().hashCode());
        result = prime * result + ((getCollegeCode() == null) ? 0 : getCollegeCode().hashCode());
        result = prime * result + ((getStudentsNumber() == null) ? 0 : getStudentsNumber().hashCode());
        return result;
    }
}