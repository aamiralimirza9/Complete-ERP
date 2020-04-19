$(document).ready(function(){
	
	$("#btn2").click(function(event){
		
		var materialNo=$("#Materialid").val();
		
		
		var prQuantity=$("#mtQuantity").val();
		
		
		
		
		$('#Materialshow tr').eq(0).after('<tr><td colspan="1" id="display" class="1price">'+materialNo+'</td><td colspan="1" id="prQuantity" class="prquantity">'+prQuantity+'</td><td><Button type="button" class="removebutton" title="remove this row">X</Button></td></tr>');
		
		
		
	});

	 $(document).on('click', 'button.removebutton', function () {
	 
	     $(this).closest('tr').remove();
	     return false;
	 });

	

	

	
	 $("#total").click(function(event){
	    var prId=$("#mpId").val();
		var  tabledata=Array();
	

		var  tablePrQuantity=Array();

		
		
		$(".price").each(function(){
			var value=$("this").text();
			//adding the value in only numbers 
			
			
			
		});
		
		
	
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
				
			    tablePrQuantity[i]=Array();
				$(this).children('#prQuantity').each(function(ii,vv){
					tablePrQuantity[i][ii]=$(this).text();
				});
			});
			
             
			
			
			
			
			
			$.ajax({
				type:"POST",
				url:"tryServlet",
				data:{
					
					"tableName[]":tabledata,
					
					
					"tableprQuantity[]":tablePrQuantity,
				
					 PRID:prId,
					
				//	b:a,
			
			
				},
				datatype:"json",
  	    		success:function(data){

  	 		
  	    		}
			});

		
	});
	
	
});              