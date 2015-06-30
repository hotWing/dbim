package com.daimao.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daimao.service.UserService;

@Controller
@RequestMapping("/usercenter")
public class UserCenter {
	
	private UserService userService;
	
	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public String login(String username, String password, HttpSession session, Model model){
		boolean isUser = userService.checkUser(username,password);
		if (isUser) {
			session.setAttribute("username", username);
			session.setAttribute("password", password);
			return "sucess";
		}
		else {
			return "fail";
		}
	}
	
	@RequestMapping(value="/logout")
	@ResponseBody
	public String logout(HttpSession session){
		session.removeAttribute("username");
		session.removeAttribute("password");
		return "sucess";
	}
}
