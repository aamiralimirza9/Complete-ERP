$(document).ready(function() {
      	    
      		$("#search").keyup(function(){

      			var search=$("#search").val();
      			
      	      $.ajax({
      	    	  type:"POST",
      	  		url:"MakeToBuy", 
      	  		data:{
      	  			search1:search,
      	  		},
      	  		datatype:"json",
      			success:function(data){
      		
      			for(var a=0 ; a<data.length; a++)
      			{					var bb=	data[a];
      				
      	 		//$('#Materialshow tr').eq(0).after(' <tr><td>'+bb.productName+'</td><td>'+bb.weight+'</td>'
    
      		      		$('#Materialshow tr').eq(0).after(' <tr><td>'+bb.productName+'</td><td>'+bb.weight+'</td><td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="open-AddBookDialog btn btn-primary"  data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td><td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="open-delBookDialog btn btn-primary" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td></tr>');  					
      	 				
      						}
      			}
      	      });
      	      
      	});
      	      
      	      
      	});
    