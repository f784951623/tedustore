package cn.tedu.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
@RequestMapping("main")
public class MainController {
	//顯示首頁
	@RequestMapping("/showIndex.do")
	public String showIndex(){
		return "index";
	}
}
