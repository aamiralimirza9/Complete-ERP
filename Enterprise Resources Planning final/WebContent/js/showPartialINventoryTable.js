$(document).ready(function(){
	
		
		   
              $.ajax({
            	  
         		type:"POST",
         		url:"showInventorydata",
         		data:{
       				
       			
       			},
         		datatype:"json",
         		success:function(data){
			
				for(var a=0 ; a<data.length; a++)
				{					var bb=	data[a];
			                       
			   $('#Materialshow tr').eq(0).after(' <tr><td>'+bb.gr_no+'</td><td>'+bb.orderID+'</td><td>'+bb.poId+'</td><td>'+bb.grQuantity+'</td><td>'+bb.grStock+'</td><td>'+bb.prId+'</td><td>'+bb.materialName+'</td><td>'+bb.MaterialQuantity+'</td><td>'+bb.MaterialPrice+'</td><td>'+bb.batchName+'</td><td>'+bb.BinNmae+'</td></tr>');  					
				                 					
	      		
							}
	
}
              });
        });