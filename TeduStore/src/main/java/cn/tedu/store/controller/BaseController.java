package cn.tedu.store.controller;

import javax.servlet.http.HttpSession;

import cn.tedu.store.bean.User;

public class BaseController {
	//獲取用戶id值
	public Integer getId(HttpSession session){
		//從session中獲取user對象，再從user對象中獲取id
		Integer id=null;
		User user =(User)session.getAttribute("user");
		if(user!=null){
			id=user.getId();
		}
		return id;
	}
}
