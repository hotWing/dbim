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
			    	<a class="navbar-brand" href="${request.getContextPath()}/dbim/servicecenter/postcenter/index">DBIM</a>
			    </div>
			    
			    <div class="collapse navbar-collapse" id="navbar-collapse">
			      <ul class="nav navbar-nav">
			        <li><a href="${request.getContextPath()}/dbim/servicecenter/postcenter/bimservice">服务</a></li>
			        <li class="active"><a href="${request.getContextPath()}/dbim/servicecenter/postcenter/bimrequirement">需求</a></li>
			        <li><a href="${request.getContextPath()}/dbim/servicecenter/productcenter/cloud">云族库</a></li>
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
    		<button id="publishBt" type="button" class="btn btn-primary" data-toggle="modal" data-target="#publishModal">发布</button>
    	</div>
		<div class="container">
			<c:forEach items="${bimrequirements}" var="requirement" varStatus="status" >  
				<div class="post bg-info">
					<input id = "requirementId" value="${requirement.id}" style="display:none">
	    			<div class="row">
	    				<div class="col-sm-10">
	    					<h4>${requirement.title}</h4>
	    				</div>
	    				<div class="col-sm-2" >
	    					<h4>预算：${requirement.price}</h4>
	    				</div>
	    			</div>
	    			<div class="row">
		    			<div class="col-sm-6" >
		    				<fmt:formatDate value="${requirement.date}" pattern="yyyy-MM-dd HH:mm:ss" />
		    			</div>
		    			<div class="col-sm-offset-4 col-sm-2" >
		    				<p>${requirement.author}</p>
		    			</div>
	    			</div>
	    		</div>
			</c:forEach> 
		</div>
		
		<div id="bottom"></div>
		
		
		<!-- Publish Modal -->
		<div class="modal fade" id="publishModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">发布</h4>
		      </div>
		      <div class="modal-body">
		        <form>
		          <div class="form-group">
                    <label for="title">标题</label>
                    <input type="text" class="form-control" id="title" name="title" >
                  </div>
                  <div class="form-group">
                    <label for="content">内容</label>
                    <textarea class="form-control" rows="3" id="content" name="content"></textarea>

                  </div>
                  <div class="form-group">
                    <label for="price">预算</label>
                    <input type="text" class="form-control" id="price" name="price">
                  </div>
                  <div class="form-group">
                    <label for="date">日期</label>
                    <input type="text" class="form-control" id="date" name="date" value="<fmt:formatDate value="<%= new java.util.Date() %>" pattern="yyyy-MM-dd HH:mm:ss" />" disabled>
                  </div>
                  <div class="form-group">
                    <label for="author">用户名</label>
                    <input type="text" class="form-control" id="author" name="author" value="${username}" disabled>
                  </div>
                 
		        </form>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button id ="publishSubmitBt" type="button" class="btn btn-primary">提交</button>
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

	    <script src="${request.getContextPath()}/dbim/js/jquery-1.11.1.min.js"></script>
	    <script src="${request.getContextPath()}/dbim/js/bootstrap.min.js"></script>
	    
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
		    	
		    	$("#publishBt").click(function(){
		    		var username = "${username}";
		    		if (!username) {
		    			alert("请先登录");
		    			return false;
		    		}
		    	})
		    	
		    	$("#publishSubmitBt").click(function(){
		    		var title = $("#title").val();
		    		var content = $("#content").val();
		    		var price = $("#price").val();
		    		if(title==""||content==""||price=="")
		    			alert("请填写完整信息");
		    		else {
			    		$.ajax({
			    	        url: baseUrl + "/servicecenter/postcenter/addRequirement",
			    	        type: "post",
			    	       
			    	        data:  {title: title,
				    	        	content: content,
				    	        	price: price,
				    	        	date: $("#date").val(),
				    	        	author: $("#author").val(),},
			    	        		
			    	        dataType: 'text',		
			    	        success: function(msg,textStatus){
			    	        			if("success"==msg) {
			    	        				alert("发布成功");
			    	        				location.reload();
			    	        			}
			    	        			else 
			    	        				alert("发布失败");
			    	        				
			    		        	},
			            	error: function(XMLHttpRequest, error, errorThrown){  
			    	        		  alert(error);  
			    	        		  alert(errorThrown);  
			        		  },  
			    	    });
		    		}
		    	})
		    		
		    	$(".post").click(function(){
	    	        location.href = baseUrl + "/servicecenter/postcenter/getRequirement/"+$("#requirementId", this).val();
		    	})
		    })
	    </script>
	</body>
</html>