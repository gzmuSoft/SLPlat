package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 镇
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("镇")
@SuppressWarnings("serial")
public class Town extends SLPlatBaseModel {
    @ApiModelProperty(value = "区县编号")
	@TableField("county_id")
	private Long countyId;

	public Long getCountyId() {
		return countyId;
	}

	public void setCountyId(Long countyId) {
		this.countyId = countyId;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", countyId=").append(countyId);
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
            Town other = (Town) that;
            return (this.getCountyId() == null ? other.getCountyId() == null : this.getCountyId().equals(other.getCountyId()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getCountyId() == null) ? 0 : getCountyId().hashCode());
        return result;
    }
}