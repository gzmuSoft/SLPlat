package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 部门
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-06
 */
@ApiModel("部门")
@TableName("sys_dept")
@SuppressWarnings("serial")
public class SysDept extends SLPlatBaseModel {
	@ApiModelProperty(value = "隶属单位")
	@TableField("unit_id")
	private Long unitId;
	@ApiModelProperty(value = "上级部门编号")
	@TableField("parent_id")
	private Long parentId;
	@ApiModelProperty(value = "叶子节点(0:树枝节点;1:叶子节点)")
	@TableField("leaf_")
	private Integer leaf;

	@TableField(exist = false)
	private String parentName;


	public Long getUnitId() {
		return unitId;
	}

	public void setUnitId(Long unitId) {
		this.unitId = unitId;
	}

	/**
	 * @return the value of sys_dept.parent_id
	 */
	public Long getParentId() {
		return parentId;
	}

	/**
	 * @param parentId
	 *            the value for sys_dept.parent_id
	 */
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	/**
	 * @return the value of sys_dept.leaf_
	 */
	public Integer getLeaf() {
		return leaf;
	}

	/**
	 * @param leaf
	 *            the value for sys_dept.leaf_
	 */
	public void setLeaf(Integer leaf) {
		this.leaf = leaf;
	}

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}


	/**
	 * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
	 */
	@Override
	public String toString() {
		StringBuilder sb = new StringBuilder();
		sb.append(getClass().getSimpleName());
		sb.append(super.getSubToString());
		sb.append(", unitId=").append(unitId);
		sb.append(", parentId=").append(parentId);
		sb.append(", leaf=").append(leaf);
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
			SysDept other = (SysDept) that;
			return (this.getUnitId() == null ? other.getUnitId() == null : this.getUnitId().equals(other.getUnitId()))
					&& (this.getParentId() == null ? other.getParentId() == null : this.getParentId().equals(other.getParentId()))
					&& (this.getLeaf() == null ? other.getLeaf() == null : this.getLeaf().equals(other.getLeaf()));
		}
	}

	/**
	 * 获取当前对象的hashCode编码值
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + ((getUnitId() == null) ? 0 : getUnitId().hashCode());
		result = prime * result + ((getParentId() == null) ? 0 : getParentId().hashCode());
		result = prime * result + ((getLeaf() == null) ? 0 : getLeaf().hashCode());
		return result;
	}
}
