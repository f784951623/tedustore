package cn.tedu.store.mapper;

import java.util.List;

import cn.tedu.store.bean.Address;

public interface AddressMapper {
	/**
	 * 插入收货人信息
	 * @param address
	 */
	void insertAddress(Address address);
	/**
	 * 查询用户的收货地址
	 * @param uid
	 * @return 返回list
	 */
	List<Address> selectByUid(Integer uid);
	
	Integer updateByUid(Integer uid);
	Integer updateById(Integer id);
}