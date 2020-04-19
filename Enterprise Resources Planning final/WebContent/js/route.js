$(document).ready(function(){
	
	$.ajax({
	type:"post",
	url:"Route",
	datatype:"json",
	success:function(data){
		
		var select=$('#route');
		select.find('option').remove();
		for(var a=0 ; a<data.length; a++)
		{					var bb=	data[a];
				
		   $('<option>').val(bb.route).text(bb.route).appendTo(select);
					
					
					}	}	
			
	
	});
$("#save").click(function(event) {
		
		var descirption=$("#descirption").val();
		var from =$("#from").val();
		var to =$("#to").val();
		var route=$("#route").val();
		$.ajax({
			type:"POST",
			url:"Route",
			data:{
				
				descirption1:descirption,
				from1:from,
				to1:to,
				route1:route,
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
           

