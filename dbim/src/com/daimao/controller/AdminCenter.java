package com.daimao.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.daimao.service.ManufacturerService;
import com.daimao.service.ProductService;

@Controller
@RequestMapping("/admincenter")
public class AdminCenter {
	
	private ProductService productService;
	private ManufacturerService manufacturerService;
	
	@Resource
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	@Resource
	public void setManufacturerService(ManufacturerService manufacturerService) {
		this.manufacturerService = manufacturerService;
	}
	
	@RequestMapping(value="/products/page/{page}")
	public String getProducts(@PathVariable("page") int page, Model model){
		model.addAttribute("products", productService.getAllProducts(page));
		int count = productService.countProducts();
		double totalPage =  Math.ceil((float)count/ProductCenter.PAGE_SIZE);
		model.addAttribute("curPage", page);
		model.addAttribute("totalPage",totalPage==0 ? 1 : totalPage);
		return "/admin";
	}
	
	@RequestMapping(value="/manufacturers")
	public String getManufactures(Model model){
		model.addAttribute("manufactures", manufacturerService.getManufactures());
		return "jsp/manufacture";
	}
	
	@RequestMapping(value="/addManufacturer")
	public String addManufacturer(String manufacturerId, String manufacturer, String country,
			String tel, String intro){
		manufacturerService.addManufacturer(manufacturerId,  manufacturer, country,
				tel, intro);
		return "redirect:manufacturers";
	}
	
	@RequestMapping(value="/addProduct")
	public String addProduct(@RequestParam("thumb") MultipartFile thumbFile,@RequestParam("familyFile") MultipartFile familyFile,
			String productId, String productName, String familyType, String manufacturerId,String publishDate,
			HttpServletRequest request){
		
		String rootPath = request.getServletContext().getRealPath("/")+"/";
		String thumbFileName = null;
		String familyFileName = null;
		
		if (!thumbFile.isEmpty()&&!familyFile.isEmpty()) {
            try {
            	thumbFileName = new String(thumbFile.getOriginalFilename().getBytes("ISO-8859-1"), "utf-8");
        		familyFileName = new String(familyFile.getOriginalFilename().getBytes("ISO-8859-1"), "utf-8");
        		
            	String thumbFilePath = rootPath+"China/上传测试/"+thumbFileName;
        		String familyFilePath = rootPath+"China/上传测试/"+familyFileName;
        		
            	//上传族图片
                byte[] bytes = thumbFile.getBytes();
                BufferedOutputStream stream =new BufferedOutputStream(new FileOutputStream(new File(thumbFilePath)));
                stream.write(bytes);
                stream.close();
                
                //上传族文件
                
                bytes = familyFile.getBytes();
                stream =new BufferedOutputStream(new FileOutputStream(new File(familyFilePath)));
                stream.write(bytes);
                stream.close();
            } catch (Exception e) {
            }
            int index = thumbFileName.lastIndexOf('.');
            String thumbDir = "/China/上传测试/" + thumbFileName.substring(0, index);
            String downloadDir = "/China/上传测试/" + familyFileName;
            productService.addProduct(productId, productName, familyType, manufacturerId,publishDate,thumbDir,downloadDir);
        } else {
        }
		return "redirect:products/page/1";
	}
}
