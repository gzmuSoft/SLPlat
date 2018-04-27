package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 专业
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("专业")
@SuppressWarnings("serial")
public class Specialty extends SLPlatBaseModel {
    @TableField("major_code")
    private String majorCode;
    @ApiModelProperty(value = "学院编号")
    @TableField("college_id")
    private Long collegeId;
    @ApiModelProperty(value = "学制")
    @TableField("school_year")
    private Long schoolYear;
    @ApiModelProperty(value = "类别")
    @TableField("category_")
    private String category;
    @ApiModelProperty(value = "主要负责人编号")
    @TableField("major_leader_id")
    private Long majorLeaderId;
    @ApiModelProperty(value = "简介")
    @TableField("introduction_")
    private String introduction;
    @ApiModelProperty(value = "在校生人数")
    @TableField("students_number")
    private Long studentsNumber;
    @TableField(exist = false)
    private String schoolName;
    @TableField(exist = false)
    private String collegeName;
    @TableField(exist = false)
    private Long schoolId;


    public String getMajorCode() {
        return majorCode;
    }

    public void setMajorCode(String majorCode) {
        this.majorCode = majorCode;
    }

    public Long getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(Long collegeId) {
        this.collegeId = collegeId;
    }

    public Long getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Long schoolId) {
        this.schoolId = schoolId;
    }

    public Long getSchoolYear() {
        return schoolYear;
    }

    public void setSchoolYear(Long schoolYear) {
        this.schoolYear = schoolYear;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Long getMajorLeaderId() {
        return majorLeaderId;
    }

    public void setMajorLeaderId(Long majorLeaderId) {
        this.majorLeaderId = majorLeaderId;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public Long getStudentsNumber() {
        return studentsNumber;
    }

    public void setStudentsNumber(Long studentsNumber) {
        this.studentsNumber = studentsNumber;
    }

    public String getSchoolName() { return schoolName; }

    public void setSchoolName(String schoolName) { this.schoolName = schoolName; }

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }



    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", majorCode=").append(majorCode);
        sb.append(", collegeId=").append(collegeId);
        sb.append(", schoolId=").append(schoolId);
        sb.append(", schoolYear=").append(schoolYear);
        sb.append(", category=").append(category);
        sb.append(", majorLeaderId=").append(majorLeaderId);
        sb.append(", introduction=").append(introduction);
        sb.append(", studentsNumber=").append(studentsNumber);
        sb.append(", schoolName=").append(schoolName);
        sb.append(", collegeName=").append(collegeName);
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
        } else {
            Specialty other = (Specialty) that;
            return (this.getMajorCode() == null ? other.getMajorCode() == null : this.getMajorCode().equals(other.getMajorCode()))
                    && (this.getCollegeId() == null ? other.getCollegeId() == null : this.getCollegeId().equals(other.getCollegeId()))
                    && (this.getSchoolId() == null ? other.getSchoolId() == null : this.getSchoolId().equals(other.getSchoolId()))
                    && (this.getSchoolYear() == null ? other.getSchoolYear() == null : this.getSchoolYear().equals(other.getSchoolYear()))
                    && (this.getCategory() == null ? other.getCategory() == null : this.getCategory().equals(other.getCategory()))
                    && (this.getMajorLeaderId() == null ? other.getMajorLeaderId() == null : this.getMajorLeaderId().equals(other.getMajorLeaderId()))
                    && (this.getIntroduction() == null ? other.getIntroduction() == null : this.getIntroduction().equals(other.getIntroduction()))
                    && (this.getStudentsNumber() == null ? other.getStudentsNumber() == null : this.getStudentsNumber().equals(other.getStudentsNumber())
                    && (this.getSchoolName() == null ? other.getSchoolName() == null : this.getSchoolName().equals(other.getSchoolName()))
                    && (this.getCollegeName() == null ? other.getCollegeName() == null : this.getCollegeName().equals(other.getCollegeName())));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getMajorCode() == null) ? 0 : getMajorCode().hashCode());
        result = prime * result + ((getCollegeId() == null) ? 0 : getCollegeId().hashCode());
        result = prime * result + ((getSchoolId() == null) ? 0 : getSchoolId().hashCode());
        result = prime * result + ((getSchoolYear() == null) ? 0 : getSchoolYear().hashCode());
        result = prime * result + ((getCategory() == null) ? 0 : getCategory().hashCode());
        result = prime * result + ((getMajorLeaderId() == null) ? 0 : getMajorLeaderId().hashCode());
        result = prime * result + ((getIntroduction() == null) ? 0 : getIntroduction().hashCode());
        result = prime * result + ((getStudentsNumber() == null) ? 0 : getStudentsNumber().hashCode());
        result = prime * result + ((getSchoolName() == null) ? 0 : getSchoolName().hashCode());
        result = prime * result + ((getCollegeName() == null) ? 0 : getCollegeName().hashCode());
        return result;
    }
}