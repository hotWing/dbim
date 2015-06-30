package com.daimao.dao;

import java.util.List;

import com.daimao.model.Comment;
import com.daimao.model.Post;

public interface PostDao {
	public List<Post> getAllServices();

	public void addService(String title, String content, String price,
			String date, String author);

	public Post getService(int id);

	public List<Comment> getComments(int id);

	public void addComment(String serviceId, String content, String author,
			String date);

	public List<Post> getAllRequirements();

	public void addRequirement(String title, String content, String price,
			String date, String author);

	public Post getRequirement(int id);

	public void addRequirementComment(String requirementId, String content,
			String author, String date);

	public List<Comment> getRequirementComments(int id);

	public List<Post> getTopRequirements(int number);

	public List<Post> getTopServices(int number);
}
