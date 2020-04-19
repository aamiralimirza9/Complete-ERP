$(document).ready(function(){
	$("#issue").submit(function(event){
		var prid=$("#PrequsitionId").val();
		var orderid=$("#OrderID").val();
		var Inventory=$("#InvId").val();
		
		
		$.ajax({
			type:"Post",
			url:"partialIssuesServlet",
			data:{
				Prid:prid,
				OrderID:orderid, 
				InventoryId:Inventory,
			},
			datatype:"json",
			success:function(data){
				for(var a=0 ; a<data.length; a++)
	    		{					var bb=	data[a];
	    			document.getElementById("first").innerHTML+=bb.binName;
	    			
	    					
	    					
	    		}
			}
			
				
			
			
			
		});
		
			
		
		
		window.open('goodIssues.jsp');
		
	});  
	
	
	
	
	         

	
});