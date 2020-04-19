$(document).ready(function(){
$("#save").click(function(event) {

	 
		var cId="#cId".val();
		alert('hello');
		$.ajax({
			type:"POST",
			url:"SaveProduct",
			data:{
				cId1:cId,
				
			},
			datatype:"json",
			success:function(data){
				
			
				alert(data);
				
			},
			error: function(){
                alert("error");
            }
		});
	});
$("#makToSell").click(function() {
	window.location.href='makToSell.jsp';
});
$("#makeToBuy").click(function() {
	window.location.href='makeToBuy.jsp';
});
});
	