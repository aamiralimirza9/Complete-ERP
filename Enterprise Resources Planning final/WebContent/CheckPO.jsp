<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Production And Planning</title>
    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

     <script src="js/jquery.js"></script>
    <!--  <script>
        $(document).ready+("click",".open-AddBookDialog",function(){
  	    	var pname=$(this).data('name');
  	    	alert(pname);
  	    	var quan=$(this).data('quan');
  	    	var prc=$(this).data('pr');
  	    	$(".modal-body #productName").val(pname);
  	    	$(".modal-body #quantity").val(quan);
  	    	$(".modal-body #price").val(prc);

  	      });
  	      
        </script>    -->
        
           <% String s=(String)session.getAttribute("uname");%>
          <script>
          $(document).ready(function() {
          	

        	  $("#masterData").hide();
              $("#MainMenu").hide();
              $("#toDoList").hide();
              $("#charts").hide();
              $("#f").hide();
              $("#c").hide();
       	    var testvalue= "<%=s%>"

       	        if(testvalue=="null"){
       	        	window.location.href = "login.jsp";
                      
               	    }	
       if(testvalue!="null"){   
       	$.ajax({
       		type:"POST",
       		url:"account",
       		data:{
       			permission:testvalue,
       	
       		},
       		datatype:"json",
       		success:function(data){
       		
       			
       	           
       			for(var a=0 ; a<data.length; a++)
       			{	var bb=	data[a];
       			
       			var nam="#"+bb.rolename;
       				
       					   $(nam).show();
       	    				}
       	    	
       		}

       			
       		
       		});
           	


       	
                 }

     		});

          </script>
        
     <SCRIPT >
     $(document).ready(function() {

  		$("#orderId").keyup(function(){

  			 $("#edit").modal("show");
    		
    		var orderId=$("#orderId").val();
    		$(' #Materialshow tr:not(:first)').remove();
    		$.ajax({
    			Type:"POST",
    			url:"checkOrder",
    			data:{
    				orderId1:orderId,
    				
    			},
    			datatype:"json",
    			success:function(data) {
    				for(var a=0 ; a<data.length; a++)
    				{	
    					var bb=	data[a];
      		      		$('#Materialshow tr').eq(0).after('<tr><td>'+bb.productName+'</td><td>'+bb.quantity+'</td><td>'+bb.price+'</td></tr>');  					

    				}
    			}
    		});
    		
    	});
  		$("#save").click(function(){
  			var orderId=$("#orderId").val();
  			var po=$("#po").val();
  		  
  		  window.open('ProductionInventory.jsp?somval=' +orderId+'&po='+po );
  	
  		});
    
     
     
  		$("#po").keyup(function(){

			 $("#edit").modal("show");
  		
  		var orderId=$("#status").val();
  		$(' #Materialshow tr:not(:first)').remove();
  		$.ajax({
  			Type:"POST",
  			url:"checkOrder",
  			data:{
  				status:orderId,
  				
  			},
  			datatype:"json",
  			success:function(data) {
  				for(var a=0 ; a<data.length; a++)
  				{		
  					var bb=	data[a];
    		      		$('#Materialshow tr').eq(0).after('<tr><td>'+bb.productName+'</td><td>'+bb.quantity+'</td><td>'+bb.price+'</td></tr>');  					

  				}
  			}
  		});
  		
  	});

     
     });
     
	    </SCRIPT>
    <!-- Custom styles for this template -->
    <link href="view/assets/css/style.css" rel="stylesheet">
    <link href="view/assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
  </head>

  <body>

  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="index.html" class="logo"><b>GALAXY ERP</b></a>
            <!--logo end-->
      
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="login.jsp">Logout</a></li>
            	</ul>
            </div>
        </header>
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	
              	  	
                  <li class="mt">
                      <a  href="dashboard.jsp">
                          <i class="fa fa-dashboard"></i>
                         <span>dashboard</span>
                         
                      </a>
                  </li>
                  <li class="sub-menu" id="todolist">
                      <a href="salesTodoList.jsp">
                          <i class="fa fa-desktop"></i>
                          <span>To Do List</span>
                      </a>
                      </li>
                  

                  <li class="sub-menu">
                      <a  href="javascript:;" >
                          <i class="fa fa-desktop"></i>
                          <span>Master Data</span>
                      </a>
                      <ul class="sub">
                      
                      <li><a  href="#">Bill of Material</a></li>
                       
                          
                      </ul>
                  </li>

                   <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-cogs"></i>
                          <span>Main menu</span>
                      </a>
                      <ul class="sub">
                          
                           <li><a class="active"  href="OrderTable.jsp">Production Order</a></li>
                          <li><a class="active" href="ProductionInventory.jsp">ProductionInventory</a></li>
                           <li><a class="active"  href="CheckPO.jsp"> Order Check</a></li>
                       
                      </ul>
                  </li>
                  
                  
                 </ul>
                  
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar start-->
            <!--sidebar end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i>Product And Planning </h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	 <div class="panel panel-primary">
          	 		<div class="panel-heading">Check Order Detail</div>
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	
                  	  <!-- FORM -->
                      <form class="form-horizontal style-form" >
                         
                           <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label"> Order Status </label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" id="orderId" required>
                              </div>
                          </div>
                          
                           <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Production Order  </label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" id="po" required>
                              </div>
                          </div>
                      
                           <button  class="btn btn-theme"  id="save">Add</button>
                         
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
        <div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
      </div>
          <div class="modal-body">
          <div class="form-group">
         
              <table id="Materialshow" class="table table-bordered table-striped table-condensed cf">
                   <tbody>
                   <thead>
                   <tr>
                   <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                      
                       </tr>
                       
                   </thead>
    </tbody>
        
</table>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    </div>
      
  </section>
</section>
    <!-- js placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <!--script for this page-->
    <script src="assets/js/jquery-ui-1.9.2.custom.min.js"></script>

	<!--custom switch-->
	<script src="assets/js/bootstrap-switch.js"></script>
	
	<!--custom tagsinput-->
	<script src="assets/js/jquery.tagsinput.js"></script>
	
	<!--custom checkbox & radio-->
	
	<script type="text/javascript" src="assets/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap-daterangepicker/date.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap-daterangepicker/daterangepicker.js"></script>
	
	<script type="text/javascript" src="assets/js/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
	
	
	<script src="assets/js/form-component.js"></script>    
    
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>
    