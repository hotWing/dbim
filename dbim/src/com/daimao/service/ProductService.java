package com.daimao.service;

import java.util.List;

import com.daimao.model.Manufacturer;
import com.daimao.model.Product;

public interface ProductService {
	public List<Product> getAllProducts(int page);
	public int countProducts();
	public Product getProduct(String id);
	public Manufacturer getManufacturer(String manufacturerID);
	public List<Product> gethighlights();
	public List<Product> getpopular();
	public List<Product> getProductsBySearch(String key, String manufacturer,
			String familyType, String mainMaterial, String buildingType,
			String function,int page);
	public int countProductsBySearch(String key, String manufacturer,
			String familyType, String mainMaterial, String buildingType,
			String function);
	public void addProduct(String productId, String productName,
			String familyType, String manufacturerId, String publishDate,
			String thumbDir, String downloadDir);
}
