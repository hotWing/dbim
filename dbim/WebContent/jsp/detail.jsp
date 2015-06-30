<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
	<head>
    	<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    	<title>DBIM</title>
    	<link href="${request.getContextPath()}/dbim/css/bootstrap.min.css" rel="stylesheet">
    	<link href="${request.getContextPath()}/dbim/css/common.css" rel="stylesheet">
	</head>
	<body>
    	<nav class="navbar navbar-inverse">
    		<div class="container">
    			<div class="navbar-header">
<!-- 			    	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> -->
<!-- 			        	<span class="sr-only">Toggle navigation</span> -->
<!-- 			        	<span class="icon-bar"></span> -->
<!-- 			        	<span class="icon-bar"></span> -->
<!-- 			        	<span class="icon-bar"></span> -->
<!-- 			    	</button> -->
			    	<a class="navbar-brand">${product.name}</a>
			    </div>
    		</div>
    	</nav>
    	
    	<div class="container">
    		<div class="row">
    			<div class="col-md-6">
    				<img src="${request.getContextPath()}/dbim/${product.thumbDir}.jpg" style="width:440px; height:365px"/>
    			</div>
    			<div class="col-md-6" style="border:solid 1px;">
    				<h1>${product.name}</h1>
   					<table class="product-detail-table" border="0px" style="margin-top:40px">
					   <tr>
					    <td style="width:200px">品牌: </td>
					  <td>${product.manufacturer}</td>
					  </tr>
					  <tr>
					    <td style="width:200px">族类型: </td>
					    <td>${product.familyType}</td>
					  </tr>
					  <tr>
					    <td>长: </td>
					    <td>${product.length}</td>
					  </tr>
					  <tr>
					    <td>宽: </td>
					    <td>${product.width}</td>
					  </tr>
					  <tr>
					    <td>高: </td>
					    <td>${product.height}</td>
					  </tr>
					  <tr>
					    <td>发布日期: </td>
					    <td><fmt:formatDate value="${product.publishDate}" pattern="yyyy-MM-dd" /></td>
					  </tr>
					  <tr>
					    <td>版本号: </td>
					    <td>${product.edition}</td>
					  </tr>
					</table>
    			</div>
    		</div>
    		
    		<div class ="row" style="margin-top:50px">
    			<div class="col-md-8">
    				<div role="tabpanel">
					  <!-- Nav tabs -->
					  <ul class="nav nav-tabs" role="tablist">
					    <li role="presentation" class="active"><a href="#intro" aria-controls="intro" role="tab" data-toggle="tab">供应商简介</a></li>
					    <li role="presentation"><a href="#addr" aria-controls="addr" role="tab" data-toggle="tab">供应商地址</a></li>
					    <li role="presentation"><a href="#tel" aria-controls="tel" role="tab" data-toggle="tab">供应商电话</a></li>
					  </ul>
					
					  <!-- Tab panes -->
					  <div class="tab-content">
					    <div role="tabpanel" class="tab-pane active" id="intro">${manufacturer.intro}</div>
					    <div role="tabpanel" class="tab-pane" id="addr">${manufacturer.country} ${manufacturer.province} ${manufacturer.city}</div>
					    <div role="tabpanel" class="tab-pane" id="tel">${manufacturer.tel}</div>
					  </div>
					</div>
    			</div>
    			
    			<div class="col-md-4">
    				<a class="btn btn-primary" href="${request.getContextPath()}/dbim/${product.downloadDir}" >下载</a>
    				
    				<p style="margin-top:50px;margin-bottom:10px">想在Revit中直接下载使用此产品？</p>
    				<a class="btn btn-primary" href="${request.getContextPath()}/dbim/download/plugin/FamilyManager.rar" >下载Revit插件</a>
    			</div>
    		</div>
    	</div>
    	
    
	    <script src="${request.getContextPath()}/dbim/js/jquery-1.11.1.min.js"></script>
	    <script src="${request.getContextPath()}/dbim/js/bootstrap.min.js"></script>
	</body>
</html>