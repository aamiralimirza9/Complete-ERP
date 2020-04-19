$(document).ready(function(){
	
	$("#form1").submit(function(event) {
		var companyName=$("#companyName").val();
		var companyNumber=$("#companyNumber").val();
		var companyAddress=$("#companyAddress").val();
		var companyPhone=$("#companyPhone").val();
		var companyOwner=$("#companyOwner").val();
		$.ajax({
			Type:"POST",
			url:"Save",
				data:{
					companyName1:companyName,
					companyNumber1:companyNumber,
					companyAddress1:companyAddress,
					companyPhone1:companyPhone,
					companyOwner1:companyOwner,
				},
				datatype:"json",
				success:function(data){
				}
		});
	 	window.location.href = "fiscalmonths.jsp";
	});
});