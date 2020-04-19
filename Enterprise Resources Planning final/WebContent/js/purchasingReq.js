$(document).ready(function(){
	$("#btn").click(function(event){
		var VendorId=$("#VendorId").val();
		var productOrdeId=$("#ProductOrderId").val();
		var ProductId=$("#ProductId").val();
		var Deliverydate=$("#nam").val();
	    var Currentdate=$("#nam1").val();
		  
	 
		$.ajax({
			type:"Post",
			url:"test",  
			data:{
				venderID:VendorId,
				PorderId:productOrdeId,
				productId:ProductId,
				deliveryDate:Deliverydate,
				currentDate:Currentdate,
				
		
			},
			datatype:"json",
			success:function(data){
				for(var a=0 ; a<data.length; a++)
	    		{					var bb=	data[a];
	    			
	    			
	    					
	    					
	    		}
			}
			
				
			
			
			
		});
		
			
		
		
		
		
	});
	
});