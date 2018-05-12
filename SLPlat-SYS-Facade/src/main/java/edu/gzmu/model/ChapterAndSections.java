package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 章节
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("章节")
@TableName("chapter_and_sections")
@SuppressWarnings("serial")
public class ChapterAndSections extends SLPlatBaseModel {
    @ApiModelProperty(value = "课程编号")
	@TableField("course_id")
	private Long courseId;
    @ApiModelProperty(value = "概述")
	@TableField("overview_")
	private String overview;
    @ApiModelProperty(value = "所属父章节编号")
	@TableField("parent_id")
	private Long parentId;
    @TableField(exist=false)
    private String courseName;

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }
    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", courseId=").append(courseId);
        sb.append(", courseName=").append(courseId);
        sb.append(", overview=").append(overview);
        sb.append(", parentId=").append(parentId);
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
            ChapterAndSections other = (ChapterAndSections) that;
            return (this.getCourseId() == null ? other.getCourseId() == null : this.getCourseId().equals(other.getCourseId()))
                    && (this.getCourseName() == null ? other.getCourseName() == null : this.getCourseName().equals(other.getCourseName()))
                    && (this.getOverview() == null ? other.getOverview() == null : this.getOverview().equals(other.getOverview()))
                    && (this.getParentId() == null ? other.getParentId() == null : this.getParentId().equals(other.getParentId()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getCourseId() == null) ? 0 : getCourseId().hashCode());
        result = prime * result + ((getCourseName() == null) ? 0 : getCourseName().hashCode());
        result = prime * result + ((getOverview() == null) ? 0 : getOverview().hashCode());
        result = prime * result + ((getParentId() == null) ? 0 : getParentId().hashCode());
        return result;
    }
}