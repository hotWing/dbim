package com.daimao.dao;

import java.util.List;

import com.daimao.model.Manufacturer;

public interface ManufacturerDao {

	public List<Manufacturer> getManufactures();

	public void addManufacturer(String manufacturerId, String manufacturer,
			String country, String tel, String intro);
	
}
