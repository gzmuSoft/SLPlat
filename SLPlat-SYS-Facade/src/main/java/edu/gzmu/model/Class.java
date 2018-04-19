package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import edu.gzmu.model.base.SLPlatBaseModel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.Date;

/**
 * <p>
 * 班级
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("班级")
@SuppressWarnings("serial")
public class Class extends SLPlatBaseModel {
    @ApiModelProperty(value = "专业编号")
    @TableField("specialty_id")
    private Long specialtyId;
    @ApiModelProperty(value = "班主任编号")
    @TableField("adviser_id")
    private Long adviserId;
    @ApiModelProperty(value = "班长编号")
    @TableField("monitor_id")
    private Long monitorId;
    @ApiModelProperty(value = "学习委员编号")
    @TableField("secretary_id")
    private Long secretaryId;
    @ApiModelProperty(value = "入学日期")
    @TableField("entrance_date")
    private Date entranceDate;
    @ApiModelProperty(value = "学生人数")
    @TableField("students_number")
    private Long studentsNumber;
    @TableField(exist = false)
    private String schoolName;
    @TableField(exist = false)
    private String collegeName;
    @TableField(exist = false)
    private String specialtyName;
    @TableField(exist = false)
    private Long collegeId;
    @TableField(exist = false)
    private Long schoolId;

    public Long getSpecialtyId() {
        return specialtyId;
    }

    public void setSpecialtyId(Long specialtyId) {
        this.specialtyId = specialtyId;
    }

    public Long getAdviserId() {
        return adviserId;
    }

    public void setAdviserId(Long adviserId) {
        this.adviserId = adviserId;
    }

    public Long getMonitorId() {
        return monitorId;
    }

    public void setMonitorId(Long monitorId) {
        this.monitorId = monitorId;
    }

    public Long getSecretaryId() {
        return secretaryId;
    }

    public void setSecretaryId(Long secretaryId) {
        this.secretaryId = secretaryId;
    }

    public Date getEntranceDate() {
        return entranceDate;
    }

    public void setEntranceDate(Date entranceDate) {
        this.entranceDate = entranceDate;
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

    public String getSpecialtyName() {
        return specialtyName;
    }

    public void setSpecialtyName(String specialtyName) {
        this.specialtyName = specialtyName;
    }

    public Long getSchoolId() {
        return schoolId;
    }

    public void setSchoolId(Long schoolId) {
        this.schoolId = schoolId;
    }

    public Long getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(Long collegeId) {
        this.collegeId = collegeId;
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
        sb.append(", adviserId=").append(adviserId);
        sb.append(", monitorId=").append(monitorId);
        sb.append(", secretaryId=").append(secretaryId);
        sb.append(", entranceDate=").append(entranceDate);
        sb.append(", studentsNumber=").append(studentsNumber);
        sb.append(", schoolName=").append(schoolName);
        sb.append(", collegeName=").append(collegeName);
        sb.append(", specialtyName=").append(specialtyName);
        sb.append(", schoolId=").append(schoolId);
        sb.append(", collegeId=").append(collegeId);
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
            Class other = (Class) that;
            return (this.getSpecialtyId() == null ? other.getSpecialtyId() == null : this.getSpecialtyId().equals(other.getSpecialtyId()))
                    && (this.getAdviserId() == null ? other.getAdviserId() == null : this.getAdviserId().equals(other.getAdviserId()))
                    && (this.getMonitorId() == null ? other.getMonitorId() == null : this.getMonitorId().equals(other.getMonitorId()))
                    && (this.getSecretaryId() == null ? other.getSecretaryId() == null : this.getSecretaryId().equals(other.getSecretaryId()))
                    && (this.getEntranceDate() == null ? other.getEntranceDate() == null : this.getEntranceDate().equals(other.getEntranceDate()))
                    && (this.getStudentsNumber() == null ? other.getStudentsNumber() == null : this.getStudentsNumber().equals(other.getStudentsNumber()))
                    && (this.getSchoolName() == null ? other.getSchoolName() == null : this.getSchoolName().equals(other.getSchoolName()))
                    && (this.getCollegeName() == null ? other.getCollegeName() == null : this.getCollegeName().equals(other.getCollegeName()))
                    && (this.getSpecialtyName() == null ? other.getSpecialtyName() == null : this.getSpecialtyName().equals(other.getSpecialtyName()))
                    && (this.getCollegeId() == null ? other.getCollegeId() == null : this.getCollegeId().equals(other.getCollegeId()))
                    && (this.getSchoolId() == null ? other.getSchoolId() == null : this.getSchoolId().equals(other.getSchoolId()));
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
        result = prime * result + ((getAdviserId() == null) ? 0 : getAdviserId().hashCode());
        result = prime * result + ((getMonitorId() == null) ? 0 : getMonitorId().hashCode());
        result = prime * result + ((getSecretaryId() == null) ? 0 : getSecretaryId().hashCode());
        result = prime * result + ((getEntranceDate() == null) ? 0 : getEntranceDate().hashCode());
        result = prime * result + ((getStudentsNumber() == null) ? 0 : getStudentsNumber().hashCode());
        result = prime * result + ((getSchoolName() == null) ? 0 : getSchoolName().hashCode());
        result = prime * result + ((getCollegeName() == null) ? 0 : getCollegeName().hashCode());
        result = prime * result + ((getSpecialtyName() == null) ? 0 : getSpecialtyName().hashCode());
        result = prime * result + ((getCollegeId() == null) ? 0 : getCollegeId().hashCode());
        result = prime * result + ((getSchoolId() == null) ? 0 : getSchoolId().hashCode());
        return result;
    }
}