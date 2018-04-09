package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 区县
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("区县")
@SuppressWarnings("serial")
public class County extends SLPlatBaseModel {
    @ApiModelProperty(value = "市编号")
	@TableField("city_id")
	private Long cityId;

	public Long getCityId() {
		return cityId;
	}

	public void setCityId(Long cityId) {
		this.cityId = cityId;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", cityId=").append(cityId);
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
            County other = (County) that;
            return (this.getCityId() == null ? other.getCityId() == null : this.getCityId().equals(other.getCityId()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getCityId() == null) ? 0 : getCityId().hashCode());
        return result;
    }
}