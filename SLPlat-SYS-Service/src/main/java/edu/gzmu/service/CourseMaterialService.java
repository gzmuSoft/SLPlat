package edu.gzmu.service;

import com.baomidou.mybatisplus.plugins.Page;
import edu.gzmu.model.CourseMaterial;
import edu.gzmu.model.Publisher;
import org.springframework.beans.factory.annotation.Autowired;
import top.ibase4j.core.base.BaseService;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;

import java.util.Map;

/**
 * <p>
 * 课程教材  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "CourseMaterial")
public class CourseMaterialService extends BaseService<CourseMaterial> {
    @Autowired
    private PublisherService publisherService;

    @Override
    public CourseMaterial queryById(Long id) {
        CourseMaterial courseMaterial = super.queryById(id);
        if (courseMaterial != null) {
            if (courseMaterial.getPublisherId()!= null) {
                Publisher publisher = publisherService.queryById(courseMaterial.getPublisherId());
                if (publisher != null) {
                    courseMaterial.setPublisherName(publisher.getName());

                } else {
                    courseMaterial.setPublisherName(null);

                }
            }
        }
        return courseMaterial;
    }

    public Page<CourseMaterial> query(Map<String, Object> params) {
        Page<CourseMaterial> pageInfo = super.query(params);
        for (CourseMaterial courseMaterial : pageInfo.getRecords()) {
            if (courseMaterial != null) {
                if (courseMaterial.getPublisherId() != null) {
                    Publisher publisher = publisherService.queryById(courseMaterial.getPublisherId());
                    if (publisher != null) {
                        courseMaterial.setPublisherName(publisher.getName());

                    } else {
                        courseMaterial.setPublisherName(null);

                    }
                }
            }
        }
        return pageInfo;
    }
}