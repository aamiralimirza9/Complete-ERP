$(document).ready(function(){
	$("#batch").submit(function(event){
		var batchName=$("#batchName").val();
		var btchCombo=$("#combo1").val();
		
		$.ajax({
			type:"Post",
			url:"BatchServlet",
			data:{
				BatchName:batchName,
				BatchCombo:btchCombo,
			},
			datatype:"json",
			success:function(data){
				for(var a=0 ; a<data.length; a++)
	    		{					var bb=	data[a];
	    			document.getElementById("first").innerHTML+=bb.Mt_name;
	    			
	    					
	    					
	    		}
			}
			
				
			
			
			
		});
		
			
		
		
		
		
	});
	
});