package cn.tedu.store.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tedu.store.bean.Area;
import cn.tedu.store.bean.City;
import cn.tedu.store.bean.Province;
import cn.tedu.store.bean.ResponseResult;
import cn.tedu.store.service.IDictService;

@Controller
@RequestMapping("/dict")
public class DictController {
	@Resource
	private IDictService dictService;
	
	//獲取區/縣信息
	@RequestMapping("/getArea.do")
	@ResponseBody
	public ResponseResult<List<Area>> getArea(String cityCode){
		//1.創建rr對象，state:1 message:成功
		ResponseResult<List<Area>> rr =
				new ResponseResult<List<Area>>(1,"成功");
		//2.調用業務層方法getProvince();返回list集合
		List<Area> list=dictService.getArea(cityCode);
		//3.把list添加到rr對象的data屬性中
		rr.setData(list);
		//4.return rr
		return rr;
	}
	//獲取城市信息
	@RequestMapping("/getCity.do")
	@ResponseBody
	public ResponseResult<List<City>> getCity(String provinceCode){
		//1.創建rr對象，state:1 message:成功
				ResponseResult<List<City>> rr =
						new ResponseResult<List<City>>(1,"成功");
				//2.調用業務層方法getProvince();返回list集合
				List<City> list=dictService.getCity(provinceCode);
				//3.把list添加到rr對象的data屬性中
				rr.setData(list);
				//4.return rr
				return rr;
	}
	
	//獲取省份信息
	@RequestMapping("/getProvince.do")
	@ResponseBody
 	public ResponseResult<List<Province>> getProvince(){
		//1.創建rr對象，state:1 message:成功
		ResponseResult<List<Province>> rr =
				new ResponseResult<List<Province>>(1,"成功");
		//2.調用業務層方法getProvince();返回list集合
		List<Province> list=dictService.getProvince();
		//3.把list添加到rr對象的data屬性中
		rr.setData(list);
		//4.return rr
		return rr;
	}


}
