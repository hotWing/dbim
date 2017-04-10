<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="zh-CN">
	<head>
   	    <jsp:include page="/jsp/head.jsp"/>
	</head>
	<body>
    	<jsp:include page="/jsp/navbar.jsp"/>
    	<div class="main-img text-center"><p>BIM需求</p></div>
    	
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
		

	    
	    <script>
		    $(document).ready(function(){
	    		var baseUrl = "${pageContext.request.contextPath}"
	    		
		    	
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
		    	
		    	$("#requirement-nav").addClass("active");
		    })
	    </script>
	</body>
</html>