package com.daimao.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.daimao.dao.UserDao;
import com.daimao.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	private UserDao userDao;
	
	 @Resource
	 public void setUserDao(UserDao userDao) {
		 this.userDao = userDao;
	 }
	
	@Override
	public boolean checkUser(String username, String password) {
		return userDao.checkUser(username,password);
	}
}
