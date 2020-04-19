$(document).ready(function(){
	$("#reciept").submit(function(event){
		var orderID=$("#orderId").val();
		var productionID=$("#POId").val();
		var prid=$("#PrId").val();
		var Deliverydate=$("#nam").val();
	   
	  
		
		$.ajax({
			type:"Post",
			url:"GoodRecipts",   //change the name to prdataTest  
			data:{
				OrderId:orderID,
				Porductionid:productionID,
				PrId:prid,
				deliveryDate:Deliverydate,
				
		
			},
			datatype:"json",
			success:function(data){
				for(var a=0 ; a<data.length; a++)
	    		{					var bb=	data[a];
	    			document.getElementById("first").innerHTML+=bb.VendorId;
	    			
	    					
	    					
	    		}
			}
			
				
			
			
			
		});
		
		window.open('partialInventoryTable.jsp');
			
		
		
		
		
	});
	
});