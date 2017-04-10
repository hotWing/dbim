<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="zh-CN">
	<head>
   	    <jsp:include page="/jsp/head.jsp"/>
	</head>
	<body>
    	<jsp:include page="/jsp/navbar.jsp"/>
    	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
		  <!-- Indicators -->
		  <ol class="carousel-indicators">
		    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
		    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
		  </ol>
		
		  <!-- Wrapper for slides -->
		  <div class="carousel-inner" role="listbox">
		    <a class="item active" href="http://www.dmbim.cn/" target="_blank">
		      <img src="${request.getContextPath()}/dbim/img/slide1.jpg">
		    </a>
		    <div class="item slide-btn" data-toggle="modal" data-target="#qq-modal">
		      <img src="${request.getContextPath()}/dbim/img/slide2.jpg">
		    </div>
		    <div class="item">
		      <img src="${request.getContextPath()}/dbim/img/slide3.jpg">
		    </div>
		    <div class="item">
		      <img src="${request.getContextPath()}/dbim/img/slide4.jpg">
		    </div>
		  </div>
		
		  <!-- Controls -->
		  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
		    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
    	<div style="background-color:#1690c3">
    		<div class="container stats text-center">
 				<div class="col-sm-4">
 					<p class="num">5628+</p>
 					<p class="txt">下载量</p>
 				</div>
 				<div class="col-sm-4" >
 					<p class="num">5240+</p>
 					<p class="txt">产品</p>
 				</div>
 				<div class="col-sm-4" >
 					<p class="num">320+</p>
 					<p class="txt">厂家</p>
 				</div>
    		</div>
		</div>
		<div style="background-color:#dcdddd">
	    	<div class="container intro text-center">
	    		<p>如今的CAD符号被BIM模型所替代，BIM模型也可以像<br>CAD符号一样以2d或3d的方式展示出你们的产品，但是它的功能远远不止这些。</p>
	    		<div class="col-md-4" >
					<div class="thumbnail">
						<img src="${request.getContextPath()}/dbim/img/product.png"/>
						<div class="caption text-center">
							<p class="title">真实的产品</p>
							<p class="content">我们这里所有的BIM模型都是以真实的产品为基础。我们与产品商协同工作，为了创建与真实产品外形和数据都相近的数码产品。</p>
	   					</div>
					</div>
				</div>
				
				<div class="col-md-4" >
					<div class="thumbnail">
						<img src="${request.getContextPath()}/dbim/img/model.png" />
						<div class="caption text-center">
							<p class="title">真实的模型</p>
							<p class="content">所有的模型都是高质量的BIM模型，他们被放置在云端以便于你找到所需要的信息。</p>
	   					</div>
					</div>
				</div>
				
				<div class="col-md-4" >
					<div class="thumbnail">
						<img src="${request.getContextPath()}/dbim/img/businessvalue.png" />
						<div class="caption text-center">
							<p class="title">真实的价值</p>
							<p class="content">产品制造商投资BIM模型以免费提供他们的产品内容给 BIM用户，这是免费的，所以你需要注册。</p>
	   					</div>
					</div>
				</div>
			</div>
		</div>
		
		<div style="background-color:#1690c3; padding:80px 0px;">
		
			<div class="container">
				<div class="row" style="margin-bottom:80px">
					<div class="col-xs-6 text-left"><h2 style="font-size:45px;color:white;">每周精选</h2></div>
					<div style="padding-top:50px" class=" col-xs-offset-3 col-xs-3 col-md-offset-4 col-md-2 text-center"><a style="pading:10px;display:block; font-size:20px;color:white;text-decoration:none;" href="${request.getContextPath()}/dbim/servicecenter/productcenter/products/page/1">更多...</a></div>
				</div>
				
				<c:forEach items="${productsHighLight}" var="product" varStatus="status" >  
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
		</div>
		<div style="background-color:#dcdddd; padding:80px 0px;">
		
			<div class="container">
		
				<div class="row" style="margin-bottom:80px">
					<div class="col-xs-6 text-left"><h2 style="font-size:45px;color:#1690c3">最热门</h2></div>
					<div style="padding-top:50px" class=" col-xs-offset-3 col-xs-3 col-md-offset-4 col-md-2 text-center"><a style="display:block; font-size:20px;color:#1690c3;text-decoration:none;" href="${request.getContextPath()}/dbim/servicecenter/productcenter/products/page/1">更多...</a></div>
				</div>
				
	
				<c:forEach items="${productsPopular}" var="product" varStatus="status" >  
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
		</div>
		
		
		<div style="background-color:#1690c3; padding:80px 0px;">
		
			<div class="container">
				<div class="row" style="margin-bottom:80px">
					<div class="col-xs-6 text-left"><h2 style="font-size:45px;color:white">最新添加</h2></div>
					<div style="padding-top:50px" class=" col-xs-offset-3 col-xs-3 col-md-offset-4 col-md-2 text-center"><a style="display:block; font-size:20px;color:white;text-decoration:none;" href="${request.getContextPath()}/dbim/servicecenter/productcenter/products/page/1">更多...</a></div>
				</div>
				
				
				<c:forEach items="${productsHighLight}" var="product" varStatus="status" >  
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
		</div>
		
		<div class="text-center" style = "background-color:#727171; padding:20px 0px 80px 0px;font-size:10px;color:white">
			<p>© 2015 唯设计 | V-Building 版权所有 </p>
			<p>网站备案号：沪ICP备15043969号-2</p>
		 </div>
 
 
   <div class="modal fade" id="qq-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
      <div class="modal-dialog modal-md" role="document" style="margin-top:100px">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">幕墙工具箱</h4>
          </div>
          <div class="modal-body text-center">
          	<div class="video-wapper">
             <a class="video-cover" href="http://v.qq.com/page/f/g/8/f0176p2i0g8.html" target="_blank"></a>
	            <a class = "video-info text-center" href="http://v.qq.com/page/f/g/8/f0176p2i0g8.html" target="_blank">
	                <img src="${request.getContextPath()}/dbim/img/CurtainApp.jpg" width="100%">
	            </a>
            </div>
	            <button type="button" class="btn btn-primary" style="margin-top:20px">下载APP</button>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
          </div>
        </div>
      </div>
    </div>
    
	</body>
	
	 <script type='text/javascript'>
	    $(document).ready(function(){
	    	$("#cloud-nav").addClass("active");
	    })
	    
	    $(".video-wapper").hover(
	        function(){
	            var $img  =  $(this).find("img");
	            var height = $img.height();
	            var width = $img.width();
	            var $cover  =  $(this).find(">.video-cover");
	            $cover.height(height);
	            $cover.width(width);
	            $cover.stop();
	            $cover.fadeIn();
	        },
	        function() {
	            var $cover  =  $(this).find(">.video-cover");
	            $cover.stop();
	            $cover.fadeOut();
	       });
	    </script>
	    
	    
   
    
</html>