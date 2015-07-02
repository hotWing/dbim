<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<nav class="navbar navbar-default" style="margin-bottom:0px">
   		<div class="container">
   			<div class="navbar-header">
		    	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
		        	<span class="sr-only">Toggle navigation</span>
		        	<span class="icon-bar"></span>
		        	<span class="icon-bar"></span>
		        	<span class="icon-bar"></span>
		    	</button>
		    	<a class="navbar-brand" href="/dbim/servicecenter/postcenter/index">DBIM</a>
		    </div>
		    
		    <div class="collapse navbar-collapse" id="navbar-collapse">
		      <ul class="nav navbar-nav">
		        <li><a href="/dbim/servicecenter/postcenter/bimservice">服务</a></li>
		        <li><a href="/dbim/servicecenter/postcenter/bimrequirement">需求</a></li>
		        <li><a href="/dbim/servicecenter/productcenter/cloud">云族库</a></li>
		      </ul>
		   
		      <ul class="nav navbar-nav navbar-right">
		      
			      <c:choose>  
					   <c:when test="${empty username}">
					   		<li><button type="button" class="btn button-primary"  data-toggle="modal" data-target="#loginModal">登录</button></li>
					   </c:when>  
					   <c:otherwise>   
					   		<li><p>欢迎，${username}</p></li>
					   		<li><button id="logoutBt" type="button" class="btn button-primary">退出</button></li>
					   </c:otherwise>  
				  </c:choose>
		      </ul>
		    </div>
   		</div>
   	</nav>
   	
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
	        <button id="loginBt" type="button" class="btn btn-primary">提交</button>
	      </div>
	    </div>
	  </div>
	</div>
