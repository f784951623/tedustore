package cn.tedu.store.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.tedu.store.bean.Address;
import cn.tedu.store.mapper.AddressMapper;
import cn.tedu.store.mapper.DictMapper;

@Service
public class AddressService implements IAddressService{
	@Resource
	private AddressMapper addressMapper;
	@Resource
	private DictMapper dictMapper;
	
	public void addAddress(Address address) {
		//1.給address對象的recvDistrict設置值
		//調用持久層的方法selectByProvinceCode
		
		address.setRecvDistrict(
				dictMapper.selectByProvinceCode(address.getRecvProvince())
			   +dictMapper.selectByCityCode(address.getRecvCity())
			   +dictMapper.selectByAreaCode(address.getRecvArea()));
		//2.給address對象的isDefault設置值
		Integer count = addressMapper.selectByUid(address.getUid()).size();
		if(count==0){
			address.setIsDefault(1);
		}else{
			address.setIsDefault(0);
		}
		
		addressMapper.insertAddress(address);
		
	}

	public List<Address> getByUid(Integer uid) {
		
		return addressMapper.selectByUid(uid);
	}

	public void setDefault(Integer uid, Integer id) {
		Integer n1 = 
				addressMapper.updateByUid(uid);
		if(n1==0){
			throw new RuntimeException("uid修改錯誤");
		}
		Integer n2 = 
				addressMapper.updateByUid(id);
		if(n2==0){
			throw new RuntimeException("id修改錯誤");
		}
		
	}



}
