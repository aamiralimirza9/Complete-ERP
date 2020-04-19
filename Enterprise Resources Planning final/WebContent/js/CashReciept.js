    $(document).ready(function(){

    	$('#enter').click(function(event){
    	var mode='reciept';
    	alert("it is"+mode);
   		var nam=$("#nam").val();        
   		var ac=$("#actitle").val();
   		var amount=$("#amount").val();
   		var type=  $("#type").val();
   		var memo= $("#memo").val();
   		alert(nam+ac+amount+type+memo+mode);
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
    			
