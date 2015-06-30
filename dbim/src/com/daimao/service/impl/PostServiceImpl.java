package com.daimao.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.daimao.dao.PostDao;
import com.daimao.model.Comment;
import com.daimao.model.Post;
import com.daimao.service.PostService;

@Service
public class PostServiceImpl implements PostService {

	private PostDao postDao;
	
	 @Resource
	 public void setPostDao(PostDao postDao) {
		 this.postDao = postDao;
	 }
	 
	@Override
	public List<Post> getAllServices() {
		return postDao.getAllServices();
	}

	@Override
	public void addService(String title, String content, String price,
			String date, String author) {
		postDao.addService(title, content, price, date, author);
	}

	@Override
	public Post getService(int id) {
		return postDao.getService(id);
	}

	@Override
	public List<Comment> getComments(int id) {
		return postDao.getComments(id);
	}

	@Override
	public void addComment(String serviceId, String content, String author,
			String date) {
		postDao.addComment(serviceId, content, author, date);
	}

	@Override
	public List<Post> getAllRequirements() {
		return postDao.getAllRequirements();
	}

	@Override
	public void addRequirement(String title, String content, String price,
			String date, String author) {
		postDao.addRequirement(title, content, price, date, author);
	}

	@Override
	public Post getRequirement(int id) {
		return postDao.getRequirement(id);
	}

	@Override
	public void addRequirementComment(String requirementId, String content,
			String author, String date) {
		postDao.addRequirementComment(requirementId, content, author, date);
	}

	@Override
	public List<Comment> getRequirementComments(int id) {
		return postDao.getRequirementComments(id);
	}

	@Override
	public List<Post> getTopRequirements(int number) {
		return postDao.getTopRequirements(number);
	}

	@Override
	public List<Post> getTopServices(int number) {
		return postDao.getTopServices(number);
	}


}
