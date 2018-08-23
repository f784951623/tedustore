package cn.tedu.store.mapper;

import java.util.List;

import cn.tedu.store.bean.Area;
import cn.tedu.store.bean.City;
import cn.tedu.store.bean.Province;

public interface DictMapper {
	/*
	 * 查詢所有省份信息
	 * */
	List<Province> selectProvince();
	
	/*
	 * 查詢所有城市信息
	 * */
	
	List<City> selectCity(String provinceCode);
	
	//查詢區/縣信息
	List<Area> selectArea(String cityCode);
	//查詢省的名稱
	String selectByProvinceCode(String provinceCode);
	//查詢城市的名稱
	String selectByCityCode(String cityCode);
	//查詢區縣的名稱
	String selectByAreaCode(String areaCode);
}
