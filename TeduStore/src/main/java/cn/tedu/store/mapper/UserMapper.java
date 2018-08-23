package cn.tedu.store.mapper;

import cn.tedu.store.bean.User;
/*
 * 哪個工程中的類或接口
 * @author Mura
 * 開始時間 2018/7/30 AM11:30
 * */
public interface UserMapper {
	/*
	 * 插入一個用戶信息
	 * @param user
	 * */
	void insertUser(User user);
	/*
	 * 查詢一個用戶信息
	 * @return 如果查到了會把紀錄封裝成user對象返回
	 * 		         如果沒查到，返回null
	 * */
	User selectByName(String username);
	/*
	 * 根據Email查詢用戶訊息
	 * 如果存在，則返回行數:1
	 * 如果不存在，返回行數:0
	 * */
	Integer selectByEmail(String email);
	
	Integer selectByPhone(String email);
	/*
	 * 修改user對象的基本信息
	 * */
	void updateUser(User user);
	/*
	 * 根據id查詢用戶信息
	 * 
	 * @return如果有，返回當前紀錄封裝成user對象
	 * 			如果沒有，返回null
	 * */
	User selectById(Integer id);
	
}
