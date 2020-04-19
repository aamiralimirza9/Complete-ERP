


$(document).ready(function(){
	
	 $("#VendorId").keydown(function(e){
		 if(e.which == 16) {
		var VendorId=$("#VendorId").val();
		
		   
		$.ajax({
			type:"Post",
			url:"TextShow",
			data:{
				venderID:VendorId,
				
		
			},
			datatype:"json",
			success:function(data){
				for(var a=0 ; a<data.length; a++)
	    		{					var bb=	data[a];
	    			$("#VendorId").val(bb.name).text(bb.name).appendTo("#VendorId");
	    			
	    					
	    					
	    		}
			}
			
				
			
			
			
		});
		 }
		});    
	                      //VALIDATION CHEAAKING FOR THE VENDOR
	 
	 
	 $("#VendorId").keydown(function(e){
		 if(e.which == 16) {
			var VendorId=$("#VendorId").val();
			
			 
			$.ajax({
				type:"Post",
				url:"PrValidation",
				data:{
					vender:VendorId,
					
			
				},
				datatype:"json",
				success:function(data){
					
					if(data=="success"){
      					
      					$("#check").html(" <span class='glyphicon glyphicon-ok' style='font-size:30px;color:green'></span>");
  	        		   
  				}         		
  				else{
  				  $("#check").html("<span class='fa fa-warning' style='font-size:30px;color:red'></span>");
  	           		
  				}
					
				}
				
					
				
				
				
			});
		 }
			});    
	
	 
	 
	 
	 
	 
	 //*********************** SECOND *******************PRODUCT ORDER TYPE*****************************

	
	 //*********************** PRODUCT NUMBER ************************************
	 
	 
	 
	 /*
	 $("#ProductId").keyup(function(event){
		 var productId=$("#ProductId").val();

			
			
			$.ajax({
				type:"Post",
				url:"TextShow",
				data:{
					productId:productId,
			
				},
				datatype:"json",
				success:function(data){
					for(var a=0 ; a<data.length; a++)
		    		{					var bb=	data[a];
		    		$("#ProductId").val(bb.name).text(bb.name).appendTo("#ProductId");
		    			
		    					
		    					
		    		}
				}
				
					
				
				
				
			});
			});
	
	 */
	 

	
});