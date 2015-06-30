package com.daimao.service;

import java.util.List;

import com.daimao.model.Manufacturer;

public interface ManufacturerService {
	public List<Manufacturer> getManufactures();

	public void addManufacturer(String manufacturerId, String manufacturer,
			String country, String tel, String intro);

}
