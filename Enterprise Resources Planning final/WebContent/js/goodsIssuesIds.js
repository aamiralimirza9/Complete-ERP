$(document).ready(function(){
	
   var prequsitionId=$("#perchasingRequisitionId").val();
/*	var productOrdeId1=$("#POId").val();
	var productId1=$("#PId").val();
	var prId1=$("#PrID").val();  */
	
	
	
	$.ajax({
		type:"Post",
		url:"partialIssuesServlet",
		data:{
			prequisitionId:prequsitionId,
			
			
		},
		datatype:"json",
		success:function(data){
			for(var a=0 ; a<data.length; a++)
    		{					var bb=	data[a];
    			$("#perchasingRequisitionId").val(bb.purchasingRId).text(bb.purchasingRId).appendTo("#perchasingRequisitionId");
    			
    			$("#OrderId").val(bb.OrderId).text(bb.OrderId).appendTo("#OrderId");
    			
    			$("#pissuesId").val(bb.PissuesId).text(bb.PissuesId).appendTo("#pissuesId");
    		     
    			$("#InventoryId").val(bb.PIventoryId).text(bb.PIventoryId).appendTo("#InventoryId");
    			
    					
    		}
		}
	});

});