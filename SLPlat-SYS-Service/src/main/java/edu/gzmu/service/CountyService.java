package edu.gzmu.service;

import com.baomidou.mybatisplus.plugins.Page;
import edu.gzmu.model.City;
import edu.gzmu.model.County;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import top.ibase4j.core.base.BaseService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 区县  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "County")
public class CountyService extends BaseService<County> {
    @Autowired
    private CityService cityService;

    @Override
    public County queryById(Long id) {
        County county = super.queryById(id);
        if (county != null) {
            if (county.getCityId() != null) {
               City city = cityService.queryById(county.getCityId());
                if (city != null) {
                    county.setCityName(city.getName());
                    county.setProvinceName(city.getProvinceName());
                    county.setProvinceId(city.getProvinceId());
                } else {
                    county.setCityName(null);
                    county.setProvinceName(null);
                    county.setProvinceId(null);
                }
            }
        }
        return county;
    }
    @Override
    public Page<County> query(Map<String, Object> params) {
        Page<County> pageInfo = super.query(params);
        for (County county : pageInfo.getRecords()) {
            if (county.getCityId() != null) {
                City city = cityService.queryById(county.getCityId());
                if ( city != null) {
                    county.setCityName(city.getName());
                    county.setProvinceName(city.getProvinceName());
                    county.setProvinceId(city.getProvinceId());
                }else {
                    county.setCityName(null);
                    county.setProvinceName(null);
                    county.setProvinceId(null);
                }
            }
        }
        return pageInfo;
    }
}