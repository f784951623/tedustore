package cn.tedu.store.service;

import java.util.List;

import cn.tedu.store.bean.Address;

public interface IAddressService {
	void addAddress(Address address);
	//獲取收貨人地址
	List<Address> getByUid(Integer uid);
	
	//設為默認
	void setDefault(Integer uid,Integer id);
	
	
}
