package cn.tedu.store.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tedu.store.bean.ResponseResult;
import cn.tedu.store.bean.User;
import cn.tedu.store.service.UserService;
import cn.tedu.store.service.ex.PasswordNotMatchException;
import cn.tedu.store.service.ex.UserNotFoundException;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController{
	@Resource
	private UserService userService;
	//顯示註冊頁面
	@RequestMapping("/showPassword.do")
	public String showPassword(){
		return "personal_password";
	}
	@RequestMapping("/showRegist.do")
	public String showRegister(){
		return "register";
	}
	@RequestMapping("/showLogin.do")
	public String showLogin(){
		return "login";
	}
	//顯示個人信息
	@RequestMapping("/showPersonPage.do")
	public String showPersonPage(){
		return "personpage";
	}
	@RequestMapping("/checkEmail.do")
	@ResponseBody
	public ResponseResult<Void> checkEmail(String email){
		//1.聲明rr對象
		ResponseResult<Void> rr= null;
		//2.調用業務層方法
		boolean b =
				userService.checkEmail(email);
		if(b){
		//3.如果b為true
		//	3-1:創建rr對象，state:0 message:信箱不可以使用
			rr=new ResponseResult<Void>(0,"信箱不可使用");
		}else{
		//4.如果b為false
		//	4-2:創建rr對象，state:1 message:信箱可以使用
			rr=new ResponseResult<Void>(1,"信箱可以使用");
		}
		//5.返回rr
		return rr;
	}

	@RequestMapping("/checkUsername.do")
	@ResponseBody
	public ResponseResult<Void> checkUsername(String username){
		ResponseResult<Void> rr= null;
		//調用業務曾方法
		boolean b=
		userService.checkUsername(username);
		if(b){
			//若b為true:定義狀態碼狀態與信息
			rr= new ResponseResult<Void>(0,"用戶名不可使用");
		}else{
			//若b為false:定義狀態碼狀態與信息
			rr= new ResponseResult<Void>(1,"用戶名可使用");
		}
		return rr;
	}
	@RequestMapping("/checkPhone.do")
	@ResponseBody
	

	public ResponseResult<Void> checkPhone(String phone){
		//1.聲明rr對象
				ResponseResult<Void> rr= null;
				//2.調用業務層方法
				boolean b =
						userService.checkPhone(phone);
				if(b){
				//3.如果b為true
				//	3-1:創建rr對象，state:0 message:信箱不可以使用
					rr=new ResponseResult<Void>(0,"電話不可使用");
				}else{
				//4.如果b為false
				//	4-2:創建rr對象，state:1 message:信箱可以使用
					rr=new ResponseResult<Void>(1,"電話可以使用");
				}
				//5.返回rr
				return rr;
	}

	@RequestMapping("/register.do")
	@ResponseBody
	//提交註冊
	public ResponseResult<Void> register(
			@RequestParam("uname") String username,
			@RequestParam("upwd") String password,
			String email,String phone){
			//1.聲明rr對象
			ResponseResult<Void> rr = null;
			//2.
			try{
				User user = new User();
				user.setUsername(username);
				user.setPassword(password);
				user.setEmail(email);
				user.setPhone(phone);
				//調用業務層方法addUser(user)
				userService.addUser(user);
				//3.創建rr對象 state:1，message:添加數據成功
				rr= new ResponseResult<Void>(1,"添加數據成功");
			}catch(RuntimeException ex){
				//4.創建rr對象state:0，message:ex.getMessage()
				rr= new ResponseResult<Void>(0,ex.getMessage());
			}
			//5.返回rr
			return rr;
		}

	@RequestMapping("/login.do")
	@ResponseBody
	public ResponseResult<Void> login(String username,String password,HttpSession session) throws UserNotFoundException, PasswordNotMatchException{
		//1.聲明rr對象
		ResponseResult<Void> rr =null;
		try{
			//2.調用業務層方法:login();
			User user = userService.login(username, password);
			//3.rr設置state:1 message:登錄成功
			rr= new ResponseResult<Void>(1,"登錄成功");
			//4.把user對象綁訂到session
			session.setAttribute("user", user);
		}catch (RuntimeException e){
			rr=new ResponseResult<Void>(0,e.getMessage());
		}
		return rr;
	}
	//更改密碼
		@RequestMapping("/updatePassword.do")
		@ResponseBody
	public ResponseResult<Void> updatePassword(HttpSession session,String oldPwd,String newPwd){
			//1.聲明rr對象
			ResponseResult<Void> rr =null;
			try{
				//2.調用業務層方法changePassword(id,oldPwd,newPwd)
				userService.changePassword(this.getId(session), oldPwd, newPwd);
				//3.rr state:1 message:修改密碼成功
				rr=new ResponseResult<Void>(1,"修改密碼成功");
			}catch(RuntimeException e){
				//4.rr state:0 message:ex.getMessage()

				rr=new ResponseResult<Void>(0,e.getMessage());
			}
			return rr;
		}

		@RequestMapping("/updateUser.do")
		@ResponseBody
	public ResponseResult<Void> updateUser(HttpSession session,String username,Integer gender,String email,String phone){
		//1.聲明rr對象
		ResponseResult<Void> rr =null;
		try{
			//2.調用業務層方法updateUser
			userService.updateUser(this.getId(session), username, gender, email, phone);
			
			//3.rr state 1: message :"修改成功"
			rr= new ResponseResult<Void>(1,"修改");
			//把session中的user對象替換成修改後的對象
			session.setAttribute("user",
					userService.getUserById(this.getId(session)));
		}catch(RuntimeException e){
			//4.rr state:0 message:ex.getMessage()
			rr=new ResponseResult<Void>(0,e.getMessage());
		}
		return rr;
	}
		
	//退出
	@RequestMapping("/exit.do")
	public String exit(HttpSession session){
		session.invalidate();
		return "redirect:../main/showIndex.do";
	}

	
}
