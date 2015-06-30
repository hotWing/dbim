package com.daimao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.daimao.controller.ProductCenter;
import com.daimao.dao.ProductDao;
import com.daimao.model.Manufacturer;
import com.daimao.model.Product;
import com.daimao.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService{
	
	private ProductDao productDao;
	
	 @Resource
	 public void setProductDao(ProductDao productDao) {
		 this.productDao = productDao;
	 }
	 
	@Override
	public List<Product> getAllProducts(int page) {
		int startRow = (Integer.valueOf(page) - 1 )* ProductCenter.PAGE_SIZE;
		return productDao.getAllProducts(startRow,ProductCenter.PAGE_SIZE);
	}

	@Override
	public Product getProduct(String id) {
		return productDao.getProduct(id);
	}

	@Override
	public Manufacturer getManufacturer(String manufacturerID) {
		return productDao.getManufacturer(manufacturerID);
	}

	@Override
	public int countProducts() {
		return productDao.countProducts();
	}

	@Override
	public List<Product> gethighlights() {
		return productDao.gethighlights();
	}

	@Override
	public List<Product> getpopular() {
		return productDao.getpopular();
	}

	@Override
	public List<Product> getProductsBySearch(String key, String manufacturer,
			String familyType, String mainMaterial, String buildingType,
			String function,int page) {
		int startRow = (Integer.valueOf(page)- 1) * ProductCenter.PAGE_SIZE;
		return productDao.getProductsBySearch(key,manufacturer,familyType,mainMaterial,buildingType,function,startRow,ProductCenter.PAGE_SIZE);
	}

	@Override
	public int countProductsBySearch(String key, String manufacturer,
			String familyType, String mainMaterial, String buildingType,
			String function) {
		return productDao.countProductsBySearch(key,manufacturer,familyType,mainMaterial,buildingType,function);
	}

	@Override
	public void addProduct(String productId, String productName,
			String familyType, String manufacturerId, String publishDate,
			String thumbDir, String downloadDir) {
		productDao.addProduct(productId, productName,
				familyType, manufacturerId, publishDate,
				thumbDir, downloadDir);
	}



}
