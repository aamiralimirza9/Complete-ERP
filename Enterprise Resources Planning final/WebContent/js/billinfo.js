$(document).ready(function(){
   	 $("#Materialid").keyup(function(event){
   		var VendorId=$("#Materialid").val();
   		alert("hello");
   		
   		$.ajax({
   			type:"Post",
   			url:"OrderServlet",
   			data:{
   				venderID:VendorId,
   				
   		
   			},
   			datatype:"json",
   			success:function(data){
   				for(var a=0 ; a<data.length; a++)
   	    		{					var bb=	data[a];
   	    			$("#Materialid").val(bb.name).text(bb.name).appendTo("#Materialid");
   	    			
   	    					
   	    					
   	    		}
   			}
   			
   				
   			
   			
   			
   		});
   		});
   });