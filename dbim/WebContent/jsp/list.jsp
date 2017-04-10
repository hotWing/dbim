<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-CN">
		<head>
   	    <jsp:include page="/jsp/head.jsp"/>
	</head>
	<body style="background-color:#dcdddd">
    	<jsp:include page="/jsp/navbar.jsp"/>
    	<div class="main-img text-center"><p>呆猫BOOKS</p></div>
    	
    	<div class="container" style="margin-top:20px">
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
				<div id="searchBt" class="btn btn-primary">搜索</div>
			</form>
		</div>
		
		<div class="container">
			<c:forEach items="${products}" var="product" varStatus="status" >  
				<div class="product-item col-sm-4 col-md-2" >
					<div class="thumbnail">
						<img src="${request.getContextPath()}/dbim/${product.thumbDir}.jpg" style="width:170px;height:190;"/>
						<a href="${request.getContextPath()}/dbim/servicecenter/productcenter/getProduct/${product.id}">
							${product.name}
						</a>	
    				</div>
				</div>
			</c:forEach> 
			
		</div>
		<div class="container">
			<ul id="pagination" style="float:right"></ul> 
		</div>
		
		
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
	    	
	    	$("#cloud-nav").addClass("active");
	    })
	    </script>
	</body>
</html>