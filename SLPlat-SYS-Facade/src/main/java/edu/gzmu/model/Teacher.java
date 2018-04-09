package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import edu.gzmu.model.base.SLPlatBaseModel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.Date;

/**
 * <p>
 * 教师
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("教师")
@SuppressWarnings("serial")
public class Teacher extends SLPlatBaseModel {
    @ApiModelProperty(value = "工号")
	@TableField("job_no")
	private String jobNo;
    @ApiModelProperty(value = "教师类别（幼儿园教师、小学教师、初级中学教师、高级中学教师、中等职业学校教师、中等职业学校实习指导教师、高等学校教师）")
	@TableField("type_")
	private String type;
    @ApiModelProperty(value = "学院编号")
	@TableField("college_id")
	private Long collegeId;
    @ApiModelProperty(value = "入职时间")
	@TableField("entry_data")
	private Date entryData;
    @ApiModelProperty(value = "研究方向")
	@TableField("research_area")
	private String researchArea;
    @ApiModelProperty(value = "性别编号")
	@TableField("gender_id")
	private Long genderId;
    @ApiModelProperty(value = "民族编号")
	@TableField("nation_id")
	private Long nationId;
    @ApiModelProperty(value = "政治面貌编号")
	@TableField("political_status_id")
	private Long politicalStatusId;
    @ApiModelProperty(value = "证件类型")
	@TableField("certificate_type")
	private String certificateType;
    @ApiModelProperty(value = "证件号码")
	@TableField("certificate_no")
	private String certificateNo;
    @ApiModelProperty(value = "出生年月")
	@TableField("birthday_")
	private Date birthday;
    @ApiModelProperty(value = "行政职务编号")
	@TableField("administrative_post_id")
	private Long administrativePostId;
    @ApiModelProperty(value = "专业职称编号")
	@TableField("professional_title_id")
	private Long professionalTitleId;
    @ApiModelProperty(value = "是否外聘")
	@TableField("is_external")
	private Boolean isExternal;
    @ApiModelProperty(value = "最终学位")
	@TableField("terminal_degree")
	private String terminalDegree;
    @ApiModelProperty(value = "本科专业")
	@TableField("undergraduate_major")
	private String undergraduateMajor;
    @ApiModelProperty(value = "最终学位获取时间")
	@TableField("gain_time_of_terminal_degree")
	private Date gainTimeOfTerminalDegree;
    @ApiModelProperty(value = "本科专业学位获取时间")
	@TableField("gain_time_of_Undergraduate")
	private Date gainTimeOfUndergraduate;
    @ApiModelProperty(value = "本科学位：哲学、经济学、法学、教育学、文学、历史学、理学、工学、农学、医学、管理学、艺术学、军事学")
	@TableField("bachelor_degree")
	private String bachelorDegree;
    @ApiModelProperty(value = "是否硕士导师(true:是, false:否)")
	@TableField("is_master_tutor")
	private Boolean isMasterTutor;
    @ApiModelProperty(value = "是否海外留学(true:是, false:否)")
	@TableField("is_study_abroad")
	private Boolean isStudyAbroad;
    @ApiModelProperty(value = "是否院士(true:是, false:否)")
	@TableField("is_academician")
	private Boolean isAcademician;
    @ApiModelProperty(value = "是否长江学者(true:是, false:否)")
	@TableField("is_changjiang_scholar")
	private Boolean isChangjiangScholar;
    @ApiModelProperty(value = "是否杰青(true:是, false:否)")
	@TableField("is_tOYP")
	private Boolean isToyp;
    @ApiModelProperty(value = "是否省管专家(true:是, false:否)")
	@TableField("is_province_tube_expert")
	private Boolean isProvinceTubeExpert;
    @ApiModelProperty(value = "是否有行业经历(true:是, false:否)")
	@TableField("is_industry_experience")
	private Boolean isIndustryExperience;
    @ApiModelProperty(value = "是否有实践教学能力培训(true:是, false:否)")
	@TableField("is_practice_train")
	private Boolean isPracticeTrain;
    @ApiModelProperty(value = "其他荣誉称号")
	@TableField("other_honorary_title")
	private String otherHonoraryTitle;
    @ApiModelProperty(value = "电话")
	@TableField("phone_")
	private String phone;
    @ApiModelProperty(value = "电子邮箱")
	@TableField("email_")
	private String email;
    @ApiModelProperty(value = "个人简介")
	@TableField("individual_resume")
	private String individualResume;
    @ApiModelProperty(value = "头像")
	@TableField("head_img_id")
	private Long headImgId;

	public String getJobNo() {
		return jobNo;
	}

	public void setJobNo(String jobNo) {
		this.jobNo = jobNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Long getCollegeId() {
		return collegeId;
	}

	public void setCollegeId(Long collegeId) {
		this.collegeId = collegeId;
	}

	public Date getEntryData() {
		return entryData;
	}

	public void setEntryData(Date entryData) {
		this.entryData = entryData;
	}

	public String getResearchArea() {
		return researchArea;
	}

	public void setResearchArea(String researchArea) {
		this.researchArea = researchArea;
	}

	public Long getGenderId() {
		return genderId;
	}

	public void setGenderId(Long genderId) {
		this.genderId = genderId;
	}

	public Long getNationId() {
		return nationId;
	}

	public void setNationId(Long nationId) {
		this.nationId = nationId;
	}

	public Long getPoliticalStatusId() {
		return politicalStatusId;
	}

	public void setPoliticalStatusId(Long politicalStatusId) {
		this.politicalStatusId = politicalStatusId;
	}

	public String getCertificateType() {
		return certificateType;
	}

	public void setCertificateType(String certificateType) {
		this.certificateType = certificateType;
	}

	public String getCertificateNo() {
		return certificateNo;
	}

	public void setCertificateNo(String certificateNo) {
		this.certificateNo = certificateNo;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Long getAdministrativePostId() {
		return administrativePostId;
	}

	public void setAdministrativePostId(Long administrativePostId) {
		this.administrativePostId = administrativePostId;
	}

	public Long getProfessionalTitleId() {
		return professionalTitleId;
	}

	public void setProfessionalTitleId(Long professionalTitleId) {
		this.professionalTitleId = professionalTitleId;
	}

	public Boolean getExternal() {
		return isExternal;
	}

	public void setExternal(Boolean isExternal) {
		this.isExternal = isExternal;
	}

	public String getTerminalDegree() {
		return terminalDegree;
	}

	public void setTerminalDegree(String terminalDegree) {
		this.terminalDegree = terminalDegree;
	}

	public String getUndergraduateMajor() {
		return undergraduateMajor;
	}

	public void setUndergraduateMajor(String undergraduateMajor) {
		this.undergraduateMajor = undergraduateMajor;
	}

	public Date getGainTimeOfTerminalDegree() {
		return gainTimeOfTerminalDegree;
	}

	public void setGainTimeOfTerminalDegree(Date gainTimeOfTerminalDegree) {
		this.gainTimeOfTerminalDegree = gainTimeOfTerminalDegree;
	}

	public Date getGainTimeOfUndergraduate() {
		return gainTimeOfUndergraduate;
	}

	public void setGainTimeOfUndergraduate(Date gainTimeOfUndergraduate) {
		this.gainTimeOfUndergraduate = gainTimeOfUndergraduate;
	}

	public String getBachelorDegree() {
		return bachelorDegree;
	}

	public void setBachelorDegree(String bachelorDegree) {
		this.bachelorDegree = bachelorDegree;
	}

	public Boolean getMasterTutor() {
		return isMasterTutor;
	}

	public void setMasterTutor(Boolean isMasterTutor) {
		this.isMasterTutor = isMasterTutor;
	}

	public Boolean getStudyAbroad() {
		return isStudyAbroad;
	}

	public void setStudyAbroad(Boolean isStudyAbroad) {
		this.isStudyAbroad = isStudyAbroad;
	}

	public Boolean getAcademician() {
		return isAcademician;
	}

	public void setAcademician(Boolean isAcademician) {
		this.isAcademician = isAcademician;
	}

	public Boolean getChangjiangScholar() {
		return isChangjiangScholar;
	}

	public void setChangjiangScholar(Boolean isChangjiangScholar) {
		this.isChangjiangScholar = isChangjiangScholar;
	}

	public Boolean getToyp() {
		return isToyp;
	}

	public void setToyp(Boolean isToyp) {
		this.isToyp = isToyp;
	}

	public Boolean getProvinceTubeExpert() {
		return isProvinceTubeExpert;
	}

	public void setProvinceTubeExpert(Boolean isProvinceTubeExpert) {
		this.isProvinceTubeExpert = isProvinceTubeExpert;
	}

	public Boolean getIndustryExperience() {
		return isIndustryExperience;
	}

	public void setIndustryExperience(Boolean isIndustryExperience) {
		this.isIndustryExperience = isIndustryExperience;
	}

	public Boolean getPracticeTrain() {
		return isPracticeTrain;
	}

	public void setPracticeTrain(Boolean isPracticeTrain) {
		this.isPracticeTrain = isPracticeTrain;
	}

	public String getOtherHonoraryTitle() {
		return otherHonoraryTitle;
	}

	public void setOtherHonoraryTitle(String otherHonoraryTitle) {
		this.otherHonoraryTitle = otherHonoraryTitle;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getIndividualResume() {
		return individualResume;
	}

	public void setIndividualResume(String individualResume) {
		this.individualResume = individualResume;
	}

	public Long getHeadImgId() {
		return headImgId;
	}

	public void setHeadImgId(Long headImgId) {
		this.headImgId = headImgId;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", jobNo=").append(jobNo);
        sb.append(", type=").append(type);
        sb.append(", collegeId=").append(collegeId);
        sb.append(", entryData=").append(entryData);
        sb.append(", researchArea=").append(researchArea);
        sb.append(", genderId=").append(genderId);
        sb.append(", nationId=").append(nationId);
        sb.append(", politicalStatusId=").append(politicalStatusId);
        sb.append(", certificateType=").append(certificateType);
        sb.append(", certificateNo=").append(certificateNo);
        sb.append(", birthday=").append(birthday);
        sb.append(", administrativePostId=").append(administrativePostId);
        sb.append(", professionalTitleId=").append(professionalTitleId);
        sb.append(", isExternal=").append(isExternal);
        sb.append(", terminalDegree=").append(terminalDegree);
        sb.append(", undergraduateMajor=").append(undergraduateMajor);
        sb.append(", gainTimeOfTerminalDegree=").append(gainTimeOfTerminalDegree);
        sb.append(", gainTimeOfUndergraduate=").append(gainTimeOfUndergraduate);
        sb.append(", bachelorDegree=").append(bachelorDegree);
        sb.append(", isMasterTutor=").append(isMasterTutor);
        sb.append(", isStudyAbroad=").append(isStudyAbroad);
        sb.append(", isAcademician=").append(isAcademician);
        sb.append(", isChangjiangScholar=").append(isChangjiangScholar);
        sb.append(", isToyp=").append(isToyp);
        sb.append(", isProvinceTubeExpert=").append(isProvinceTubeExpert);
        sb.append(", isIndustryExperience=").append(isIndustryExperience);
        sb.append(", isPracticeTrain=").append(isPracticeTrain);
        sb.append(", otherHonoraryTitle=").append(otherHonoraryTitle);
        sb.append(", phone=").append(phone);
        sb.append(", email=").append(email);
        sb.append(", individualResume=").append(individualResume);
        sb.append(", headImgId=").append(headImgId);
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
            Teacher other = (Teacher) that;
            return (this.getJobNo() == null ? other.getJobNo() == null : this.getJobNo().equals(other.getJobNo()))
					&& (this.getType() == null ? other.getType() == null : this.getType().equals(other.getType()))
					&& (this.getCollegeId() == null ? other.getCollegeId() == null : this.getCollegeId().equals(other.getCollegeId()))
					&& (this.getEntryData() == null ? other.getEntryData() == null : this.getEntryData().equals(other.getEntryData()))
					&& (this.getResearchArea() == null ? other.getResearchArea() == null : this.getResearchArea().equals(other.getResearchArea()))
					&& (this.getGenderId() == null ? other.getGenderId() == null : this.getGenderId().equals(other.getGenderId()))
					&& (this.getNationId() == null ? other.getNationId() == null : this.getNationId().equals(other.getNationId()))
					&& (this.getPoliticalStatusId() == null ? other.getPoliticalStatusId() == null : this.getPoliticalStatusId().equals(other.getPoliticalStatusId()))
					&& (this.getCertificateType() == null ? other.getCertificateType() == null : this.getCertificateType().equals(other.getCertificateType()))
					&& (this.getCertificateNo() == null ? other.getCertificateNo() == null : this.getCertificateNo().equals(other.getCertificateNo()))
					&& (this.getBirthday() == null ? other.getBirthday() == null : this.getBirthday().equals(other.getBirthday()))
					&& (this.getAdministrativePostId() == null ? other.getAdministrativePostId() == null : this.getAdministrativePostId().equals(other.getAdministrativePostId()))
					&& (this.getProfessionalTitleId() == null ? other.getProfessionalTitleId() == null : this.getProfessionalTitleId().equals(other.getProfessionalTitleId()))
					&& (this.getExternal() == null ? other.getExternal() == null : this.getExternal().equals(other.getExternal()))
					&& (this.getTerminalDegree() == null ? other.getTerminalDegree() == null : this.getTerminalDegree().equals(other.getTerminalDegree()))
					&& (this.getUndergraduateMajor() == null ? other.getUndergraduateMajor() == null : this.getUndergraduateMajor().equals(other.getUndergraduateMajor()))
					&& (this.getGainTimeOfTerminalDegree() == null ? other.getGainTimeOfTerminalDegree() == null : this.getGainTimeOfTerminalDegree().equals(other.getGainTimeOfTerminalDegree()))
					&& (this.getGainTimeOfUndergraduate() == null ? other.getGainTimeOfUndergraduate() == null : this.getGainTimeOfUndergraduate().equals(other.getGainTimeOfUndergraduate()))
					&& (this.getBachelorDegree() == null ? other.getBachelorDegree() == null : this.getBachelorDegree().equals(other.getBachelorDegree()))
					&& (this.getMasterTutor() == null ? other.getMasterTutor() == null : this.getMasterTutor().equals(other.getMasterTutor()))
					&& (this.getStudyAbroad() == null ? other.getStudyAbroad() == null : this.getStudyAbroad().equals(other.getStudyAbroad()))
					&& (this.getAcademician() == null ? other.getAcademician() == null : this.getAcademician().equals(other.getAcademician()))
					&& (this.getChangjiangScholar() == null ? other.getChangjiangScholar() == null : this.getChangjiangScholar().equals(other.getChangjiangScholar()))
					&& (this.getToyp() == null ? other.getToyp() == null : this.getToyp().equals(other.getToyp()))
					&& (this.getProvinceTubeExpert() == null ? other.getProvinceTubeExpert() == null : this.getProvinceTubeExpert().equals(other.getProvinceTubeExpert()))
					&& (this.getIndustryExperience() == null ? other.getIndustryExperience() == null : this.getIndustryExperience().equals(other.getIndustryExperience()))
					&& (this.getPracticeTrain() == null ? other.getPracticeTrain() == null : this.getPracticeTrain().equals(other.getPracticeTrain()))
					&& (this.getOtherHonoraryTitle() == null ? other.getOtherHonoraryTitle() == null : this.getOtherHonoraryTitle().equals(other.getOtherHonoraryTitle()))
					&& (this.getPhone() == null ? other.getPhone() == null : this.getPhone().equals(other.getPhone()))
					&& (this.getEmail() == null ? other.getEmail() == null : this.getEmail().equals(other.getEmail()))
					&& (this.getIndividualResume() == null ? other.getIndividualResume() == null : this.getIndividualResume().equals(other.getIndividualResume()))
					&& (this.getHeadImgId() == null ? other.getHeadImgId() == null : this.getHeadImgId().equals(other.getHeadImgId()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getJobNo() == null) ? 0 : getJobNo().hashCode());
        result = prime * result + ((getType() == null) ? 0 : getType().hashCode());
        result = prime * result + ((getCollegeId() == null) ? 0 : getCollegeId().hashCode());
        result = prime * result + ((getEntryData() == null) ? 0 : getEntryData().hashCode());
        result = prime * result + ((getResearchArea() == null) ? 0 : getResearchArea().hashCode());
        result = prime * result + ((getGenderId() == null) ? 0 : getGenderId().hashCode());
        result = prime * result + ((getNationId() == null) ? 0 : getNationId().hashCode());
        result = prime * result + ((getPoliticalStatusId() == null) ? 0 : getPoliticalStatusId().hashCode());
        result = prime * result + ((getCertificateType() == null) ? 0 : getCertificateType().hashCode());
        result = prime * result + ((getCertificateNo() == null) ? 0 : getCertificateNo().hashCode());
        result = prime * result + ((getBirthday() == null) ? 0 : getBirthday().hashCode());
        result = prime * result + ((getAdministrativePostId() == null) ? 0 : getAdministrativePostId().hashCode());
        result = prime * result + ((getProfessionalTitleId() == null) ? 0 : getProfessionalTitleId().hashCode());
        result = prime * result + ((getExternal() == null) ? 0 : getExternal().hashCode());
        result = prime * result + ((getTerminalDegree() == null) ? 0 : getTerminalDegree().hashCode());
        result = prime * result + ((getUndergraduateMajor() == null) ? 0 : getUndergraduateMajor().hashCode());
        result = prime * result + ((getGainTimeOfTerminalDegree() == null) ? 0 : getGainTimeOfTerminalDegree().hashCode());
        result = prime * result + ((getGainTimeOfUndergraduate() == null) ? 0 : getGainTimeOfUndergraduate().hashCode());
        result = prime * result + ((getBachelorDegree() == null) ? 0 : getBachelorDegree().hashCode());
        result = prime * result + ((getMasterTutor() == null) ? 0 : getMasterTutor().hashCode());
        result = prime * result + ((getStudyAbroad() == null) ? 0 : getStudyAbroad().hashCode());
        result = prime * result + ((getAcademician() == null) ? 0 : getAcademician().hashCode());
        result = prime * result + ((getChangjiangScholar() == null) ? 0 : getChangjiangScholar().hashCode());
        result = prime * result + ((getToyp() == null) ? 0 : getToyp().hashCode());
        result = prime * result + ((getProvinceTubeExpert() == null) ? 0 : getProvinceTubeExpert().hashCode());
        result = prime * result + ((getIndustryExperience() == null) ? 0 : getIndustryExperience().hashCode());
        result = prime * result + ((getPracticeTrain() == null) ? 0 : getPracticeTrain().hashCode());
        result = prime * result + ((getOtherHonoraryTitle() == null) ? 0 : getOtherHonoraryTitle().hashCode());
        result = prime * result + ((getPhone() == null) ? 0 : getPhone().hashCode());
        result = prime * result + ((getEmail() == null) ? 0 : getEmail().hashCode());
        result = prime * result + ((getIndividualResume() == null) ? 0 : getIndividualResume().hashCode());
        result = prime * result + ((getHeadImgId() == null) ? 0 : getHeadImgId().hashCode());
        return result;
    }
}