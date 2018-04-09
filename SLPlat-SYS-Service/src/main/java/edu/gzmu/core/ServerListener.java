package edu.gzmu.core;

import com.weibo.api.motan.common.MotanConstants;
import com.weibo.api.motan.util.MotanSwitcherUtil;
import edu.gzmu.service.SysCacheService;
import edu.gzmu.service.SysDicService;
import edu.gzmu.service.SysUserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * @author ShenHuaJie
 * @since 2018年3月3日 下午7:28:29
 */
public class ServerListener implements ServletContextListener {
	protected final Logger logger = LogManager.getLogger();

	public void contextDestroyed(ServletContextEvent contextEvent) {
	}

	public void contextInitialized(ServletContextEvent contextEvent) {
		WebApplicationContext context = ContextLoader.getCurrentWebApplicationContext();
		context.getBean(SysCacheService.class).flush();
		context.getBean(SysUserService.class).init();
		context.getBean(SysDicService.class).getAllDic();
		MotanSwitcherUtil.setSwitcherValue(MotanConstants.REGISTRY_HEARTBEAT_SWITCHER, true);
		logger.info("=================================");
		logger.info("系统[{}]启动完成!!!", contextEvent.getServletContext().getServletContextName());
		logger.info("=================================");
	}
}