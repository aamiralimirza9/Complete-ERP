$(document).ready(function(){
	
	$.ajax({
	type:"post",
	url:"SaveProduct",
	datatype:"json",
	success:function(data){
		
		var select=$('#productTypeName');
		select.find('option').remove();
		for(var a=0 ; a<data.length; a++)
		{					var bb=	data[a];
				
		   $('<option>').val(bb.productCategoryName).text(bb.productCategoryName).appendTo(select);
					
					
					}	}	
			
	
	});
	
	$("#form1").submit(function() {
		
		var pName=$("#pName").val();
		var pPrice=$("#pPrice").val();
		var pPlant=$("#pPlant").val();
		var sLoc=$("#sLoc").val();
		var matGroup=$("#matGroup").val();
		var unit=$("#unit").val();
		var weight=$("#weight").val();
		var productTypeName=$("#productTypeName").val();
		
		$.ajax({
			type:"POST",
			url:"SaveProduct",
			data:{
				pName1:pName,
				pPrice1:pPrice,
				pPlant1:pPlant,
				sLoc1:sLoc,
				matGroup1:matGroup,
				unit1:unit,
				weight1:weight,
				productTypeName1:productTypeName,
			},
			datatype:"json",
			success:function(data){
				for(var a=0 ; a<data.length; a++)
				{					var bb=	data[a];
				}
			}
		});
	});
	
	
	
});