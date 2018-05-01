package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.List;

/**
 * <p>
 * 学校
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("学校")
@SuppressWarnings("serial")
public class School extends SLPlatBaseModel {
    @ApiModelProperty(value = "学校概况")
	@TableField("school_profiles")
	private String schoolProfiles;
    @ApiModelProperty(value = "当前学校下的所有学院")
    @TableField(exist = false)
    private List<College> collegeList;

    public List<College> getCollegeList() {
        return collegeList;
    }

    public void setCollegeList(List<College> collegeList) {
        this.collegeList = collegeList;
    }

    public String getSchoolProfiles() {
		return schoolProfiles;
	}

	public void setSchoolProfiles(String schoolProfiles) {
		this.schoolProfiles = schoolProfiles;
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
            School other = (School) that;
            return (this.getSchoolProfiles() == null ? other.getSchoolProfiles() == null : this.getSchoolProfiles().equals(other.getSchoolProfiles()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getSchoolProfiles() == null) ? 0 : getSchoolProfiles().hashCode());
        return result;
    }
}