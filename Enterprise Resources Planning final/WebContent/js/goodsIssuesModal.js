 $(document).on("click", ".Add", function () {
     var mt_no= $(this).data('id');
     var mt_Quantity= $(this).data('nam');
     var mt_price= $(this).data('type');
     
     $(".modal-body #MtNo").val(mt_no);
     $(".modal-body #MtQuantity").val(mt_Quantity);
     $(".modal-body #Mtprice").val(mt_price);
     
});

$(document).ready(function(){
	
	 $("#InventoryId").keyup(function(event){
		 $('#edit').modal('toggle');
	
	
		 
		 
	
	 var prId=$("#InventoryId").val();
           
	           
		$.ajax({
			type:"Post",
			url:"partialIssuesServlet",
			data:{
				InVenotryId:prId,
				
				
			},
			datatype:"json",
			success:function(data){
				for(var a=0 ; a<data.length; a++)
	    		{					var bb=	data[a];
	    	     
	    		
	    		$(' #data tr').eq(0).after(' <tr><td>'+bb.PInvId+'</td><td>'+bb.MaterialId+'</td><td>'+bb.materialQuantity+'</td><td>'+bb.Mprice+'</td><td><Button type="button" data-id='+bb.MaterialId+' data-nam='+bb.materialQuantity+' data-type='+bb.Mprice+' data-toggle="modal" data-target="#edit1" class="Add" title="Add  this row">Add</Button></td></tr>data-toggle="modal" data-target="#edit"');
	    		
	    		/*	$(".modal-body #MaterialId").val(bb.MaterialNo).text(bb.MaterialNo).appendTo(".modal-body #MaterialId");
	    			$(".modal-body #prQuantity").val(bb.PrQuantity).text(bb.PrQuantity).appendTo(".modal-body #prQuantity");
	    			$(".modal-body #Price").val(bb.Mprice).text(bb.Mprice).appendTo(".modal-body #Price");
	    			
	    			*/
	    	    
	    		}
			}
		});
	 });
	 
	 
	 
	 
		$("#mod").click(function(event){
	//	$('#edit').modal('toggle');
		var MaterailNo=$(".modal-body #MtNo").val();
		var MaterialQuantity=$(".modal-body #MtQuantity").val();
		var MaterialPrice=$(".modal-body #Mtprice").val();
		var binId=$(".modal-body #binId").val();
		var Batchid=$(".modal-body #BatchId").val();
		var date1=$(".modal-body #date1").val();
		var  storage=$(".modal-body #StorageId").val();
		
		$('#Materialshow tr').eq(0).after('<tr><td colspan="1" id="materialId" class="1price">'+MaterailNo+'</td><td colspan="1" id="prQuantity" class="prquantity">'+MaterialQuantity+'</td><td colspan="1" id="MPrice" class="price">'+MaterialPrice+'</td><td colspan="1" id="BinId" class="Bid">'+binId+'</td><td colspan="1" id="BatchId" class="Batchid">'+Batchid+'</td><td colspan="1" id="date1" class="datename">'+date1+'</td><td colspan="1" id="storage" class="StId">'+storage+'</td><td><Button type="button" class="removebutton" title="remove this row">X</Button></td></tr>');
			
			
			
			
		});
		

		 $(document).on('click', 'button.removebutton', function () {
		 
		     $(this).closest('tr').remove();
		     return false;
		 });
		 
		 
		 

		 $("#total").click(function(event){
		    var grid=$("#pissuesId").val();
			var  tabledata=Array();
			var  tablePrice=Array();
			var  tabletotal=Array();
			var  tablePrQuantity=Array();
			var tableBin=Array();
			var tableBatch=Array();
			var tabledate=Array();
			var tableStorage=Array();
			
			
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
	             
	             $("#Materialshow tr").each(function(i,v){
						
	            	 tableBin[i]=Array();
						$(this).children('#BinId').each(function(ii,vv){
							tableBin[i][ii]=$(this).text();
						});
					});
	             
	             $("#Materialshow tr").each(function(i,v){
						
	            	 tableBatch[i]=Array();
						$(this).children('#BatchId').each(function(ii,vv){
							tableBatch[i][ii]=$(this).text();
						});
					});
	             
	             $("#Materialshow tr").each(function(i,v){
						
	            	 tabledate[i]=Array();
						$(this).children('#date1').each(function(ii,vv){
							tabledate[i][ii]=$(this).text();
						});
					});
				
	             $("#Materialshow tr").each(function(i,v){
						
	            	 tableStorage[i]=Array();
						$(this).children('#storage').each(function(ii,vv){
							tableStorage[i][ii]=$(this).text();
						});
					});
				
	             
	             
				
				
				
				$.ajax({
					type:"POST",
					url:"partialIssuesServlet",
					data:{
						
						"tableName[]":tabledata,
						
						"tableprice[]":tablePrice,
						"tableprQuantity[]":tablePrQuantity,
						"tablebinid[]":tableBin,
						"tablebatchid[]":tableBatch,
						"tableDate[]":tabledate,
						"tableStorage[]":tableStorage,
					
						 GRID:grid,
						
				
				
					},
					datatype:"json",
	  	    		success:function(data){

	  	 		      
	  	    		}
				});
				

			
		});
		
		
		
		
	});    


