package cn.tedu.store.service;

import java.util.List;

import cn.tedu.store.bean.Area;
import cn.tedu.store.bean.City;
import cn.tedu.store.bean.Province;

public interface IDictService {
	/*
	 * 獲取省份信息
	 * */
	List <Province> getProvince();
	
	/*
	 * 獲取城市信息
	 * */
	
	List <City> getCity(String provinceCode);

	//區/縣
	List <Area> getArea(String cityCode);
}
