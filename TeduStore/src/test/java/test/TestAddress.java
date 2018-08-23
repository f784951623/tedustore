package test;

import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.tedu.store.bean.Address;
import cn.tedu.store.mapper.AddressMapper;
import cn.tedu.store.service.IAddressService;

public class TestAddress {
	
	@Test
	public void testDefault(){
		AbstractApplicationContext ac = 
				new ClassPathXmlApplicationContext("application-dao.xml","application-service.xml");
		IAddressService as =
				ac.getBean("addressService",IAddressService.class);
		
		as.setDefault(2, 2);
		ac.close();
	}
	
	
	@Test
	public void testUpdate(){
		AbstractApplicationContext ac = 
				new ClassPathXmlApplicationContext("application-dao.xml","application-service.xml");
		AddressMapper am =
				ac.getBean("addressMapper",AddressMapper.class);
		System.out.println(am.updateByUid(2));
		System.out.println(am.updateById(2));
	
		ac.close();
	}
	
	
	@Test
	public void testAddAddress(){
		AbstractApplicationContext ac=
				new ClassPathXmlApplicationContext("application-dao.xml","application-service.xml");
		
		IAddressService ia = ac.getBean("addressService",IAddressService.class);
		
		Address address = new Address();
		address.setUid(2);
		address.setRecvName("老一");
		address.setRecvProvince("130000");
		address.setRecvCity("130100");
		address.setRecvArea("130102");
		address.setRecvAddress("中山北路");
		address.setRecvPhone("0800111235");
		address.setRecvTag("公司");
		ia.addAddress(address);
		
		ac.close();
	}
	
	
	@Test
	public void testSelectByUid(){
			AbstractApplicationContext ac =
					new ClassPathXmlApplicationContext("application-dao.xml");
			AddressMapper am=
					ac.getBean("addressMapper",AddressMapper.class);
			
			System.out.println(am.selectByUid(2));
			
			ac.close();
	}
	
	
	@Test
	public void testInsertAddress(){
		AbstractApplicationContext ac =
				new ClassPathXmlApplicationContext("application-dao.xml");
		AddressMapper am=
				ac.getBean("addressMapper",AddressMapper.class);
		
		Address address = new Address();
		address.setUid(2);
		address.setRecvName("admin");
		address.setRecvProvince("130000");
		address.setRecvCity("130100");
		address.setRecvArea("130102");
		address.setRecvDistrict("河北省石家庄市長安區");
		address.setRecvAddress("中鼎7层");
		address.setRecvPhone("13800138000");
		address.setRecvTel("10086");
		address.setRecvZip("100000");
		address.setRecvTag("家");
		address.setIsDefault(1);
		am.insertAddress(address);
		ac.close();

	}
}
