$(document).ready(function(){
	 $("#prId").keyup(function(event){
		 $('#edit').modal('toggle');
		 
	
		 
		 
	
	 var prId=$("#prId").val();
           
	           
		$.ajax({
			type:"Post",
			url:"ModalServlet",
			data:{
				prid:prId,
				
				
			},
			datatype:"json",
			success:function(data){
				for(var a=0 ; a<data.length; a++)
	    		{					var bb=	data[a];
	    		
	    		alert(bb.Mprice);
	    		$(' #data tr').eq(0).after(' <tr><td>'+bb.PrId+'</td><td>'+bb.MaterialNo+'</td><td>'+bb.PrQuantity+'</td><td>'+bb.Mprice+'</td></tr>data-toggle="modal" data-target="#edit"');  					
	    	
	    	/*		$(".modal-body #MaterialId").val(bb.MaterialNo).text(bb.MaterialNo).appendTo(".modal-body #MaterialId");
	    			$(".modal-body #prQuantity").val(bb.PrQuantity).text(bb.PrQuantity).appendTo(".modal-body #prQuantity");
	    			$(".modal-body #Price").val(bb.Mprice).text(bb.Mprice).appendTo(".modal-body #Price");
	    			
	    			*/
	    		}
			}
		});
	 });
	 
	
	 
	 /*
		$("#mod").click(function(event){
	//	$('#edit').modal('toggle');
		var MaterailNo=$(".modal-body #MaterialId").val();
		var MaterialQuantity=$(".modal-body #prQuantity").val();
		var MaterialPrice=$(".modal-body #Price").val();
		
		$('#Materialshow tr').eq(0).after('<tr><td colspan="1" id="materialId" class="1price">'+MaterailNo+'<td colspan="1" id="prQuantity" class="prquantity">'+MaterialQuantity+'</td><td colspan="1" id="MPrice" class="price">'+MaterialPrice+'<td><Button type="button" class="removebutton" title="remove this row">X</Button></td></tr>');
			
			
			
			
		});
		

		 $(document).on('click', 'button.removebutton', function () {
		 
		     $(this).closest('tr').remove();
		     return false;
		 });
		 
		 
		 

		 $("#total").click(function(event){
		    var grid=$("#GrId").val();
			var  tabledata=Array();
			var  tablePrice=Array();
			var  tabletotal=Array();
			var  tablePrQuantity=Array();
			
			var totaltax=33;
			var sum=0;
			var total=0;
			alert("byeeeeeeeeeeeee")
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
					$(this).children('#materialId').each(function(ii,vv){
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
				
	             
	             
				
				
				
				$.ajax({
					type:"POST",
					url:"ModalServlet",
					data:{
						
						"tableName[]":tabledata,
						
						"tableprice[]":tablePrice,
						"tableprQuantity[]":tablePrQuantity,
					
						 GRID:grid,
						
				
				
					},
					datatype:"json",
	  	    		success:function(data){

	  	 		      
	  	    		}
				});
				

			
		});
		
		
		*/
	});    

		

