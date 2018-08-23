package cn.tedu.store.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{
	//在執行控制器方法之前執行
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		//1.獲取session對象，從session對象取出user
		HttpSession session=request.getSession();
		Object obj =session.getAttribute("user");
		//2.Object obj == null;說明沒登入過，那那麼跳轉到登入頁面(重定向)
		if(obj==null){
			String path = 
					request.getContextPath()+"/user/showLogin.do";
			response.sendRedirect(path);
			return false;
		}else{
			 return true;
		}
		//3.放行 return true
		
	}
	//控制方法執行之後，但是在響應頁面之前
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}
	//響應頁面之後
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
