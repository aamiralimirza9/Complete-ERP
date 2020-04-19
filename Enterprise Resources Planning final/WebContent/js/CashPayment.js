    $(document).ready(function(){

    	$('#enter').click(function(event){
    	var mode="payment";	
    	alert("it is"+mode);
   		var date=$("#nam").val();        
   		var ac=$("#actitle").val();
   		var amount=$("#amount").val();
   		var type=  $("#type").val();
   		var memo= $("#memo").val();
   		alert(date+ac+amount+type+memo+mode);
    		$.ajax({
    		type:"POST",
    		url:"AccountReciept",
    		data:{
    			acdate:date,
    			acname:ac,
    			acamount:amount,
    			actype:type,
    			acmemo:memo,
    			acmode:mode,
    		},
    		datatype:"json",
    		success:function(data){

    	    	   var select = $('#player');
    	           select.find('option').remove();
    			
    		}

    			
    			
    		});
	});	
	});	
    			
