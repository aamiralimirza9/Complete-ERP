$(document).ready(function() {
	     so="action";
       		$.ajax({
       			
           		type:"POST",
           		url:"MpServlet",
           		data:{
           			
           			name:so,
           		},
           		datatype:"json",
           		success:function(data){

           		   var select = $('#combo1');
    	           select.find('option').remove();
    		
    			for(var a=0 ; a<data.length; a++)
    	{					var bb=	data[a];
   			
    	   $('<option>').val(bb.mt_name).text(bb.mt_name).appendTo(select);	
    				
    				
    				}
           		}

           			
           			
           		});  
       		
       		
       		
       	        });