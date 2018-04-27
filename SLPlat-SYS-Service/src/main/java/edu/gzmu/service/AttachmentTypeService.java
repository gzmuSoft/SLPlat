package edu.gzmu.service;

import edu.gzmu.model.AttachmentType;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 附件类型  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "AttachmentType")
public class AttachmentTypeService extends BaseService<AttachmentType> {
    public AttachmentType queryById(Long id){
        AttachmentType attachmentType = super.queryById(id);
        return attachmentType;
    }
}