package com.daimao.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.daimao.dao.ProductDao;
import com.daimao.model.Manufacturer;
import com.daimao.model.Product;

@Repository
public class ProductDaoImpl implements ProductDao {
	
	private SqlSession sqlSession;

	@Resource
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<Product> getAllProducts(int startRow, int pageSize){
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("startRow", startRow);
		params.put("pageSize", pageSize);
		
		List<Product> products =  sqlSession.selectList("com.mybatis.ProductMapper.getAllProducts", params);
		return products;
	}

	@Override
	public Product getProduct(String id) {
		Map<String, Object> parms = new HashMap<String, Object>();
		parms.put("id", id);
		
		Product product =  sqlSession.selectOne("com.mybatis.ProductMapper.getProduct", parms);
		return product;
	}

	@Override
	public Manufacturer getManufacturer(String manufacturerId) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", manufacturerId);
		Manufacturer m=  sqlSession.selectOne("com.mybatis.ProductMapper.getManufacturer", params);
		return m;
	}

	@Override
	public int countProducts() {
		return sqlSession.selectOne("com.mybatis.ProductMapper.countProducts", null);
	}
	
	@Override
	public List<Product> gethighlights() {
		List<Product> products =  sqlSession.selectList("com.mybatis.ProductMapper.getHighlights");
		return products;
	}

	@Override
	public List<Product> getpopular() {
		List<Product> products =  sqlSession.selectList("com.mybatis.ProductMapper.getPopular");
		return products;
	}

	@Override
	public List<Product> getProductsBySearch(String key, String manufacturer,
			String familyType, String mainMaterial, String buildingType,
			String function,int startRow, int pageSize) {
		
		Map<String, Object> parms = new HashMap<String, Object>();
		parms.put("key", key);
		parms.put("manufacturer", manufacturer);
		parms.put("familyType", familyType);
		parms.put("mainMaterial", mainMaterial);
		parms.put("buildingType", buildingType);
		parms.put("function", function);
		parms.put("startRow", startRow);
		parms.put("pageSize", pageSize);
		
		List<Product> products =  sqlSession.selectList("com.mybatis.ProductMapper.getProductsBySearch", parms);
		return products;
	}

	@Override
	public int countProductsBySearch(String key, String manufacturer,
			String familyType, String mainMaterial, String buildingType,
			String function) {
		
		Map<String, Object> parms = new HashMap<String, Object>();
		parms.put("key", key);
		parms.put("manufacturer", manufacturer);
		parms.put("familyType", familyType);
		parms.put("mainMaterial", mainMaterial);
		parms.put("buildingType", buildingType);
		parms.put("function", function);
		
		return sqlSession.selectOne("com.mybatis.ProductMapper.countProductsBySearch", parms);
	}

	@Override
	public void addProduct(String productId, String productName,
			String familyType, String manufacturerId, String publishDate,
			String thumbDir, String downloadDir) {
		Map<String, Object> parms = new HashMap<String, Object>();
		parms.put("id", productId);
		parms.put("name", productName);
		parms.put("familyType", familyType);
		parms.put("manufacturerID", manufacturerId);
		parms.put("publishDate", publishDate);
		parms.put("thumbDir", thumbDir);
		parms.put("downloadDir", downloadDir);
		
		sqlSession.selectOne("com.mybatis.ProductMapper.addProduct", parms);
	}
}
