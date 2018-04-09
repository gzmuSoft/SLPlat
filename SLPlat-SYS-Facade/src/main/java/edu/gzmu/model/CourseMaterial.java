package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 课程教材
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("课程教材")
@TableName("course_material")
@SuppressWarnings("serial")
public class CourseMaterial extends SLPlatBaseModel {
    @ApiModelProperty(value = "出版社编号")
	@TableField("publisher_id")
	private Long publisherId;
    @ApiModelProperty(value = "编者")
	@TableField("editor_")
	private String editor;
    @ApiModelProperty(value = "ISBN")
	@TableField("ISBN_")
	private String isbn;
    @ApiModelProperty(value = "定价")
	@TableField("price_")
	private BigDecimal price;
    @ApiModelProperty(value = "教材特色")
	@TableField("feature_")
	private String feature;
    @ApiModelProperty(value = "出版日期")
	@TableField("publish_date")
	private Date publishDate;

	public Long getPublisherId() {
		return publisherId;
	}

	public void setPublisherId(Long publisherId) {
		this.publisherId = publisherId;
	}

	public String getEditor() {
		return editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public String getFeature() {
		return feature;
	}

	public void setFeature(String feature) {
		this.feature = feature;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", publisherId=").append(publisherId);
        sb.append(", editor=").append(editor);
        sb.append(", isbn=").append(isbn);
        sb.append(", price=").append(price);
        sb.append(", feature=").append(feature);
        sb.append(", publishDate=").append(publishDate);
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
            CourseMaterial other = (CourseMaterial) that;
            return (this.getPublisherId() == null ? other.getPublisherId() == null : this.getPublisherId().equals(other.getPublisherId()))
					&& (this.getEditor() == null ? other.getEditor() == null : this.getEditor().equals(other.getEditor()))
					&& (this.getIsbn() == null ? other.getIsbn() == null : this.getIsbn().equals(other.getIsbn()))
					&& (this.getPrice() == null ? other.getPrice() == null : this.getPrice().equals(other.getPrice()))
					&& (this.getFeature() == null ? other.getFeature() == null : this.getFeature().equals(other.getFeature()))
					&& (this.getPublishDate() == null ? other.getPublishDate() == null : this.getPublishDate().equals(other.getPublishDate()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getPublisherId() == null) ? 0 : getPublisherId().hashCode());
        result = prime * result + ((getEditor() == null) ? 0 : getEditor().hashCode());
        result = prime * result + ((getIsbn() == null) ? 0 : getIsbn().hashCode());
        result = prime * result + ((getPrice() == null) ? 0 : getPrice().hashCode());
        result = prime * result + ((getFeature() == null) ? 0 : getFeature().hashCode());
        result = prime * result + ((getPublishDate() == null) ? 0 : getPublishDate().hashCode());
        return result;
    }
}