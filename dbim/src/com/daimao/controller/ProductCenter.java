package com.daimao.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daimao.model.Manufacturer;
import com.daimao.model.Product;
import com.daimao.service.ProductService;


@Controller
@RequestMapping("/productcenter")
public class ProductCenter {
	
	public static final int PAGE_SIZE = 30;
	private ProductService productService;
	
	@Resource
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	@RequestMapping(value="/products/page/{page}")
	public String manager(@PathVariable("page") int page,Model model){
		
		model.addAttribute("products", productService.getAllProducts(page));
		int count = productService.countProducts();
		double totalPage =  Math.ceil((float)count/PAGE_SIZE);
		model.addAttribute("curPage", page);
		model.addAttribute("totalPage",totalPage==0 ? 1 : totalPage);
		return "/jsp/list";
	}
	
	@RequestMapping(value="/getProduct/{id}")
	public String getProduct(@PathVariable("id") String id,Model model){
		try {
			String idUTF8 = new String(id.getBytes("ISO-8859-1"), "utf-8");
			Product product = productService.getProduct(idUTF8);
			model.addAttribute("product",product);
			
			Manufacturer manufacturer = productService.getManufacturer(product.getManufacturerID());
			model.addAttribute("manufacturer",manufacturer);
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "jsp/detail";
	}
	
	@RequestMapping(value="/cloud")
	public String popular(Model model){
		model.addAttribute("productsHighLight",productService.gethighlights());
		model.addAttribute("productsPopular",productService.getpopular());
		return "jsp/cloud";
	}
	
	@RequestMapping(value="/search")
	public String search(String key,String manufacturer,String familyType,String mainMaterial,String buildingType,String function,int page,Model model){
		model.addAttribute("products",productService.getProductsBySearch(key,manufacturer,familyType,mainMaterial,buildingType,function,page));
		model.addAttribute("key",key);
		model.addAttribute("manufacturer",manufacturer);
		model.addAttribute("familyType",familyType);
		model.addAttribute("mainMaterial",mainMaterial);
		model.addAttribute("buildingType",buildingType);
		model.addAttribute("function",function);
		
		List<Product> products = productService.getProductsBySearch(key, manufacturer, familyType, mainMaterial, buildingType, function, page);
		int count = productService.countProductsBySearch(key,manufacturer,familyType,mainMaterial,buildingType,function);
		double totalPage =  Math.ceil((float)count/PAGE_SIZE);
		model.addAttribute("products", products);

		model.addAttribute("curPage", page);
		model.addAttribute("totalPage", totalPage==0 ? 1 : totalPage);
		return "jsp/list";
	}
}
