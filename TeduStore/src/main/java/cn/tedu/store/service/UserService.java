package cn.tedu.store.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tedu.store.bean.User;
import cn.tedu.store.mapper.UserMapper;
import cn.tedu.store.service.ex.PasswordNotMatchException;
import cn.tedu.store.service.ex.UserNotFoundException;
import cn.tedu.store.service.ex.UsernameAleradyException;
@Service
public class UserService implements IUserService{
	@Resource
	private UserMapper userMapper;
	public void addUser(User user) {
		//1.調用持久層方法selectByname
		//返回user對象
		User user1=	
				userMapper.selectByName(
						user.getUsername());
		//2.如果user1==null
		//調用insertUser方法
		if(user1==null){
			userMapper.insertUser(user);
		}else{
		//3.如果user1!=null,拋出異常 
			throw new UsernameAleradyException("用戶名重複");
		}
	}
	public boolean checkEmail(String email) {
		/*Integer n =
				userMapper.selectByEmail(email);
		if(n>0){
			return true;
		}else{
			return false;
		}*/
		return userMapper.selectByEmail(email)>0;
	}
	public boolean checkPhone(String phone) {
		
		return userMapper.selectByPhone(phone)>0;
	}
	public boolean checkUsername(String username) {
		return userMapper.selectByName(username)!=null;
	}
	public User login(String username, String password) {
		//1.调用持久层的方法：selectByUsername(username);返回user对象
				User user= 
					userMapper.selectByName(username);
				if(user==null){
					//3.抛出异常UserNotFoundException("账号不存在");
					throw new UserNotFoundException("帳號不存在");
				}else{
					//4.从user对象中取出密码和参数的password比较
					if(user.getPassword().equals(password)){
					//5.return user;
						return user;
					}else{
						//6.抛出异常PasswordNotMatchException("密码错误")
						throw new PasswordNotMatchException("密碼錯誤");
					}
				}
	}
	public void changePassword(Integer id, String oldPwd, String newPwd) {
		//1.調用，返回user對象
		User user =
				userMapper.selectById(id);
		//2.判斷user是否為null,
			//如果為null，表示沒有該用戶
			//如果不為null，表示用戶存在
		if(user!=null){
			//判斷密碼正確
			//如果正確，那修改密碼
			//否則拋異常
			if(user.getPassword().equals(oldPwd)){
				User user1= new User();
				user1.setId(id);
				user1.setPassword(newPwd);
				userMapper.updateUser(user1);
			}else{
				throw new PasswordNotMatchException("舊密碼不匹配");
			}
		}else{
			//拋出異常
			throw new UserNotFoundException(
					"用戶不存在");
		}
	}
	public void updateUser(Integer id, String username, Integer gender, String email, String phone) {
		//1.調用持久層法:selectById(id);返回user1對象
		User user1=userMapper.selectById(id);
		if(user1!=null){
		//2.調用持久層方法:selectByName(username);返回user2對象
			User user2=userMapper.selectByName(username);
			//如果用戶名和登錄的用戶名名稱相同，可以實現修改
			if(user2!=null&&!user1.getUsername().equals(username)){
				//拋出異常usernameAlreadyEX("用戶名存在")
				throw new UsernameAleradyException("用戶名已存在");
			}else{
				User user = new User();
				//調用持久層方法update(user);
				user.setId(id);
				user.setUsername(username);
				user.setGender(gender);
				user.setEmail(email);
				user.setPhone(phone);
				
				userMapper.updateUser(user);
			}
		}else{
			throw new UserNotFoundException("用戶不存在");
		}
	}
	public User getUserById(Integer id) {
		
		return userMapper.selectById(id);
	}
	
	
}
