$(document).ready(function(){
	$("#btn").click(function(event){
		var customerId=$("#CustmId").val();
		var ProductId=$("#ProductId").val();
		
		
		$.ajax({
			type:"Post",
			url:"orderInsertServlet",   //change the name to prdataTest  
			data:{
				CustomerId:customerId,
				productId:ProductId,
				
				
		
			},
			datatype:"json",
			success:function(data){
				for(var a=0 ; a<data.length; a++)
	    		{					var bb=	data[a];
	    			document.getElementById("first").innerHTML+=bb.VendorId;
	    			
	    					
	    					
	    		}
			}
			
				
			
			
			
		});
		
			
		
		
		
		
	});
	
});