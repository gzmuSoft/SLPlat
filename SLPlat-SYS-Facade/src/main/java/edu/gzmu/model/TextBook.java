package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.util.Date;

/**
 * <p>
 * 教材
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("教材")
@TableName("text_book")
@SuppressWarnings("serial")
public class TextBook extends SLPlatBaseModel {
    @ApiModelProperty(value = "主编编号")
	@TableField("chief_editor_id")
	private Long chiefEditorId;
    @ApiModelProperty(value = "领域")
	@TableField("domain_")
	private String domain;
    @ApiModelProperty(value = "出版社编号")
	@TableField("publisher_id")
	private Long publisherId;
    @ApiModelProperty(value = "简介")
	@TableField("introduction_")
	private String introduction;
    @ApiModelProperty(value = "ISBN")
	@TableField("ISBN_")
	private String isbn;
    @ApiModelProperty(value = "默认：false否，true是")
	@TableField("is_national_plan")
	private Boolean isNationalPlan;
    @ApiModelProperty(value = "获奖情况")
	@TableField("award_situation")
	private String awardSituation;
    @ApiModelProperty(value = "出版日期")
	@TableField("publish_date")
	private Date publishDate;
    @ApiModelProperty(value = "附件文档")
	@TableField("attachment_id")
	private Long attachmentId;

	public Long getChiefEditorId() {
		return chiefEditorId;
	}

	public void setChiefEditorId(Long chiefEditorId) {
		this.chiefEditorId = chiefEditorId;
	}

	public String getDomain() {
		return domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public Long getPublisherId() {
		return publisherId;
	}

	public void setPublisherId(Long publisherId) {
		this.publisherId = publisherId;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public Boolean getNationalPlan() {
		return isNationalPlan;
	}

	public void setNationalPlan(Boolean isNationalPlan) {
		this.isNationalPlan = isNationalPlan;
	}

	public String getAwardSituation() {
		return awardSituation;
	}

	public void setAwardSituation(String awardSituation) {
		this.awardSituation = awardSituation;
	}

	public Date getPublishDate() {
		return publishDate;
	}

	public void setPublishDate(Date publishDate) {
		this.publishDate = publishDate;
	}

	public Long getAttachmentId() {
		return attachmentId;
	}

	public void setAttachmentId(Long attachmentId) {
		this.attachmentId = attachmentId;
	}

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", chiefEditorId=").append(chiefEditorId);
        sb.append(", domain=").append(domain);
        sb.append(", publisherId=").append(publisherId);
        sb.append(", introduction=").append(introduction);
        sb.append(", isbn=").append(isbn);
        sb.append(", isNationalPlan=").append(isNationalPlan);
        sb.append(", awardSituation=").append(awardSituation);
        sb.append(", publishDate=").append(publishDate);
        sb.append(", attachmentId=").append(attachmentId);
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
            TextBook other = (TextBook) that;
            return (this.getChiefEditorId() == null ? other.getChiefEditorId() == null : this.getChiefEditorId().equals(other.getChiefEditorId()))
					&& (this.getDomain() == null ? other.getDomain() == null : this.getDomain().equals(other.getDomain()))
					&& (this.getPublisherId() == null ? other.getPublisherId() == null : this.getPublisherId().equals(other.getPublisherId()))
					&& (this.getIntroduction() == null ? other.getIntroduction() == null : this.getIntroduction().equals(other.getIntroduction()))
					&& (this.getIsbn() == null ? other.getIsbn() == null : this.getIsbn().equals(other.getIsbn()))
					&& (this.getNationalPlan() == null ? other.getNationalPlan() == null : this.getNationalPlan().equals(other.getNationalPlan()))
					&& (this.getAwardSituation() == null ? other.getAwardSituation() == null : this.getAwardSituation().equals(other.getAwardSituation()))
					&& (this.getPublishDate() == null ? other.getPublishDate() == null : this.getPublishDate().equals(other.getPublishDate()))
					&& (this.getAttachmentId() == null ? other.getAttachmentId() == null : this.getAttachmentId().equals(other.getAttachmentId()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getChiefEditorId() == null) ? 0 : getChiefEditorId().hashCode());
        result = prime * result + ((getDomain() == null) ? 0 : getDomain().hashCode());
        result = prime * result + ((getPublisherId() == null) ? 0 : getPublisherId().hashCode());
        result = prime * result + ((getIntroduction() == null) ? 0 : getIntroduction().hashCode());
        result = prime * result + ((getIsbn() == null) ? 0 : getIsbn().hashCode());
        result = prime * result + ((getNationalPlan() == null) ? 0 : getNationalPlan().hashCode());
        result = prime * result + ((getAwardSituation() == null) ? 0 : getAwardSituation().hashCode());
        result = prime * result + ((getPublishDate() == null) ? 0 : getPublishDate().hashCode());
        result = prime * result + ((getAttachmentId() == null) ? 0 : getAttachmentId().hashCode());
        return result;
    }
}