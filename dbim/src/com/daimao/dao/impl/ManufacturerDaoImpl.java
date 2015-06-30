package com.daimao.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.daimao.dao.ManufacturerDao;
import com.daimao.model.Manufacturer;

@Repository
public class ManufacturerDaoImpl implements ManufacturerDao {
	
	private SqlSession sqlSession;

	@Resource
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public List<Manufacturer> getManufactures() {
		
		List<Manufacturer> manufacturers =  sqlSession.selectList("com.mybatis.ManufacturerMapper.getManufacturers", null);
		return manufacturers;
	}

	@Override
	public void addManufacturer(String manufacturerId, String manufacturer,
			String country, String tel, String intro) {
		
		Map<String, Object> parms = new HashMap<String, Object>();
		parms.put("id", manufacturerId);
		parms.put("name", manufacturer);
		parms.put("country", country);
		parms.put("tel", tel);
		parms.put("intro", intro);
		
		sqlSession.selectOne("com.mybatis.ManufacturerMapper.addManufacturer", parms);
		
	}

	
}
