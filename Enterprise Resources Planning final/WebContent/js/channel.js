$(document).ready(function() {

	$("#form1").submit(function(event) {
		//("#form1").submit();
		var route=$("#route").val();
		
		$.ajax({
			Type:"POST",
			url:"Channel",
			data:{
				route1:route,
				
			},
			datatype:"json",
			success:function(data) {
				for(var a=0 ; a<data.length; a++)
				{					var bb=	data[a];
				}
			}
		});
		
	});
});