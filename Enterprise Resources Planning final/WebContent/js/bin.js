$(document).ready(function(){
	$("#bin").submit(function(event){
		var binname=$("#BinName").val();
		var bindesc=$("#BinDesc").val();
		
		
		$.ajax({
			type:"Post",
			url:"BinServlet",
			data:{
				BinName:binname,
				BinDesc:bindesc, 
			},
			datatype:"json",
			success:function(data){
				for(var a=0 ; a<data.length; a++)
	    		{					var bb=	data[a];
	    			document.getElementById("first").innerHTML+=bb.binName;
	    			
	    					
	    					
	    		}
			}
			
				
			
			
			
		});
		
			
		
		
		
		
	});
	
});