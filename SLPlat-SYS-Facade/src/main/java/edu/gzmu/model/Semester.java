package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import edu.gzmu.model.base.SLPlatBaseModel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.Date;

/**
 * <p>
 * 学期
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("学期")
@SuppressWarnings("serial")
public class Semester extends SLPlatBaseModel {
    @ApiModelProperty(value = "开始日期")
	@TableField("start_date")
	private Date startDate;
    @ApiModelProperty(value = "结束日期")
	@TableField("end_date")
	private Date endDate;
    @ApiModelProperty(value = "总周数")
	@TableField("total_Weeks")
	private Long totalWeeks;

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Long getTotalWeeks() {
		return totalWeeks;
	}

	public void setTotalWeeks(Long totalWeeks) {
		this.totalWeeks = totalWeeks;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", startDate=").append(startDate);
        sb.append(", endDate=").append(endDate);
        sb.append(", totalWeeks=").append(totalWeeks);
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
            Semester other = (Semester) that;
            return (this.getStartDate() == null ? other.getStartDate() == null : this.getStartDate().equals(other.getStartDate()))
                    && (this.getEndDate() == null ? other.getEndDate() == null : this.getEndDate().equals(other.getEndDate()))
                    && (this.getTotalWeeks() == null ? other.getTotalWeeks() == null : this.getTotalWeeks().equals(other.getTotalWeeks()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getStartDate() == null) ? 0 : getStartDate().hashCode());
        result = prime * result + ((getEndDate() == null) ? 0 : getEndDate().hashCode());
        result = prime * result + ((getTotalWeeks() == null) ? 0 : getTotalWeeks().hashCode());
        return result;
    }
}