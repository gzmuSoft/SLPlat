package edu.gzmu.service;

import edu.gzmu.model.Attachment;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 附件文档  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "Attachment")
public class AttachmentService extends BaseService<Attachment> {
	
}