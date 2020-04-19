$(document).ready(function(){
	
	var orderID=$("#oderId").val();
	var productionID=$("#PorderId").val();
	var prid=$("#prId").val();
	var grId=$("#GrId").val();
	
	
	
	$.ajax({
		type:"Post",
		url:"tryinventoryShow",
		data:{
			OrderId:orderID,
			Porductionid:productionID,
			PrId:prid,
			Grid:grId,

		
			
		},
		datatype:"json",
		success:function(data){
			for(var a=0 ; a<data.length; a++)
    		{					var bb=	data[a];
    		
    		//alert(bb.OrderId);
    		   //  alert(bb.OrderId);
    			$("#oderId").val(bb.OrderId).text(bb.OrderId).appendTo("#oderId");
    			
    			$("#PorderId").val(bb.ProductionOrder).text(bb.ProductionOrder).appendTo("#PorderId");
    			
    			$("#GrId").val(bb.GrNo).text(bb.GrNo).appendTo("#GrId");
    			$("#prId").val(bb.PrId).text(bb.PrId).appendTo("#PrID");		
    		}
		}
	});

});