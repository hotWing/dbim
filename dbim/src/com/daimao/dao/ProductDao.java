package com.daimao.dao;

import java.util.List;

import com.daimao.model.Manufacturer;
import com.daimao.model.Product;

public interface ProductDao {

	public List<Product> getAllProducts(int startRow, int pageSize);
	public int countProducts();
	public Product getProduct(String id);
	public Manufacturer getManufacturer(String manufacturerId);
	public List<Product> gethighlights();
	public List<Product> getpopular();
	public List<Product> getProductsBySearch(String key, String manufacturer,
			String familyType, String mainMaterial, String buildingType,
			String function,int startRow, int pageSize);
	public int countProductsBySearch(String key, String manufacturer,
			String familyType, String mainMaterial, String buildingType,
			String function);
	public void addProduct(String productId, String productName,
			String familyType, String manufacturerId, String publishDate,
			String thumbDir, String downloadDir);

}
