package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import edu.gzmu.model.base.SLPlatBaseModel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.Date;

/**
 * <p>
 * 学生
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("学生")
@SuppressWarnings("serial")
public class Student extends SLPlatBaseModel {
    @ApiModelProperty(value = "学号")
	@TableField("no_")
	private String no;
    @ApiModelProperty(value = "出生日期")
	@TableField("birthdady_")
	private Date birthdady;
    @ApiModelProperty(value = "性别编号")
	@TableField("gender_id")
	private Long genderId;
    @ApiModelProperty(value = "民族编号")
	@TableField("nation_id")
	private Long nationId;
    @ApiModelProperty(value = "政治面貌编号")
	@TableField("political_status_id")
	private Long politicalStatusId;
    @ApiModelProperty(value = "学院编号")
	@TableField("college_id")
	private Long collegeId;
    @ApiModelProperty(value = "专业编号")
	@TableField("specialty_id")
	private Long specialtyId;
    @ApiModelProperty(value = "班级编号")
	@TableField("class_own_id")
	private Long classOwnId;
    @ApiModelProperty(value = "入学日期")
	@TableField("entrance_date")
	private Date entranceDate;
    @ApiModelProperty(value = "年龄")
	@TableField("age_")
	private Integer age;
    @ApiModelProperty(value = "身份证号")
	@TableField("idcard_no")
	private String idcardNo;
    @ApiModelProperty(value = "电话")
	@TableField("phone_")
	private String phone;
    @ApiModelProperty(value = "电子邮箱")
	@TableField("email_")
	private String email;
    @ApiModelProperty(value = "高考分数")
	@TableField("college_enexam_scores")
	private Float collegeEnexamScores;
    @ApiModelProperty(value = "省编号")
	@TableField("province_id")
	private Long provinceId;
    @ApiModelProperty(value = "市编号")
	@TableField("city_id")
	private Long cityId;
    @ApiModelProperty(value = "县/区编号")
	@TableField("county_id")
	private Long countyId;
    @ApiModelProperty(value = "镇编号")
	@TableField("town_id")
	private Long townId;
    @ApiModelProperty(value = "家庭住址")
	@TableField("address_")
	private String address;
    @ApiModelProperty(value = "就读高中")
	@TableField("high_school")
	private String highSchool;
    @ApiModelProperty(value = "高中类别编号")
	@TableField("high_school_category_id")
	private Long highSchoolCategoryId;
    @ApiModelProperty(value = "考研信息编号")
	@TableField("postgraduate_info_id")
	private Long postgraduateInfoId;
    @ApiModelProperty(value = "头像")
	@TableField("head_img_id")
	private Long headImgId;

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public Date getBirthdady() {
		return birthdady;
	}

	public void setBirthdady(Date birthdady) {
		this.birthdady = birthdady;
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

	public Long getCollegeId() {
		return collegeId;
	}

	public void setCollegeId(Long collegeId) {
		this.collegeId = collegeId;
	}

	public Long getSpecialtyId() {
		return specialtyId;
	}

	public void setSpecialtyId(Long specialtyId) {
		this.specialtyId = specialtyId;
	}

	public Long getClassOwnId() {
		return classOwnId;
	}

	public void setClassOwnId(Long classOwnId) {
		this.classOwnId = classOwnId;
	}

	public Date getEntranceDate() {
		return entranceDate;
	}

	public void setEntranceDate(Date entranceDate) {
		this.entranceDate = entranceDate;
	}

	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
	}

	public String getIdcardNo() {
		return idcardNo;
	}

	public void setIdcardNo(String idcardNo) {
		this.idcardNo = idcardNo;
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

	public Float getCollegeEnexamScores() {
		return collegeEnexamScores;
	}

	public void setCollegeEnexamScores(Float collegeEnexamScores) {
		this.collegeEnexamScores = collegeEnexamScores;
	}

	public Long getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(Long provinceId) {
		this.provinceId = provinceId;
	}

	public Long getCityId() {
		return cityId;
	}

	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}

	public Long getCountyId() {
		return countyId;
	}

	public void setCountyId(Long countyId) {
		this.countyId = countyId;
	}

	public Long getTownId() {
		return townId;
	}

	public void setTownId(Long townId) {
		this.townId = townId;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHighSchool() {
		return highSchool;
	}

	public void setHighSchool(String highSchool) {
		this.highSchool = highSchool;
	}

	public Long getHighSchoolCategoryId() {
		return highSchoolCategoryId;
	}

	public void setHighSchoolCategoryId(Long highSchoolCategoryId) {
		this.highSchoolCategoryId = highSchoolCategoryId;
	}

	public Long getPostgraduateInfoId() {
		return postgraduateInfoId;
	}

	public void setPostgraduateInfoId(Long postgraduateInfoId) {
		this.postgraduateInfoId = postgraduateInfoId;
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
        sb.append(", no=").append(no);
        sb.append(", birthdady=").append(birthdady);
        sb.append(", genderId=").append(genderId);
        sb.append(", nationId=").append(nationId);
        sb.append(", politicalStatusId=").append(politicalStatusId);
        sb.append(", collegeId=").append(collegeId);
        sb.append(", specialtyId=").append(specialtyId);
        sb.append(", classOwnId=").append(classOwnId);
        sb.append(", entranceDate=").append(entranceDate);
        sb.append(", age=").append(age);
        sb.append(", idcardNo=").append(idcardNo);
        sb.append(", phone=").append(phone);
        sb.append(", email=").append(email);
        sb.append(", collegeEnexamScores=").append(collegeEnexamScores);
        sb.append(", provinceId=").append(provinceId);
        sb.append(", cityId=").append(cityId);
        sb.append(", countyId=").append(countyId);
        sb.append(", townId=").append(townId);
        sb.append(", address=").append(address);
        sb.append(", highSchool=").append(highSchool);
        sb.append(", highSchoolCategoryId=").append(highSchoolCategoryId);
        sb.append(", postgraduateInfoId=").append(postgraduateInfoId);
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
            Student other = (Student) that;
            return (this.getNo() == null ? other.getNo() == null : this.getNo().equals(other.getNo()))
					&& (this.getBirthdady() == null ? other.getBirthdady() == null : this.getBirthdady().equals(other.getBirthdady()))
					&& (this.getGenderId() == null ? other.getGenderId() == null : this.getGenderId().equals(other.getGenderId()))
					&& (this.getNationId() == null ? other.getNationId() == null : this.getNationId().equals(other.getNationId()))
					&& (this.getPoliticalStatusId() == null ? other.getPoliticalStatusId() == null : this.getPoliticalStatusId().equals(other.getPoliticalStatusId()))
					&& (this.getCollegeId() == null ? other.getCollegeId() == null : this.getCollegeId().equals(other.getCollegeId()))
					&& (this.getSpecialtyId() == null ? other.getSpecialtyId() == null : this.getSpecialtyId().equals(other.getSpecialtyId()))
					&& (this.getClassOwnId() == null ? other.getClassOwnId() == null : this.getClassOwnId().equals(other.getClassOwnId()))
					&& (this.getEntranceDate() == null ? other.getEntranceDate() == null : this.getEntranceDate().equals(other.getEntranceDate()))
					&& (this.getAge() == null ? other.getAge() == null : this.getAge().equals(other.getAge()))
					&& (this.getIdcardNo() == null ? other.getIdcardNo() == null : this.getIdcardNo().equals(other.getIdcardNo()))
					&& (this.getPhone() == null ? other.getPhone() == null : this.getPhone().equals(other.getPhone()))
					&& (this.getEmail() == null ? other.getEmail() == null : this.getEmail().equals(other.getEmail()))
					&& (this.getCollegeEnexamScores() == null ? other.getCollegeEnexamScores() == null : this.getCollegeEnexamScores().equals(other.getCollegeEnexamScores()))
					&& (this.getProvinceId() == null ? other.getProvinceId() == null : this.getProvinceId().equals(other.getProvinceId()))
					&& (this.getCityId() == null ? other.getCityId() == null : this.getCityId().equals(other.getCityId()))
					&& (this.getCountyId() == null ? other.getCountyId() == null : this.getCountyId().equals(other.getCountyId()))
					&& (this.getTownId() == null ? other.getTownId() == null : this.getTownId().equals(other.getTownId()))
					&& (this.getAddress() == null ? other.getAddress() == null : this.getAddress().equals(other.getAddress()))
					&& (this.getHighSchool() == null ? other.getHighSchool() == null : this.getHighSchool().equals(other.getHighSchool()))
					&& (this.getHighSchoolCategoryId() == null ? other.getHighSchoolCategoryId() == null : this.getHighSchoolCategoryId().equals(other.getHighSchoolCategoryId()))
					&& (this.getPostgraduateInfoId() == null ? other.getPostgraduateInfoId() == null : this.getPostgraduateInfoId().equals(other.getPostgraduateInfoId()))
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
        result = prime * result + ((getNo() == null) ? 0 : getNo().hashCode());
        result = prime * result + ((getBirthdady() == null) ? 0 : getBirthdady().hashCode());
        result = prime * result + ((getGenderId() == null) ? 0 : getGenderId().hashCode());
        result = prime * result + ((getNationId() == null) ? 0 : getNationId().hashCode());
        result = prime * result + ((getPoliticalStatusId() == null) ? 0 : getPoliticalStatusId().hashCode());
        result = prime * result + ((getCollegeId() == null) ? 0 : getCollegeId().hashCode());
        result = prime * result + ((getSpecialtyId() == null) ? 0 : getSpecialtyId().hashCode());
        result = prime * result + ((getClassOwnId() == null) ? 0 : getClassOwnId().hashCode());
        result = prime * result + ((getEntranceDate() == null) ? 0 : getEntranceDate().hashCode());
        result = prime * result + ((getAge() == null) ? 0 : getAge().hashCode());
        result = prime * result + ((getIdcardNo() == null) ? 0 : getIdcardNo().hashCode());
        result = prime * result + ((getPhone() == null) ? 0 : getPhone().hashCode());
        result = prime * result + ((getEmail() == null) ? 0 : getEmail().hashCode());
        result = prime * result + ((getCollegeEnexamScores() == null) ? 0 : getCollegeEnexamScores().hashCode());
        result = prime * result + ((getProvinceId() == null) ? 0 : getProvinceId().hashCode());
        result = prime * result + ((getCityId() == null) ? 0 : getCityId().hashCode());
        result = prime * result + ((getCountyId() == null) ? 0 : getCountyId().hashCode());
        result = prime * result + ((getTownId() == null) ? 0 : getTownId().hashCode());
        result = prime * result + ((getAddress() == null) ? 0 : getAddress().hashCode());
        result = prime * result + ((getHighSchool() == null) ? 0 : getHighSchool().hashCode());
        result = prime * result + ((getHighSchoolCategoryId() == null) ? 0 : getHighSchoolCategoryId().hashCode());
        result = prime * result + ((getPostgraduateInfoId() == null) ? 0 : getPostgraduateInfoId().hashCode());
        result = prime * result + ((getHeadImgId() == null) ? 0 : getHeadImgId().hashCode());
        return result;
    }
}