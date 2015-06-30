package com.daimao.dao.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.daimao.dao.UserDao;

@Repository
public class UserDaoImpl implements UserDao {

	private SqlSession sqlSession;

	@Resource
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public boolean checkUser(String username, String password) {
		Map<String, Object> parms = new HashMap<String, Object>();
		parms.put("username", username);
		parms.put("password", password);
		
		int i =  sqlSession.selectOne("com.mybatis.UserMapper.checkUser", parms);
		if (i == 0)
			return false;
		else 
			return true;
	}
}
