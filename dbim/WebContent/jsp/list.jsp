<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
			        <li><a href="${request.getContextPath()}/dbim/servicecenter/postcenter/bimrequirement">需求</a></li>
			        <li class="active"><a href="${request.getContextPath()}/dbim/servicecenter/productcenter/cloud">云族库</a></li>
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
    	
    	<div class="container">
			<form  class="form-inline" role="search">
				<div class="form-group">
					<input id="key" type="text" class="form-control" placeholder="搜索词" value="${key}">
					<div class="btn-group"> <a id="manufacturer-selection" class="btn btn-default dropdown-toggle btn-select" data-toggle="dropdown" href="#">选择品牌<span class="caret"></span></a>
			            <ul class="dropdown-menu">
			                <li><a href="#">肇庆亚洲铝厂有限公司</a></li>
			                <li><a href="#">华为技术有限公司</a></li>
			                <li><a href="#">LAMILUX</a></li>
			                <li><a href="#">必盛</a></li>
			                <li><a href="#">圣戈班玻璃</a></li>
			            </ul>
			        </div>
				</div>
				<div id="searchBt" class="btn btn-default">提交</div>
			</form>
		</div>
		
		<div class="container">
			<c:forEach items="${products}" var="product" varStatus="status" >  
				<div class="product-item col-sm-4 col-md-2" >
					<div class="thumbnail">
						<img src="${request.getContextPath()}/dbim/${product.thumbDir}.jpg" style="width:170px;height:190;"/>
						<a href="${request.getContextPath()}/dbim/servicecenter/productcenter/getProduct/${product.id}">
							<input type="button" value="${product.name}"></input>
						</a>	
    				</div>
				</div>
			</c:forEach> 
			
		</div>
		<div class="container">
			<ul id="pagination" style="float:right"></ul> 
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
	    <script src="${request.getContextPath()}/dbim/js/bootstrap-paginator.min.js"></script>
	    <script type='text/javascript'>
	    $(document).ready(function(){
	    	var baseUrl = "${pageContext.request.contextPath}"
	        var options = {
        		bootstrapMajorVersion:3,
	            currentPage: "${curPage}",
	            totalPages: "${totalPage}",
	            pageUrl: function(type, page, current){
	                return baseUrl+"/servicecenter/productcenter/search?key="+$("#key").val() + "&manufacturer=" + $("#manufacturer-selection").text() + "&page=" + page;
	            }
	        }
	
	        $('#pagination').bootstrapPaginator(options);
	    	
	    	$(".dropdown-menu li a").click(function(){
				var selText = $(this).text();
				$(this).parents('.btn-group').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
    		});
	    	
	    	$("#searchBt").click(function(){
	    		var key = $("#key").val();
	    		var manufacturer =  $("#manufacturer-selection").text();
 	    		location.href = baseUrl+"/servicecenter/productcenter/search?key="+key + "&manufacturer=" +manufacturer + "&page=1";
    		});
	    		
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
		    	
		    })
		    
		    
		    
	    </script>
	</body>
</html>