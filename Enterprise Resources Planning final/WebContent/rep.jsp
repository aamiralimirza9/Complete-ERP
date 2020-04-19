<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
 <script src="js/jquery.js"></script>
<script>

$(document).ready(function() {   
	
	
	
	var value='report9';        

		
		$.ajax({
		type:"POST",
		url:"demo",
		data:{
			name:value
	
		},
		datatype:"json",
		success:function(data){
			window.open("demo?name=GOODissue");
			
	           
						}
	    	
		

			
			
		});
		});

</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

</body>
</html>