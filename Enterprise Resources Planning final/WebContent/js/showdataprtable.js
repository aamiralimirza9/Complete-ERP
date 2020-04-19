$(document).ready(function(){
	
		
		   
              $.ajax({
            	  
         		type:"POST",
         		url:"showpurchasingdata",
         		data:{
       				
       			
       			},
         		datatype:"json",
         		success:function(data){
			
				for(var a=0 ; a<data.length; a++)
				{					var bb=	data[a];
			                   
	      		$('#Materialshow tr').eq(0).after(' <tr><td>'+bb.productionOId+'</td><td>'+bb.productionId+'</td><td>'+bb.MaterialName+'</td><td>'+bb.prQuantity+'</td><td>'+bb.MaterialPrice+'</td><td>'+bb.VendorName+'</td><td>'+bb.orderId+'</td></tr>');  					
							}
	
}
              });
        });