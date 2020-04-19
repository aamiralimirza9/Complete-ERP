$(document).ready(function(){
$("#save").click(function(event) {
	var cId12=$("#cId").val();
   var ddate=$("#dDate").val();
    
   var orderStatus=$("#oStatus").val();
   var radioValue = $("input[name='optradio']:checked").val();
	  var radioValue1 = $("input[name='optradio1']:checked").val();
	$.ajax({
		type:"POST",
		url:"ordercheck",
		data:{
			cId2:cId12,
			dDate1:ddate,
		    OStatus1:orderStatus,
		    mtb:radioValue,
		    mto:radioValue1,
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
	 

	