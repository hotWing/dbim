package com.daimao.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.daimao.dao.PostDao;
import com.daimao.model.Comment;
import com.daimao.model.Post;

@Repository
public class PostDaoImpl implements PostDao {

	private SqlSession sqlSession;

	@Resource
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Post> getAllServices() {
		List<Post> services =  sqlSession.selectList("com.mybatis.PostMapper.getAllServices", null);
		return services;
	}

	@Override
	public void addService(String title, String content, String price,
			String date, String author) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("title", title);
		params.put("content", content);
		params.put("price", price);
		params.put("date", date);
		params.put("author", author);
		sqlSession.insert("com.mybatis.PostMapper.addService", params);
	}

	@Override
	public Post getService(int id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id",id);
		
		return sqlSession.selectOne("com.mybatis.PostMapper.getService", params);
	}

	@Override
	public List<Comment> getComments(int id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id",id);
		return sqlSession.selectList("com.mybatis.PostMapper.getComment", params);
	}

	@Override
	public void addComment(String serviceId, String content, String author,
			String date) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("serviceId", serviceId);
		params.put("content", content);
		params.put("date", date);
		params.put("author", author);
		sqlSession.insert("com.mybatis.PostMapper.addComment", params);
	}

	@Override
	public List<Post> getAllRequirements() {
		List<Post> requirements =  sqlSession.selectList("com.mybatis.PostMapper.getAllRequirements", null);
		return requirements;
	}

	@Override
	public void addRequirement(String title, String content, String price,
			String date, String author) {
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("title", title);
		params.put("content", content);
		params.put("price", price);
		params.put("date", date);
		params.put("author", author);
		sqlSession.insert("com.mybatis.PostMapper.addRequirement", params);
	}

	@Override
	public Post getRequirement(int id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id",id);
		
		return sqlSession.selectOne("com.mybatis.PostMapper.getRequirement", params);
	}

	@Override
	public void addRequirementComment(String requirementId, String content,
			String author, String date) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("requirementId", requirementId);
		params.put("content", content);
		params.put("date", date);
		params.put("author", author);
		sqlSession.insert("com.mybatis.PostMapper.addRequirementComment", params);
		
	}

	@Override
	public List<Comment> getRequirementComments(int id) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id",id);
		return sqlSession.selectList("com.mybatis.PostMapper.getRequirementComments", params);
	}

	@Override
	public List<Post> getTopRequirements(int number) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("limit", number);
		List<Post> topRequiements = sqlSession.selectList("com.mybatis.PostMapper.getTopRequirements", params);
		return topRequiements;
	}

	@Override
	public List<Post> getTopServices(int number) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("limit", number);
		List<Post> topServices = sqlSession.selectList("com.mybatis.PostMapper.getTopServices", params);
		return topServices;
	}
}
