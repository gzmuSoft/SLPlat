package edu.gzmu.core;

import edu.gzmu.provider.IBizProvider;

import com.alibaba.dubbo.config.annotation.Service;
import com.weibo.api.motan.config.springsupport.annotation.MotanService;

import top.ibase4j.core.base.provider.BaseProviderImpl;

@Service(interfaceClass = IBizProvider.class)
@MotanService(interfaceClass = IBizProvider.class)
public class BizProviderImpl extends BaseProviderImpl implements IBizProvider {

}