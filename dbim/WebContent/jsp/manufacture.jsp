<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	<nav class="navbar navbar-inverse" style="margin-bottom:0px">
    		<div class="container">
    			<div class="navbar-header">
			    	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
			        	<span class="sr-only">Toggle navigation</span>
			        	<span class="icon-bar"></span>
			        	<span class="icon-bar"></span>
			        	<span class="icon-bar"></span>
			    	</button>
			    	<a class="navbar-brand">系统管理</a>
			    </div>
			    
			    <div class="collapse navbar-collapse" id="navbar-collapse">
			      <ul class="nav navbar-nav">
			        <li><a href="${request.getContextPath()}/dbim/servicecenter/admincenter/products/page/1">产品库管理</a></li>
			        <li  class="active"><a href="${request.getContextPath()}/dbim/servicecenter/admincenter/manufacturers/">供应商管理</a></li>
			      </ul>
			   
			      <ul class="nav navbar-nav navbar-right">
				      <c:choose>  
						   <c:when test="${empty username}">
						   		<li><a href="#" data-toggle="modal" data-target="#loginModal">登录</a></li>
						   </c:when>  
						   <c:otherwise>   
						   		<li><a>${username}</a></li>
						   		<li><a id="logoutBt" href="#">退出</a></li>
						   </c:otherwise>  
					  </c:choose>
			      </ul>
			    </div>
    		</div>
    	</nav>
    	<div class="container text-right button-group">
    		<button id="addBt" type="button" class="btn btn-primary" data-toggle="modal" data-target="#addModal">添加</button>
    	</div>
    	<div class="container">
    		<table class="table table-striped">
    			<thead>
    				<th>供应商ID</th>
    				<th>供应商</th>
    				<th>国家</th>
    				<th>电话</th>
    			</thead>
    			<tbody>
	    			<c:forEach items="${manufactures}" var="manufacture" varStatus="status" >  
						<tr>
							<td>${manufacture.id}</td>
			            	<td>${manufacture.name}</td>
			            	<td>${manufacture.country}</td>
		            		<td>${manufacture.tel}</td>
						</tr>
					</c:forEach> 
    			</tbody>
			</table>
    	</div>
		
		<!-- add Modal -->
		<div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">添加</h4>
		      </div>
		      <div class="modal-body">
		        <form id="addForm" method="post" action="/dbim/servicecenter/admincenter/addManufacturer">
		          <div class="form-group">
                    <label for="manufacturerId">供应商ID</label>
                    <input type="text" class="form-control" id="manufacturerId" name="manufacturerId" >
                  </div>
                  <div class="form-group">
                    <label for="manufacturer">供应商</label>
                    <input type="text" class="form-control" id="manufacturer" name="manufacturer" >
                  </div>
                  <div class="form-group">
                    <label for="country">国家</label>
                    <input type="text" class="form-control" id="country" name="country" >
                  </div>
                  
                  <div class="form-group">
                    <label for="tel">联系电话</label>
                    <input type="text" class="form-control" id="tel" name="tel" >
                  </div>
                  
                  <div class="form-group">
                    <label for="intro">简介</label>
                    <textarea class="form-control" rows="3" id="intro" name="intro"></textarea>
                  </div>
                  
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button id="formSubmitBt" type="button" class="btn btn-primary">提交</button>
		      </div>
		    </div>
		  </div>
		</div>
		
    	<!-- Login Modal -->
		<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">登录</h4>
		      </div>
		      <div class="modal-body">
		        <form>
		          <div class="form-group">
                    <label for="username">用户名</label>
                    <input type="text" class="form-control" id="username" name="username" >
                  </div>
                  <div class="form-group">
                    <label for="username">密码</label>
                    <input type="password" class="form-control" id="password" name="password">
                  </div>
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button id="submitBt" type="button" class="btn btn-primary">提交</button>
		      </div>
		    </div>
		  </div>
		</div>
</body>
	<script src="${request.getContextPath()}/dbim/js/jquery-1.11.1.min.js"></script>
	<script src="${request.getContextPath()}/dbim/js/bootstrap.min.js"></script>
	<script src="${request.getContextPath()}/dbim/js/bootstrap-paginator.min.js"></script>
	<script>
	    $(document).ready(function(){
	   		var baseUrl = "${pageContext.request.contextPath}"
	   		
	    	$("#submitBt").click(function(){
	    		var username = $("#username").val()
	    		var password = $("#password").val()
				
	    		$.ajax({
	    	        url: baseUrl + "/servicecenter/usercenter/login",
	    	        type: "post",
	    	       
	    	        data:  {username: username,
	    	        		password: password},
	    	        		
	    	        dataType: 'text',		
	    	        success: function(msg,textStatus){
	    	        			if("sucess"==msg) {
	    	        				alert("登录成功");
	    	        				location.reload();
	    	        			}
	    	        			else 
	    	        				alert("用户名或密码错误");
	    	        				
	    		        	},
	            	error: function(XMLHttpRequest, error, errorThrown){  
	    	        		  alert(error);  
	    	        		  alert(errorThrown);  
	        		  },  
	    	    });
	    	})
	    	
	    	$("#logoutBt").click(function(){
	    		$.ajax({
	    	        url: baseUrl + "/servicecenter/usercenter/logout",
	    	        dataType: 'text',		
	    	        success: function(msg,textStatus){
	   	        				alert("登出成功");
	   	        				location.reload();
	    		        	},
	            	error: function(XMLHttpRequest, error, errorThrown){  
	    	        		  alert(error);  
	    	        		  alert(errorThrown);  
	        		  },  
	    	    });
	    	})
	    	
	    	$("#addBt").click(function(){
		    		var username = "${username}";
		    		if (!username) {
		    			alert("请先登录");
		    			return false;
		    		}
		    	})
		    	
		    	
	    	$("#formSubmitBt").click(function(){
				
	    			$("#addForm").submit();
	    	})
	    	
// 	    	$('#thumb').bind('change', function() {
// 	    		var fileSize = this.files[0].size/1024/1024;
// 	    		if (fileSize>1) {
// 	    			alert("图片不能大于1mb");
// 	    			$('#thumb-wrapper').html($('#thumb-wrapper').html());
// 	    		}
// 	        });
	    })
   </script>
</html>