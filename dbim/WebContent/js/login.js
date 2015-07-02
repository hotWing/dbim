$(document).ready(function(){
	$("#loginBt").click(function(){
		var username = $("#username").val()
		var password = $("#password").val()

		$.ajax({
	        url: "/dbim/servicecenter/usercenter/login",
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
	        url: "/dbim/servicecenter/usercenter/logout",
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