package cn.tedu.store.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.tedu.store.bean.Address;
import cn.tedu.store.bean.ResponseResult;
import cn.tedu.store.service.IAddressService;

@Controller
@RequestMapping("/address")
public class AddressController extends BaseController{
	@Resource
	IAddressService addressService;
	
	@RequestMapping("/setDefault.do")
	@ResponseBody
	public ResponseResult<Void> serDefault(HttpSession session,Integer id){
		ResponseResult<Void> rr =null;
		try{
			addressService.setDefault(this.getId(session), id);
			rr=new ResponseResult<Void>(1,"設置成功");
		}catch(RuntimeException e){
			rr=new ResponseResult<Void>(0,e.getMessage());
		}
		
		return rr;
	}
	
	
	
	
	@RequestMapping("/getByUid.do")
	@ResponseBody
	public ResponseResult<List<Address>> getBiUid(HttpSession session){
		//1.創建rr
		ResponseResult<List<Address>> rr = new ResponseResult<List<Address>>(1,"成功");
		//2.調用業務層方法:getByUid(this.getId(session));返回list
		List<Address> list = addressService.getByUid(this.getId(session));
		//3.把list設置到rr對象中
		rr.setData(list);
		
		return rr;
	}
	
	
	//異步請求，添增收貨人信息
	@RequestMapping("/addAddress.do")
	@ResponseBody
	public ResponseResult<Void> addAddress(
		    HttpSession session,
		    @RequestParam("receiverName") String recvName,
		    @RequestParam("receiverState") String recvProvince,
		    @RequestParam("receiverCity") String recvCity,
		    @RequestParam("receiverDistrict") String recvArea,
		    @RequestParam("receiverAddress") String recvAddress,
		    @RequestParam("receiverMobile") String recvPhone,
		    @RequestParam("receiverPhone") String recvTel,
		    @RequestParam("receiverZip") String recvZip,
		    @RequestParam("addressName") String recvTag){
		//1.創建rr對象		
		ResponseResult<Void> rr = new ResponseResult<Void>(1,"成功");
		//2.調用業務層方法
		Address address = 
				new Address();
		address.setUid(this.getId(session));
		address.setRecvName(recvName);
		address.setRecvProvince(recvProvince);
		address.setRecvCity(recvCity);
		address.setRecvArea(recvArea);
		address.setRecvAddress(recvAddress);
		address.setRecvPhone(recvPhone);
		address.setRecvTel(recvTel);
		address.setRecvZip(recvZip);
		address.setRecvTag(recvTag);
		addressService.addAddress(address);
		
		return rr;
		
	}
	//顯示地址管理頁面
	@RequestMapping("/showAddress.do")
	public String showAddress(){
		return "addressAdmin";
	}
	
	

}
