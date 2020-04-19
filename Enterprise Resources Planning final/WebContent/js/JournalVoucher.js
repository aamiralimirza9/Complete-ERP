    $(document).ready(function() {    
    	$('#debit').click(function(event) {
       		var acno = $("#dbac").val();
       	
       
       		var amount =  $("#dbamount").val();
       		
 
      
      
       		$('#dbtable tr').eq(0).after('<tr><td colspan="1"> '+acno+'</td><td colspan="1" class="price"> '+amount+'</td><td></td>   <td><button type="button" class="removebutton" title="Remove this row">X</button></tr>');  
       	        });
   		
   		
   	  

	
	
	
     
    	$('#credit').click(function(event) {
       		var acno = $("#crac").val();
       	
       
       		var amount =  $("#cramount").val();
       		
       		$('#crtable tr').eq(0).after('<tr><td colspan="1"> '+acno+'</td><td colspan="1" class="crtotal"> '+amount+'</td><td></td> <td><button type="button" class="removebutton" title="Remove this row">X</button></td></tr>');  		
       	   
       		
       		
       	        });

    	
    	
    	 $(document).on('click', 'button.removebutton', function () {
    	 
    	     $(this).closest('tr').remove();
    	     return false;
    	 });
    	 
    	 
    	 $('#total').click(function(event) {
    		
    		  
    		  var sum = 0;
    		  var total=0;
    		// iterate through each td based on class and add the values
    		$(".price").each(function() {

    		    var value = $(this).text();
    		    // add only if the value is number
    		    if(!isNaN(value) && value.length != 0) {
    		        sum += parseFloat(value);
    		    }
    		  
    		});
    		$("<td colspan='2'>"+sum+"</td>").insertAfter('#dbtable tr td:last')
    		  
      		$(".crtotal").each(function() {

    		    var value = $(this).text();
    		    // add only if the value is number
    		    if(!isNaN(value) && value.length != 0) {
    		        total += parseFloat(value);
    		    }
    		  
    		});
      		
      		$("<td colspan='2'>"+total+"</td>").insertAfter('#crtable tr td:last');
      		var trail=sum-total;
      		if(trail==0){
      			window.alert('successful');
      			var header = Array();
      		    
      			$("table tr th").each(function(i, v){
      			        header[i] = $(this).text();
      			})
      			               
      			alert(header);

      			var data = Array();
      			    
      			$("table tr").each(function(i, v){
      			    data[i] = Array();
      			    $(this).children('td').each(function(ii, vv){
      			        data[i][ii] = $(this).text();
      			    }); 
      			})

      			alert(data);


      		}
      		else{
      			window.alert('unsuccessful');
      		}
    
	});
    });