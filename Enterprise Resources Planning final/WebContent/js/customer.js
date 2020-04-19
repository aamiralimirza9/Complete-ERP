$(document).ready(function() {

	$("#form1").submit(function(event) {
		
		var customerName=$("#customerName").val();
		var customerCompanyName=$("#customerCompanyName").val();
		var CustomerAddress=$("#CustomerAddress").val();
		var CustomerPhone=$("#CustomerPhone").val();
		var customerBankAccount=$("#customerBankAccount").val();
		$.ajax({
			Type:"POST",
			url:"SaveCustomer",
			data:{
				customerName1:customerName,
				customerCompanyName1:customerCompanyName,
				CustomerAddress1:CustomerAddress,
				CustomerPhone1:CustomerPhone,
				customerBankAccount1:customerBankAccount,
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