$(function(){
	$('.wysiwyg-content').keypress(function(event){
	    if(event.which==13){//按了回车
	    	$('#price').val("回车");
	    } 
	    else if(event.which==32){//按了空格
	    	$('#price').val("空格");
	    }
	});
});