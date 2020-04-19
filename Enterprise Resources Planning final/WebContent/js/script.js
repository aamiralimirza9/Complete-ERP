    $(document).ready(function(){
    	
    		var nam="name";
    	
    		$.ajax({
    		type:"POST",
    		url:"AccountOpenServlet",
    		data:{
    			empname:nam,
    		},
    		datatype:"json",
    		success:function(data){

    	    	   var select = $('#player');
    	           select.find('option').remove();
    		
    			for(var a=0 ; a<data.length; a++)
    	{					var bb=	data[a];
   			
    	   $('<option>').val(bb.type).text(bb.type).appendTo(select);	
    				
    				
    				}		
    		}

    			
    			
    		});
    		
    			
    		
    		
    		
    	});	
    
    