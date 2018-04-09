package edu.gzmu.model.base;

import com.baomidou.mybatisplus.annotations.TableField;
import top.ibase4j.core.base.BaseModel;

/**
 * Created by yaolin on 2018/4/5.
 */
public class SLPlatBaseModel extends BaseModel {
    @TableField("name_")
    private String name;
    @TableField("spell_")
    private String spell;
    @TableField("sort_no")
    private Integer sortNo;

    /**
     * 获取当前对象的name属性的值
     */
    public String getName() {
        return name;
    }

    /**
     * 设置当前对象的name属性的值
     * @param name 对象的新name值 */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * 获取当前对象的spell属性的值
     */
    public String getSpell() {
        return spell;
    }

    /**
     * 设置当前对象的spell属性的值
     * @param spell 对象的新spell值 */
    public void setSpell(String spell) {
        this.spell = spell == null ? null : spell.trim();
    }

    /**
     * 获取当前对象的sortNo属性的值
     */
    public Integer getSortNo() {
        return sortNo;
    }

    /**
     * 设置当前对象的orders属性的值
     * @param sortNo 对象的新sortNo值 */
    public void setSortNo(Integer sortNo) {
        this.sortNo = sortNo;
    }

    /** 返回当前对象信息的字符串表示的部分信息 */
    public String getSubToString() {
        StringBuilder sb = new StringBuilder();
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(this.getId());
        sb.append(", name=").append(this.getName());
        sb.append(", spell=").append(this.getSpell());
        sb.append(", remark=").append(this.getRemark());
        sb.append(", Enable=").append(this.getEnable());
        sb.append(", createBy=").append(this.getCreateBy());
        sb.append(", createTime=").append(this.getCreateTime());
        sb.append(", updateBy=").append(this.getUpdateBy());
        sb.append(", updateTime=").append(this.getUpdateTime());
        return sb.toString();
    }

    /** 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据 */
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(getSubToString());
        sb.append("]");
        return sb.toString();
    }

    /**
     * 判断两个对象是否相等
     */
    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        SLPlatBaseModel other = (SLPlatBaseModel) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
                && (this.getName() == null ? other.getName() == null : this.getName().equals(other.getName()))
                && (this.getSpell() == null ? other.getSpell() == null : this.getSpell().equals(other.getSpell()))
                && (this.getSortNo() == null ? other.getSortNo() == null : this.getSortNo().equals(other.getSortNo()))
                && (this.getRemark() == null ? other.getRemark() == null : this.getRemark().equals(other.getRemark()))
                && (this.getEnable() == null ? other.getEnable() == null : this.getEnable().equals(other.getEnable()))
                && (this.getCreateBy() == null ? other.getCreateBy() == null : this.getCreateBy().equals(other.getCreateBy()))
                && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
                && (this.getUpdateBy() == null ? other.getUpdateBy() == null : this.getUpdateBy().equals(other.getUpdateBy()))
                && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()));
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getName() == null) ? 0 : getName().hashCode());
        result = prime * result + ((getSpell() == null) ? 0 : getSpell().hashCode());
        result = prime * result + ((getSortNo() == null) ? 0 : getSortNo().hashCode());
        result = prime * result + ((getRemark() == null) ? 0 : getRemark().hashCode());
        result = prime * result + ((getEnable() == null) ? 0 : getEnable().hashCode());
        result = prime * result + ((getCreateBy() == null) ? 0 : getCreateBy().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getUpdateBy() == null) ? 0 : getUpdateBy().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        return result;
    }

    /**
     * 创建并返回此对象的一个浅副本
     * @exception CloneNotSupportedException */
    public SLPlatBaseModel clone() throws CloneNotSupportedException {
        return (SLPlatBaseModel)super.clone();
    }
}
