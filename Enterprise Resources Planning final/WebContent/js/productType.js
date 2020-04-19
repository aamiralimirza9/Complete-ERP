$(document).ready(function() {
	
	$("#form1").submit(function(event) {
		var pCatName=$("#pCatName").val();
		var pName=$("#pName").val();
		var alloNumber=$("#alloNumber").val();
		$.ajax({
			type:"POST",
			url:"SaveProductType",
			data:{
				pCatName1:pCatName,
				alloNumber1:alloNumber,
				pName1:pName,
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