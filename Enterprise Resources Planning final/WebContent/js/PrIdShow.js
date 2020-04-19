$(document).ready(function(){
	
	var VendorId1=$("#Vid").val();
	var productOrdeId1=$("#POId").val();
	var productId1=$("#PId").val();
	var prId1=$("#PrID").val();
	
	
	
	$.ajax({
		type:"Post",
		url:"test",
		data:{
			venderID:VendorId1,
			PorderId:productOrdeId1,
			productId:productId1,
			//Prid:prId1,
			
		},
		datatype:"json",
		success:function(data){
			for(var a=0 ; a<data.length; a++)
    		{					var bb=	data[a];
    		aler("hii")
    			$("#Vid").val(bb.VendorId).text(bb.VendorId).appendTo("#Vid");
    			
    			$("#POId").val(bb.ProOrderId).text(bb.ProOrderId).appendTo("#POId");
    			
    			$("#PId").val(bb.ProductId).text(bb.ProductId).appendTo("#PId");
    			$("#PrID").val(bb.PrId).text(bb.PrId).appendTo("#PrID");		
    		}
		}
	});

});