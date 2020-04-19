$(document).ready(function() {
	     so="action";
       		$.ajax({
       			
           		type:"POST",
           		url:"BinServlet",
           		data:{
           			
           			name:so,
           		},
           		datatype:"json",
           		success:function(data){

           		   var select = $('#combo1');
    	           select.find('option').remove();
    		
    			for(var a=0 ; a<data.length; a++)
    	{					var bb=	data[a];
   			
    	   $('<option>').val(bb.binName).text(bb.binName).appendTo(select);	
    				
    				
    				}
           		}

           			
           			
           		});  
       		
       		
       		
       	        });