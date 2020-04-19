$(document).ready(function(){
    	$("#material").submit(function(event){
    		var MtName=$("#MTName").val();
    		var MTWeight=$("#MTWeight").val();
    		var MTprice=$("#MTPrice").val();
    	//	var MTMovingP=$("#MmPrice").val();
    		var MTDescr=$("#MtDescription").val();
    		var Mttype=$("#combo1").val();
    		$.ajax({
    			type:"Post",
    		    url:"MaterialServlet",
    		    data:{
    		    	mmName:MtName,
    		    	mmWeight:MTWeight,
    		    	mmPrice:MTprice,
    		    
    		    	mmDesc:MTDescr,
    		    	mmcombo:Mttype,
    		    	
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
