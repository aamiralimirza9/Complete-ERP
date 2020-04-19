$(document).ready(function(){
	
       $('#addtoOrderList').click(function(event) {
      	
    		var quantity =$("#quantity").val();
    		var productName =$("#productName").val();
    		var price =$("#price").val();     
      		$('#dbtable tr').eq(0).after('<tr><td colspan="1" id="productName">'+productName+'</td><td colspan="1" id="quantity" >'+quantity+'</td><td colspan="1" id="price"> '+price+'</td><td><button type="button" class="removebutton" title="Remove this row">X</button></tr>');  
      	        });
  	 $(document).on('click', 'button.removebutton', function () {
  	 
  	     $(this).closest('tr').remove();
  	     return false;
  	 });
  	 $('#placeOrder').click(function(event) {
  		var productName= Array(); 
  		var quantity=Array();
  		var price=Array();
  		var CustomerNo=$("#CustomerNo").val();
  		$("#dbtable tr").each(function(i, v){
  			productName[i] = Array();
		    $(this).children('#productName').each(function(ii, vv){
		    	productName[i][ii] = $(this).text();
		    	alert(productName[i][ii]);
		    		    }); 
		});
		$("#dbtable tr").each(function(i, v){
			quantity[i] = Array();
	    $(this).children('#quantity').each(function(ii, vv){
	    	quantity[i][ii] = $(this).text();
	    	alert(quantity[i][ii]);
	    }); 
	});
		$("#dbtable tr").each(function(i, v){
			price[i] = Array();
	    $(this).children('#price').each(function(ii, vv){
	    	price[i][ii] = $(this).text();
	    	alert(price[i][ii]);
	    }); 
	});

  		$.ajax({
  		type:"POST",
		url:"SubOrder",
		data:{
			
			CustomerNo1:CustomerNo,
			"productName[]":productName,
	  		 "quantity[]":quantity,
	  		" price[]":price
		},
		datatype:"json",
		success:function(data){
		}
  		});
  	  	 });
	
});
           

