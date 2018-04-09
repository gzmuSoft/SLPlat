package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 * 第三方用户
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("第三方用户")
@TableName("sys_user_thirdparty")
@SuppressWarnings("serial")
public class SysUserThirdparty extends SLPlatBaseModel {
    @TableField("user_id")
    private Long userId;
    @ApiModelProperty(value = "第三方类型")
    @TableField("provider_")
    private String provider;
    @ApiModelProperty(value = "第三方id")
    @TableField("open_id")
    private String openId;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getProvider() {
        return provider;
    }

    public void setProvider(String provider) {
        this.provider = provider == null ? null : provider.trim();
    }

    public String getOpenId() {
        return openId;
    }

    public void setOpenId(String openId) {
        this.openId = openId == null ? null : openId.trim();
    }

    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append(", userId=").append(userId);
        sb.append(", provider=").append(provider);
        sb.append(", openId=").append(openId);
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
            SysUserThirdparty other = (SysUserThirdparty) that;
            return (this.getUserId() == null ? other.getUserId() == null : this.getUserId().equals(other.getUserId()))
                    && (this.getProvider() == null ? other.getProvider() == null : this.getProvider().equals(other.getProvider()))
                    && (this.getOpenId() == null ? other.getOpenId() == null : this.getOpenId().equals(other.getOpenId()));
        }
    }

    /**
     * 获取当前对象的hashCode编码值
     */
    @Override
    public int hashCode() {
        final int prime = 31;
        int result = super.hashCode();
        result = prime * result + ((getUserId() == null) ? 0 : getUserId().hashCode());
        result = prime * result + ((getProvider() == null) ? 0 : getProvider().hashCode());
        result = prime * result + ((getOpenId() == null) ? 0 : getOpenId().hashCode());
        return result;
    }
}