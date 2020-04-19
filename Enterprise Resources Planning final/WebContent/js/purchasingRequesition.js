$(document).ready(function(){
	$("#btn").click(function(event){
		var MaterialNo=$("#MaterialId").val();
		var prQuantity=$("#PrQuantity").val();
		//var PrDeliveryDate=$("#PrDdate").val();
		var PrStatus=$("#PrStatus").val();
		//var PrCurrentDate=$("#PrCurrentdate").val();
		var PrID=$("#PrID").val();
		
		$.ajax({
			
			type:"post",
			url:"PurchasingRequesition",
			data:{
				Materialno:MaterialNo,
				Prquantity:prQuantity,
			//	prDeliverydate:PrDeliveryDate,
				prStatus:PrStatus,
			//	prCurrentdate:PrCurrentDate,
				prId:PrID
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