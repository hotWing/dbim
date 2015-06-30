package com.daimao.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.daimao.service.PostService;

@Controller
@RequestMapping("/postcenter")
public class PostCenter {
	
	private PostService postService;
	
	@Resource
	public void setPostService(PostService postService) {
		this.postService = postService;
	}
	
	
	@RequestMapping(value="/index")
	public String getTopServicesAndRequirements(Model model){
		
		model.addAttribute("topServices", postService.getTopServices(5));
		model.addAttribute("topRequirements", postService.getTopRequirements(5));
		return "index";
	}
	
	@RequestMapping(value="/bimservice")
	public String getServices(Model model){
		
		model.addAttribute("bimservices", postService.getAllServices());
		return "jsp/service";
	}
	
	@RequestMapping(value="/bimrequirement")
	public String getRequirement(Model model){
		
		model.addAttribute("bimrequirements", postService.getAllRequirements());
		return "jsp/requirement";
	}
	
	@RequestMapping(value="/addService")
	@ResponseBody
	public String addService(String title, String content, String price, String date, String author){
		
		postService.addService(title, content, price, date, author);
		
		return "success";
	}
	
	@RequestMapping(value="/addRequirement")
	@ResponseBody
	public String addRequirement(String title, String content, String price, String date, String author){
		
		postService.addRequirement(title, content, price, date, author);
		
		return "success";
	}
	
	@RequestMapping(value="/getService/{id}")
	public String getService(@PathVariable("id") int id,Model model){
		model.addAttribute("service", postService.getService(id));
		model.addAttribute("comments", postService.getComments(id));
		return "jsp/serviceDetail";
	}
	
	@RequestMapping(value="/getRequirement/{id}")
	public String getRequirement(@PathVariable("id") int id,Model model){
		model.addAttribute("requirement", postService.getRequirement(id));
		model.addAttribute("comments", postService.getRequirementComments(id));
		return "jsp/requirementDetail";
	}
	
	@RequestMapping(value="/addComment")
	@ResponseBody
	public String addComment(String serviceId, String content, String author, String date){
		postService.addComment(serviceId, content, author, date);
		return "success";
	}
	
	@RequestMapping(value="/addRequirementComment")
	@ResponseBody
	public String addRequirementComment(String requirementId, String content, String author, String date){
		postService.addRequirementComment(requirementId, content, author, date);
		return "success";
	}
	
	
}
