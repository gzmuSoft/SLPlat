package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;
import io.swagger.annotations.ApiModel;

/**
 * <p>
 * 行政职务
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("行政职务")
@TableName("administrative_post")
@SuppressWarnings("serial")
public class AdministrativePost extends SLPlatBaseModel {
    /**
     * 返回当前对象信息的字符串表示，该信息能够直接转换成JSON数据
     */
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(super.getSubToString());
        sb.append("]");
        return sb.toString();
    }
}