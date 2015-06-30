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
    	
    	<img src="${request.getContextPath()}/dbim/img/top-bg.png" style="width:100%" >
    	
    	<div class="container intro">
    		<h3>如今的CAD符号被BIM模型所替代，BIM模型也可以像CAD符号一样以2d或3d的方式展示出你们的产品，但是它的功能远远不止这些。</h3>
    		<div class="col-md-4" >
				<div class="thumbnail">
					<img src="${request.getContextPath()}/dbim/img/product.png"/>
					<div class="caption text-center">
						<h3>真实的产品</h3>
						<h4>我们这里所有的BIM模型都是以真实的产品为基础。我们与产品生产商协同工作，为了创建与真实产品外形和数据都相近的数码产品。你可以从不同的分类和行业找到产品，但这些产品都是专门用于建筑信息模型的。</h4>
   					</div>
				</div>
			</div>
			
			<div class="col-md-4" >
				<div class="thumbnail">
					<img src="${request.getContextPath()}/dbim/img/model.png" />
					<div class="caption text-center">
						<h3>真实的模型</h3>
						<h4>所有的模型都是高质量的BIM模型，它们被放置在云端以便于你找到所需要的信息。</h4>
   					</div>
				</div>
			</div>
			
			<div class="col-md-4" >
				<div class="thumbnail">
					<img src="${request.getContextPath()}/dbim/img/businessvalue.png" />
					<div class="caption text-center">
						<h3>真实的价值</h3>
						<h4>产品制造商投资BIM模型以免费提供他们的产品内容给BIM用户。这是免费的，所以你需要注册。产品制造商需要知道他们的BIM对象技术投资是有用的，同时它提供给你作为一个BIM用户一定的价值。通过使用全新的BIM对象你可以节省很多的时间，并且你的模型的质量将从根本上得到提高。</h4>
   					</div>
				</div>
			</div>
		</div>
		
		<div class="bgbar" style="height:5px;"></div>
		
		<div class="container">
			<div class="row">
				<div class="col-xs-6 text-left"><h2>每周精选</h2></div>
				<div class="col-xs-6 text-right"><a href="${request.getContextPath()}/dbim/servicecenter/productcenter/products/page/1"><h4 style="margin-top:30px" >更多...</h4></a></div>
			</div>
			
			<c:forEach items="${productsHighLight}" var="product" varStatus="status" >  
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
		
		<div class="bgbar" style="height:5px;"></div>
		
		<div class="container">
		
			<div class="row">
				<div class="col-xs-6 text-left"><h2>最热门</h2></div>
				<div class="col-xs-6 text-right"><a href="${request.getContextPath()}/dbim/servicecenter/productcenter/products/page/1"><h4 style="margin-top:30px" >更多...</h4></a></div>
			</div>
			

			<c:forEach items="${productsPopular}" var="product" varStatus="status" >  
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
		
		<div class="bgbar" style="height:5px;"></div>
		
		<div class="container">
			<div class="row">
				<div class="col-xs-6 text-left"><h2>最新添加</h2></div>
				<div class="col-xs-6 text-right"><a href="${request.getContextPath()}/dbim/servicecenter/productcenter/products/page/1"><h4 style="margin-top:30px" >更多...</h4></a></div>
			</div>
			
			
			<c:forEach items="${productsHighLight}" var="product" varStatus="status" >  
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
		
		<div id="bottom"></div>
		
		
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
		    })
	    </script>
	</body>
</html>