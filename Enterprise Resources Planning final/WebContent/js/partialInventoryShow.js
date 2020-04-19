$(document).ready(function(){
/*	 $("#orderId").keyup(function(event){
		var orderid=$("#orderId").val();
		
		
		$.ajax({
			type:"Post",
			url:"showPartialInventory",
			data:{
				OrderID:orderid,
				
		
			},
			datatype:"json",
			success:function(data){
				for(var a=0 ; a<data.length; a++)
	    		{					var bb=	data[a];
	    		//$('#Mid')
	    //	$('#Mid').val($('#Mid').val()+bb.name);
	    		
	    //		$("#orderId").val(bb.name).text(bb.name).appendTo("#orderId");
	    			
	    					
	    					
	    		}
			}
			
				
			
			
			
		});    
		});
		
		*/
	 //*********************** SECOND ****************FOR Production ID *****************************
	 $("#POId").keyup(function(event){
			var ProductionID=$("#POId").val();

			
			
			$.ajax({
				type:"Post",
				url:"showPartialInventory",
				data:{
					productionid:ProductionID,
					
			
				},
				datatype:"json",
				success:function(data){
					for(var a=0 ; a<data.length; a++)
		    		{					var bb=	data[a];
		    		
		   		$("#POId").val(bb.name).text(bb.name).appendTo("#POId");
		    			
		    					
		    					
		    		}
				}
				
					
				
				
				
			});
			});
	 //*********************** NOW FOR Partial Table************************************
	
	 
	 /*
	 $("#PrId").keyup(function(event){
		 var prid=$("#PrId").val();

			
			
			$.ajax({
				type:"Post",
				url:"showPartialInventory",
				data:{
					PRID:prid,
			
				},
				datatype:"json",
				success:function(data){
					for(var a=0 ; a<data.length; a++)
		    		{					var bb=	data[a];
		    		$("#PrId").val(bb.name).text(bb.name).appendTo("#PrId");
		    			
		    					
		    					
		    		}
				}
				
					
				
				
				
			});
			});
	
	 
                 */

	
});