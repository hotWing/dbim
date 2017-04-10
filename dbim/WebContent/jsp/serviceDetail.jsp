<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zh-CN">
	<head>
   	    <jsp:include page="/jsp/head.jsp"/>
	</head>
	<body>
    	<jsp:include page="/jsp/navbar.jsp"/>
    	<div class="main-img text-center"><p>BIM服务</p></div>
    	
    	<div class="container">
    		<input id = "serviceId" value="${service.id}" style="display:none">
    		<h2>${service.title}</h2>
    		<div class="row" style="margin-bottom:30px">
    			<div class="col-sm-offset-1 col-sm-3">发布日期：<fmt:formatDate value="${service.date}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
    			<div class="col-sm-offset-6 col-sm-2">作者： ${service.author}</div>
    		</div>
    		<h4>${service.content}</h4>
    	</div>
    	
		<div class="container">
		<h4><b>评论</b></h4>
			<c:forEach items="${comments}" var="comment" varStatus="status" >  
				<div class="post bg-info">
    			<div class="row">
    				<div class="col-sm-12" >
    					<h4>${comment.content}</h4>
    				</div>
    			</div>
    			<div class="row">
	    			<div class="col-sm-6" >
	    				<fmt:formatDate value="${comment.date}" pattern="yyyy-MM-dd HH:mm:ss" />
	    			</div>
	    			<div class="col-sm-offset-4 col-sm-2" >
	    				<p>${comment.author}</p>
	    			</div>
    			</div>
    		</div>
			</c:forEach> 
			
			<form>
				<div class="form-group">
	                <label for="content">发表评论</label>
	                <textarea class="form-control" rows="3" id="content" name="content"></textarea>
	            </div>
	           
	           <div class="container text-right button-group">
	    		<button id="commentSubmitBt" type="button" class="btn btn-primary" data-toggle="modal" data-target="#publishModal">发表</button>
	    	</div>
            </form>
		</div>
		
		<div id="bottom"></div>

	    <script>
		    $(document).ready(function(){
	    		var baseUrl = "${pageContext.request.contextPath}"
	    		
		    	$("#commentSubmitBt").click(function(){
		    		var username = "${username}";
		    		var content = $("#content").val()
		    		if (!username) 
		    			alert("请先登录");
		    		else if (!content || content=="")
		    			alert("请填写评论内容");
		    		else {
			    		var currentdate = new Date(); 
			    	    var datetime = currentdate.getFullYear() + "-" 
			    	    			+ (currentdate.getMonth()+1)  + "-"
			    	    			+ currentdate.getDate() + " "
			    	                + currentdate.getHours() + ":"  
			    	                + currentdate.getMinutes() + ":" 
			    	                + currentdate.getSeconds();
			    	                
			    	                
			    		$.ajax({
			    	        url: baseUrl + "/servicecenter/postcenter/addComment",
			    	        type: "post",
			    	       
			    	        data:  {serviceId: $("#serviceId").val(),
				    	        	content: content,
				    	        	date: datetime,
				    	        	author: username},
				    	        	
			    	        		
			    	        dataType: 'text',		
			    	        success: function(msg,textStatus){
			    	        			if("success"==msg) {
			    	        				alert("发表成功");
			    	        				location.reload();
			    	        			}
			    	        			else 
			    	        				alert("发表失败");
			    	        				
			    		        	},
			            	error: function(XMLHttpRequest, error, errorThrown){  
			    	        		  alert(error);  
			    	        		  alert(errorThrown);  
			        		  },  
			    	    });
		    		}
	    		})
		    })
		    
		    
		    $("#service-nav").addClass("active");
	    </script>

	</body>
</html>