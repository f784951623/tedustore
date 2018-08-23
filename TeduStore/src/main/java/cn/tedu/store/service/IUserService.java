package cn.tedu.store.service;

import cn.tedu.store.bean.User;
public interface IUserService {
	/*
	 * 添加用戶信息
	 * */
	 void addUser(User user);
	 /*
	  * 驗證信箱是否存在
	  * */
	 boolean checkEmail(String email);
	 boolean checkPhone(String phone);
	 boolean checkUsername(String username);
	 /*
	  * 實現用戶登錄
	  * @return如果成功 返回user對象
	  * 登錄不成功，拋出異常:帳號或密碼錯誤
	  * */
	 User login(String username,String password);
	 

	void changePassword(Integer id,String oldPwd,String newPwd);
	
	void updateUser(Integer id,String username,Integer gender,String email,String phone);

	User getUserById(Integer id);
}
