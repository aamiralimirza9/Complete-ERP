$(document).ready(function(){
	
		
		   
              $.ajax({
            	  
         		type:"POST",
         		url:"showGoodIssuesData",
         		data:{
       				
       			
       			},
         		datatype:"json",
         		success:function(data){
			
				for(var a=0 ; a<data.length; a++)
				{					var bb=	data[a];
			                        
				           
			                        $('#Materialshow tr').eq(0).after(' <tr><td>'+bb.pIssuesId+'</td><td>'+bb.purchasingId+'</td><td>'+bb.OrderId+'</td><td>'+bb.pInvId+'</td><td>'+bb.giDate+'</td><td>'+bb.batchId+'</td><td>'+bb.binId+'</td><td>'+bb.MName+'</td><td>'+bb.mQuantity+'</td><td>'+bb.Mprice+'</td></tr>'); 
	      		
							}
	
}
              });
        });