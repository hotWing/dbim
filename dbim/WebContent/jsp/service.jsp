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
    	
    	
    	<div class="container" style="margin-top:15px">
    		<b>分类</b><br>
    		
    		<label class="radio-inline">
			  <input type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1"> BIM咨询
			</label>
			<label class="radio-inline">
			  <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> BIM管线综合
			</label>
			<label class="radio-inline">
			  <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> BIM工程造价
			</label>

    	</div>
    	
    	<div class="container text-right button-group">
    		<button id="publishBt" type="button" class="btn btn-primary" data-toggle="modal" data-target="#publishModal">发布</button>
    	</div>
		<div class="container">
			<c:forEach items="${bimservices}" var="service" varStatus="status" >  
				<div class="post bg-info">
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
                    <textarea class="form-control wysiwyg-content" rows="3" id="content" name="content"></textarea>

                  </div>
                  <div class="form-group">
                    <label for="price">服务价格</label>
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

	    <script src="${request.getContextPath()}/dbim/js/ckeditor.js"></script>
	    
	    <script>
		    $(document).ready(function(){
		    	
		    	CKEDITOR.replace( 'content' );
		    	
		    	
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
		    		var price = $("#price").val();
		    		var content = CKEDITOR.instances.content.getData();
		    		if(title==""||content==""||price=="")
		    			alert("请填写完整信息");
		    		else {
			    		$.ajax({
			    	        url: baseUrl + "/servicecenter/postcenter/addService",
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
	    	        location.href = baseUrl + "/servicecenter/postcenter/getService/"+$("#serviceId", this).val();
		    	})
		    	
		    	$("#service-nav").addClass("active");
		    })
	    </script>
	</body>
</html>