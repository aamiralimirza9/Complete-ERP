$(document).ready(function(){
	$("#vendor").submit(function(event){
		var Vname=$("#VendorName").val();
		var companyTitle=$("#CompanyName").val();
		var companyAddress=$("#comapyAddress").val();
		var VcContact=$("#copmanyContact").val();
		var VcMobile=$("#MobileNumber").val();
		var VcNtn=$("#companyNtnNumber").val();
		var bankname=$("#BankName").val();
	    var bankAccount=$("#BAccount").val();
		$.ajax({
			type:"Post",
			url:"VendorServlet",
			data:{
				Vname:Vname,
				VcompanyTitle:companyTitle,
				VcompanyAddress:companyAddress,
				VContact:VcContact,
				VMobile:VcMobile,
				VNtn:VcNtn,
				Bankname:bankname,
				Bankaccount:bankAccount,
		
			},
			datatype:"json",
			success:function(data){
				for(var a=0 ; a<data.length; a++)
	    		{					var bb=	data[a];
	    			document.getElementById("first").innerHTML+=bb.Mt_name;
	    			
	    					
	    					
	    		}
			}
			
				
			
			
			
		});
		
			
		
		
		
		
	});
	
});