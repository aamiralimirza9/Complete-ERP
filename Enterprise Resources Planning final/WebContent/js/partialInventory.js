$(document).ready(function(){
	$("#btnAdd").click(function(event){
		var MaterialNo=$("#Mid").val();
		var MaterialQuantity=$("#MtQuantity").val();
		var BinId=$("#BinNo").val();
		var BatchId=$("#BatchNo").val();
		
		$.ajax({
			type:"Post",
			url:"PartialInventory",
			data:{
				materialNo:MaterialNo,
				materialquantity:MaterialQuantity,
			    binid:BinId,
				batchid:BatchId,
				
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