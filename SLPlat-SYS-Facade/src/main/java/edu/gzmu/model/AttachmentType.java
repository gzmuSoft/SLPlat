package edu.gzmu.model;

import com.baomidou.mybatisplus.annotations.TableName;
import edu.gzmu.model.base.SLPlatBaseModel;
import io.swagger.annotations.ApiModel;

/**
 * <p>
 * 附件类型
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@ApiModel("附件类型")
@TableName("attachment_type")
@SuppressWarnings("serial")
public class AttachmentType extends SLPlatBaseModel {
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