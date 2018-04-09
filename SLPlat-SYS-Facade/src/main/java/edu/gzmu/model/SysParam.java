package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 全局参数表
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("全局参数表")
@TableName("sys_param")
@SuppressWarnings("serial")
public class SysParam extends SLPlatBaseModel {
    @ApiModelProperty(value = "参数键名")
    @TableField("param_key")
    private String paramKey;
    @ApiModelProperty(value = "参数键值")
    @TableField("param_value")
    private String paramValue;
    @TableField("catalog_id")
    private Long catalogId;

    /**
     * @return the value of sys_param.param_key
     */
    public String getParamKey() {
        return paramKey;
    }

    /**
     * @param paramKey the value for sys_param.param_key
     */
    public void setParamKey(String paramKey) {
        this.paramKey = paramKey == null ? null : paramKey.trim();
    }

    /**
     * @return the value of sys_param.param_value
     */
    public String getParamValue() {
        return paramValue;
    }

    /**
     * @param paramValue the value for sys_param.param_value
     */
    public void setParamValue(String paramValue) {
        this.paramValue = paramValue == null ? null : paramValue.trim();
    }

    public Long getCatalogId() {
        return catalogId;
    }

    public void setCatalogId(Long catalogId) {
        this.catalogId = catalogId;
    }

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", paramKey=").append(paramKey);
        sb.append(", paramValue=").append(paramValue);
        sb.append(", catalogId=").append(catalogId);
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
            SysParam other = (SysParam) that;
            return (this.getParamKey() == null ? other.getParamKey() == null : this.getParamKey().equals(other.getParamKey()))
                    && (this.getParamValue() == null ? other.getParamValue() == null : this.getParamValue().equals(other.getParamValue()))
                    && (this.getCatalogId() == null ? other.getCatalogId() == null : this.getCatalogId().equals(other.getCatalogId()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getParamKey() == null) ? 0 : getParamKey().hashCode());
        result = prime * result + ((getParamValue() == null) ? 0 : getParamValue().hashCode());
        result = prime * result + ((getCatalogId() == null) ? 0 : getCatalogId().hashCode());
        return result;
    }
}