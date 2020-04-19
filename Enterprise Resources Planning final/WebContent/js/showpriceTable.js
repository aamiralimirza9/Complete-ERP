$(document).ready(function(){
	
	$("#btn2").click(function(event){
		
		var materialNo=$("#MaterialId").val();
		
		var MPrice=$("#MtPrice").val();
		var prQuantity=$("#PrQuantity").val();
		var prStatus=$("#PrStatus").val();
		
		
		
		$('#Materialshow tr').eq(0).after('<tr><td colspan="1" id="display" class="1price">'+materialNo+'</td><td colspan="1" id="MPrice" class="price">'+MPrice+'</td><td colspan="1" id="prQuantity" class="prquantity">'+prQuantity+'</td><td colspan="1" id="prStatus" class="prstu">'+prStatus+'</td><td><Button type="button" class="removebutton" title="remove this row">X</Button></td></tr>');
		
		
		
	});

	 $(document).on('click', 'button.removebutton', function () {
	 
	     $(this).closest('tr').remove();
	     return false;
	 });

	

	

	
	 $("#total").click(function(event){
	    var prId=$("#PrID").val();
		var  tabledata=Array();
		var  tablePrice=Array();
		var  tabletotal=Array();
		var  tablePrQuantity=Array();
		var  tablePrStatus=Array();
		var totaltax=33;
		var sum=0;
		var total=0;
		$(".price").each(function(){
			var value=$("this").text();
			//adding the value in only numbers 
			if(!isNaN(value)&& value.length !=0){
				sum+=parseFloat(value);
			}
			
			
		});
		$("<td colspan='2' class='price' id='sum'>"+sum+"</td>")//.insertAfter('#Materialshow tr td:last')
		$(".price").each(function() {

		    var value = $(this).text();
		    // add only if the value is number
		    if(!isNaN(value) && value.length != 0) {
		        total += parseFloat(value);
		    }
		  
		});
		
		$("<td colspan='2'>"+total+"</td>").insertAfter('#Materialshow tr td:last');
	
			window.alert("successfull");
			var header=Array();
			$("table tr th").each(function(i, v){
			        header[i] = $(this).text();
			})
			               
			alert(header);
			//var a="s";
			$("#Materialshow tr").each(function(i,v){
				
				tabledata[i]=Array();
				$(this).children('#display').each(function(ii,vv){
					tabledata[i][ii]=$(this).text();
					
				});  
				
			});   
			$("#Materialshow tr").each(function(i,v){
				
				tablePrice[i]=Array();
				$(this).children('#MPrice').each(function(ii,vv){
					tablePrice[i][ii]=$(this).text();
				});
			});
			
             $("#Materialshow tr").each(function(i,v){
				
			    tablePrQuantity[i]=Array();
				$(this).children('#prQuantity').each(function(ii,vv){
					tablePrQuantity[i][ii]=$(this).text();
				});
			});
			
             
             $("#Materialshow tr").each(function(i,v){
 				
 			    tablePrStatus[i]=Array();
 				$(this).children('#prStatus').each(function(ii,vv){
 					tablePrStatus[i][ii]=$(this).text();
 				});
 			});
			
			
			
			alert("hello");
             window.open("demo?name=report9");
			$.ajax({
				type:"POST",
				url:"tableshowServlet",
				data:{
					
					"tableName[]":tabledata,
					
					"tableprice[]":tablePrice,
					"tableprQuantity[]":tablePrQuantity,
					"tableprStatus[]":tablePrStatus,
					 PRID:prId,
					
				//	b:a,
			
			
				},
				datatype:"json",
  	    		success:function(data){
  	    			alert(data);

  	    			      
  	    			
  	    		}
			});
			
			
	});
	
	
});              