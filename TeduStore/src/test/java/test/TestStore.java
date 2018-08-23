package test;

import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.tedu.store.bean.User;
import cn.tedu.store.mapper.UserMapper;
import cn.tedu.store.service.IUserService;
import cn.tedu.store.service.UserService;

public class TestStore {
			//1.測試方法的返回類型為void類
			//2.測試方法的訪問修飾符為public
			//3.測試方法的參數類表為空
	@Test
	public void testUpdate1(){
		//1.創建容器
				AbstractApplicationContext ac=
						new ClassPathXmlApplicationContext(
								"application-dao.xml","application-service.xml");
				//2.獲取bean對象
				IUserService ius=ac.getBean("userService",IUserService.class);
				//3.調用方法
				ius.updateUser(2, "admin2", 1, "email2@bb.com", "0229521558");
				//4.關閉
				ac.close();
	}
	
	@Test
	public void testInsertUser(){

		//1.獲取spring容器
		AbstractApplicationContext ac=
				new ClassPathXmlApplicationContext("application-dao.xml");
		//2.獲取bean對象
		UserMapper userMapper =
				ac.getBean("userMapper",UserMapper.class);
		//3.調用方法
		User user = new User();
		user.setUsername("admin1");
		user.setPassword("admin");
		user.setEmail("email.com");
		user.setPhone("0987999999");
		userMapper.insertUser(user);
		//4.關閉容器
		ac.close();
	}
	@Test
	public void testSelectByName(){
			//1.獲取spring容器
		AbstractApplicationContext ac = 
				new ClassPathXmlApplicationContext("application-dao.xml");
			//2.獲取bean對象
		UserMapper userMapper =
				ac.getBean("userMapper",UserMapper.class);
			//3.調用方法
		System.out.println(
				userMapper.selectByName("admin1"));
			//4.關閉容器
		ac.close();
	}
	@Test
	public void testAddUser(){
		//1.獲取spring容器
		AbstractApplicationContext ac=
				new ClassPathXmlApplicationContext("application-dao.xml","application-service.xml");
		//2.獲取bean對象
		IUserService us = 
				ac.getBean("userService",IUserService.class);
		//3.調用方法
		User user = new User();
		user.setUsername("admin2");
		user.setPassword("123456");
		user.setEmail("emlia.com");
		user.setPhone("098888");
		us.addUser(user);
		//4.關閉容器
		ac.close();
	}
	@Test
	public void testSelectByEmail(){
		//1.獲得spring容器
		AbstractApplicationContext ac=
				new ClassPathXmlApplicationContext("application-dao.xml","application-service.xml");
		//2.獲取bean對象
		UserMapper um= ac.getBean("userMapper",UserMapper.class);
		
		//3.調用方法
		System.out.println(um.selectByEmail("e1mail.com"));
		//4.關閉
		ac.close();
	}
	@Test
	public void testSelectByPhone(){
		//1.獲得spring容器
				AbstractApplicationContext ac=
						new ClassPathXmlApplicationContext("application-dao.xml","application-service.xml");
				//2.獲取bean對象
				UserMapper um= ac.getBean("userMapper",UserMapper.class);
				
				//3.調用方法
				System.out.println(um.selectByPhone("098888"));
				//4.關閉
				ac.close();
	}
	@Test
	public void testCheckEmail(){
		//1.創建容器
		AbstractApplicationContext ac =
				new ClassPathXmlApplicationContext("application-dao.xml","application-service.xml");
		//2.獲取bean
		IUserService us= ac.getBean("userService",IUserService.class);
		//3.調用方法
		System.out.println(us.checkEmail("email.com"));
		//4.關閉
		ac.close();
	}
	@Test
	public void testCheckPhone(){
		//1.創建容器
		AbstractApplicationContext ac =
				new ClassPathXmlApplicationContext("application-dao.xml","application-service.xml");
		//2.獲取bean
		IUserService us= ac.getBean("userService",IUserService.class);
		//3.調用方法
		System.out.println(us.checkPhone("098888"));
		//4.關閉
		ac.close();
	}
	@Test
	public void testCheckName(){
		//1.創建容器
		AbstractApplicationContext ac =
				new ClassPathXmlApplicationContext("application-dao.xml","application-service.xml");
		//2.獲取bean
		IUserService us= ac.getBean("userService",IUserService.class);
		//3.調用方法
		System.out.println(us.checkUsername("admin"));
		//4.關閉
		ac.close();
	}
	@Test
	public void testUpdate(){
		//1.創建容器
		AbstractApplicationContext ac=
				new ClassPathXmlApplicationContext(
						"application-dao.xml","application-service.xml");
		//2.獲取bean對象
		UserMapper um=ac.getBean("userMapper",UserMapper.class);
		//3.調用方法
		User user = new User();
		user.setPassword("123456");
		user.setUsername("admin3");
		user.setEmail("email3@aa.com");
		user.setId(9);
		um.updateUser(user);
		//4.關閉
		ac.close();
	}
	@Test
	public void testSelectUserById(){
		//1.獲得spring容器
		AbstractApplicationContext ac=
				new ClassPathXmlApplicationContext("application-dao.xml","application-service.xml");
		//2.獲取bean對象
		UserMapper um= ac.getBean("userMapper",UserMapper.class);
		
		//3.調用方法
		System.out.println(um.selectById(8));
		
		//4.關閉
		ac.close();
	}
	@Test
	public void testChangePassword(){
		AbstractApplicationContext ac =
				new ClassPathXmlApplicationContext("application-dao.xml","application-service.xml");
		//2.獲取bean
		IUserService us= ac.getBean("userService",IUserService.class);
		//3.調用方法
		
		us.changePassword(2,"123456","654321");
		//4.關閉
		ac.close();
	}
}
