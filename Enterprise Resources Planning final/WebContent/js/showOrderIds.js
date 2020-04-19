$(document).ready(function(){
	
	var mainPid=$("#mpId").val();
	var Poid=$("#PoId").val();
	var Orderid=$("#OrderId").val();
	
	
	
	
	$.ajax({
		type:"Post",
		url:"orderInsertServlet",
		data:{
			OrderId:mainPid,
			custid:Poid,
			productid:Orderid,
			

		
			
		},
		datatype:"json",
		success:function(data){
			for(var a=0 ; a<data.length; a++)
    		{					var bb=	data[a];
    		
    		//alert(bb.OrderId);
    		   //  alert(bb.OrderId);
    			$("#mpId").val(bb.mpdId).text(bb.mpdId).appendTo("#mpId");
    			
    			$("#PoId").val(bb.ProductionOId).text(bb.ProductionOId).appendTo("#PoId");
    			
    			$("#OrderId").val(bb.OrderId).text(bb.OrderId).appendTo("#OrderId");
    			
    		}
		}
	});

});