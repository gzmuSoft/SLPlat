package edu.gzmu;

import com.alibaba.fastjson.JSON;
import junit.framework.TestCase;
import edu.gzmu.service.SysUserService;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import top.ibase4j.core.util.InstanceUtil;

import java.util.Map;

public class SysUserTest extends TestCase {
	SysUserService sysUserService;

	@SuppressWarnings("resource")
	protected void setUp() throws Exception {
		super.setUp();
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext(
				new String[] { "Spring-config.xml" });
		sysUserService = context.getBean(SysUserService.class);
	}

	public void testAuery() {
		Map<String, Object> params = InstanceUtil.newHashMap();
		System.out.println(JSON.toJSONString(sysUserService.query(params)));
	}
}
