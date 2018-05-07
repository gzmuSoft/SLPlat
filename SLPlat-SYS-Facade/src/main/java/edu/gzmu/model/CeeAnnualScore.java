package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 历年分数线
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("历年分数线")
@TableName("cee_annual_score")
@SuppressWarnings("serial")
public class CeeAnnualScore extends SLPlatBaseModel {
    @ApiModelProperty(value = "年份")
	@TableField("year_")
	private Long year;
    @ApiModelProperty(value = "省份编号")
	@TableField("province_id")
	private Long provinceId;
    @TableField(exist = false)
    private String provinceName;
    @ApiModelProperty(value = "考生类别编号")
	@TableField("category_id")
	private Long categoryId;
    @TableField(exist = false)
    private String categoryName;
    @ApiModelProperty(value = "批次编号")
	@TableField("batch_id")
	private Long batchId;
    @TableField(exist = false)
    private String batchName;
    @ApiModelProperty(value = "最低分数线")
	@TableField("min_score_line")
	private Float minScoreLine;

	public Long getYear() {
		return year;
	}

	public void setYear(Long year) {
		this.year = year;
	}

	public Long getProvinceId() {
		return provinceId;
	}

	public void setProvinceId(Long provinceId) {
		this.provinceId = provinceId;
	}

	public String getProvinceName() {
	    return provinceName;
	}

	public void setProvinceName(String provinceName) {
	    this.provinceName = provinceName;
    }

	public Long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Long categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
	    return categoryName;
    }

    public void setCategoryName(String categoryName) {
	    this.categoryName = categoryName;
    }

	public Long getBatchId() {
		return batchId;
	}

	public void setBatchId(Long batchId) {
		this.batchId = batchId;
	}

	public String getBatchName() {
	    return batchName;
    }

    public void setBatchName(String batchName) {
	    this.batchName = batchName;
    }

	public Float getMinScoreLine() {
		return minScoreLine;
	}

	public void setMinScoreLine(Float minScoreLine) {
		this.minScoreLine = minScoreLine;
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
        sb.append(", provinceId=").append(provinceId);
        sb.append(", categoryId=").append(categoryId);
        sb.append(", batchId=").append(batchId);
        sb.append(", minScoreLine=").append(minScoreLine);
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
            CeeAnnualScore other = (CeeAnnualScore) that;
            return (this.getYear() == null ? other.getYear() == null : this.getYear().equals(other.getYear()))
                    && (this.getProvinceId() == null ? other.getProvinceId() == null : this.getProvinceId().equals(other.getProvinceId()))
                    && (this.getCategoryId() == null ? other.getCategoryId() == null : this.getCategoryId().equals(other.getCategoryId()))
                    && (this.getBatchId() == null ? other.getBatchId() == null : this.getBatchId().equals(other.getBatchId()))
                    && (this.getMinScoreLine() == null ? other.getMinScoreLine() == null : this.getMinScoreLine().equals(other.getMinScoreLine()));
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
        result = prime * result + ((getProvinceId() == null) ? 0 : getProvinceId().hashCode());
        result = prime * result + ((getCategoryId() == null) ? 0 : getCategoryId().hashCode());
        result = prime * result + ((getBatchId() == null) ? 0 : getBatchId().hashCode());
        result = prime * result + ((getMinScoreLine() == null) ? 0 : getMinScoreLine().hashCode());
        return result;
    }
}