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
		<p>幕墙智造DBIM</p>
		<div class="bar"></div>
		<div class="bar" style="top:330px"></div>
		<div class="nav-btn">互联网+幕墙智造DBIM</div>
		<img class="nav-arrow-img" src="/dbim/img/index-main.jpg" width="100px">
	</div>
   	
   	<div class = "container text-center section">
   		<div class="title">
    		<h3>BIM需求</h3>
    		<h4>BIM REQUIREMENT</h4>
   		</div>
   		<c:forEach items="${topRequirements}" var="requirement" varStatus="status" >  
			<div class="top-requirement">
				<input id = "requirementId" value="${requirement.id}" style="display:none">
    			<div class="row">
    				<div class="col-sm-10">
    					<h4>${requirement.title}</h4>
    				</div>
    				<div class="col-sm-2" >
    					<h4>服务价格：${requirement.price}</h4>
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
   	
   	<div class ="section" style = "background-color:#efefef;">
   		<div class = "container text-center" >
    		<div class="title">
	    		<h3>BIM服务</h3>
	    		<h4>BIM SERVICE</h4>
    		</div>
    		<c:forEach items="${topServices}" var="service" varStatus="status" >  
				<div class="top-service">
					<input id = "serviceId" value="${service.id}" style="display:none">
	    			<div class="row">
	    				<div class="col-sm-10">
	    					<h4>${service.title}</h4>
	    				</div>
	    				<div class="col-sm-2" >
	    					<h4>服务价格：${service.price}</h4>
	    				</div>
	    			</div>
	    			<div class="row">
		    			<div class="col-sm-6" >
		    				<fmt:formatDate value="${service.date}" pattern="yyyy-MM-dd HH:mm:ss" />
		    			</div>
		    			<div class="col-sm-offset-4 col-sm-2" >
		    				<p>${service.author}</p>
		    			</div>
	    			</div>
	    		</div>
			</c:forEach> 
    	</div>
   	</div>
    	
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