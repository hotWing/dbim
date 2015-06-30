package com.daimao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.daimao.dao.ManufacturerDao;
import com.daimao.model.Manufacturer;
import com.daimao.service.ManufacturerService;

@Service
public class ManufacturerServiceImpl implements ManufacturerService{
	
	private ManufacturerDao manufacturerDao;
	
	 @Resource
	 public void setManufacturerDao(ManufacturerDao manufacturerDao) {
		 this.manufacturerDao = manufacturerDao;
	 }

	@Override
	public List<Manufacturer> getManufactures() {
		return manufacturerDao.getManufactures();
	}

	@Override
	public void addManufacturer(String manufacturerId, String manufacturer,
			String country, String tel, String intro) {
		manufacturerDao.addManufacturer(manufacturerId, manufacturer,
				country, tel, intro);
	}
	 



}
