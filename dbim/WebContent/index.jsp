<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zh-CN">
	<head>
   	    <jsp:include page="/jsp/head.jsp"/>
	</head>
<body>
	<jsp:include page="/jsp/navbar.jsp"/>
	
	<div class="img-with-text text-center">
		<img class="bg-img" src="/dbim/img/index-main.jpg">
		<p>幕墙智造</p>
		<input class="search-input">
		<div class="search-btn"><img src="/dbim/img/search-btn.png" width="30px" height="30px"></div>
		<div class="buttons">
		   <span><a href="/dbim/servicecenter/postcenter/bimservice"><span><img src="/dbim/img/service.png" width="30px" height="30px" style="margin-right:5px"></span>任务发布</a></span>
	   </div>
		
	</div>
   	
   	<div class="service-flow-section">
		<div class="row">
		  	<div class="col-sm-2 text-center">
		  		<div class="img-wrapper"><img src="/dbim/img/1.png"></div>
			 	<p>发布任务</p> 
	 		</div>
	  		<div class="col-sm-2 text-center">
	  			<div class="img-wrapper"><img src="/dbim/img/2.png"></div>
			 	<p>定金支付</p> 
	  		</div>
	  		<div class="col-sm-2 text-center">
	  			<div class="img-wrapper"><img src="/dbim/img/3.png"></div> 
			 	<p>服务商交稿</p> 
	  		</div>
	  		<div class="col-sm-2 text-center">
	  			<div class="img-wrapper"><img src="/dbim/img/4.png"></div> 
			 	<p>选择满意的服务商</p> 
	  		</div>
	  		<div class="col-sm-2 text-center">
	  			<div class="img-wrapper"><img src="/dbim/img/5.png"></div> 
			 	<p>服务商工作</p> 
	  		</div>
	  		<div class="col-sm-2 text-center">
	  			<div class="img-wrapper"><img src="/dbim/img/2.png"></div>
			 	<p>任务完成付款</p> 
	  		</div>
		</div>
   		
   	</div>
   	
   	<div class="info-wrapper">
   		<div class="container text-center">
   			<img src="/dbim/img/service-lg.png" width="100px">
   			<p class="section-title">BIM服务</p>
   			<c:forEach items="${topServices}" var="service" varStatus="status" >
				<div class="top-service">
					<input id = "serviceId" value="${service.id}" style="display:none">
	    			<div class="row">
	    				<div class="col-sm-offset-2 col-sm-3 date-col">
	    					<fmt:formatDate value="${service.date}" pattern="yyyy-MM-dd HH:mm:ss" />
	    				</div>
	    				<div class="col-sm-2 circle-col">
	    					<div class="circle"></div>
	    				</div>
	    				<div class="col-sm-5" >
	    					<div class="row">${service.title}</div>
	    					<div class="row">服务价格：${service.price}</div>
	    				</div>
	    			</div>
	    		</div>
			</c:forEach> 

   		
   			<img src="/dbim/img/requirement-lg.png" width="100px" style="margin-top:80px;">
   			<p class="section-title">BIM需求</p>
   			<c:forEach items="${topRequirements}" var="requirement" varStatus="status" >
				<div class="top-requirement">
					<input id = "requirementId" value="${requirement.id}" style="display:none">
	    			<div class="row">
	    				<div class="col-sm-offset-2 col-sm-3 date-col">
	    					<fmt:formatDate value="${requirement.date}" pattern="yyyy-MM-dd HH:mm:ss" />
	    				</div>
	    				<div class="col-sm-2 circle-col">
	    					<div class="circle"></div>
	    				</div>
	    				<div class="col-sm-5" >
	    					<div class="row">${requirement.title}</div>
	    					<div class="row">服务价格：${requirement.price}</div>
	    				</div>
	    			</div>
	    		</div>
			</c:forEach> 
   		</div>
   	</div>
   	
	<jsp:include page="/jsp/bottom.jsp"/>
    	
</body>
    <script>
	    $(document).ready(function(){
    		var baseUrl = "${pageContext.request.contextPath}"
	    	$(".top-requirement").click(function(){
    	        location.href = baseUrl + "/servicecenter/postcenter/getRequirement/"+$("#requirementId", this).val();
	    	})
	    	
	    	$(".top-service").click(function(){
    	        location.href = baseUrl + "/servicecenter/postcenter/getService/"+$("#serviceId", this).val();
	    	})
	    })
    </script>
</html>