package test;

import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.tedu.store.mapper.DictMapper;

public class TestDict {
	@Test
	public void testDistrict(){
		AbstractApplicationContext ac =
				new ClassPathXmlApplicationContext("application-dao.xml");
		
		DictMapper dm =
				ac.getBean("dictMapper",DictMapper.class);
		
		System.out.println(dm.selectByProvinceCode("130000"));
		System.out.println(dm.selectByCityCode("130100"));
		System.out.println(dm.selectByAreaCode("130102"));
	}
	
	
	@Test
	public void testSelectCity(){
		//1.獲取容器
				AbstractApplicationContext ac=
						new ClassPathXmlApplicationContext("application-dao.xml");
				//2.bean對象
				DictMapper dm =
						ac.getBean("dictMapper",DictMapper.class);
				System.out.println(dm.selectCity("130000"));
				
				ac.close();
	}
	
	@Test
	public void testSelectProvince(){
		//1.獲取容器
		AbstractApplicationContext ac=
				new ClassPathXmlApplicationContext("application-dao.xml");
		//2.bean對象
		DictMapper dm =
				ac.getBean("dictMapper",DictMapper.class);
		System.out.println(dm.selectProvince());
		
		ac.close();
	}
	

}
