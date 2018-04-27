package edu.gzmu.service;

import com.baomidou.mybatisplus.plugins.Page;
import edu.gzmu.model.City;
import edu.gzmu.model.Province;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheConfig;
import org.springframework.stereotype.Service;
import top.ibase4j.core.base.BaseService;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 市  服务实现类
 * </p>
 *
 * @author JiaYinWei
 * @since 2018-04-08
 */
@Service
@CacheConfig(cacheNames = "city")
public class CityService extends BaseService<City> {
    @Autowired
    private ProvinceService provinceService;

    @Override
    public City queryById(Long id) {
        City city = super.queryById(id);
        if (city != null) {
            if (city.getProvinceId() != null) {
                Province province = provinceService.queryById(city.getProvinceId());
                if (province != null) {
                    city.setProvinceName(province.getName());
                } else {
                    city.setProvinceName(null);
                }
            }
        }
        return city;
    }
    public Page<City> query(Map<String, Object> params) {
        Page<City> pageInfo = super.query(params);
        for (City city : pageInfo.getRecords()) {
            if (city.getProvinceId() != null) {
                Province province = provinceService.queryById(city.getProvinceId());
                if (province != null) {
                    city.setProvinceName(province.getName());
                } else {
                    city.setProvinceName(null);
                }
            }
        }
        return pageInfo;
    }
}