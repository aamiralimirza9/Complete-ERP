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

    <title>Enterprise Resource Planning</title>
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
        <script type="text/javascript" src="js/bootstrap-datetimepicker.j"></script>
        
       
        
        
    
          <% String s=(String)session.getAttribute("uname");%>
          <script>
          $(document).ready(function() {

        	    $("#productName").keyup(function(event){
        			 var productId=$("#productName").val();

        				
        				
        				$.ajax({
        					type:"Post",
        					url:"SubOrder",
        					data:{
        						productId:productId,
        				
        					},
        					datatype:"json",
        					success:function(data){
        						for(var a=0 ; a<data.length; a++)
        			    		{					var bb=	data[a];
        			    		$("#productName").val(bb.productName).text(bb.productName).appendTo("#productName");
        			    			
        			    					
        			    					
        			    		}
        					}
        					
        						
        					
        					
        					
        				});
        				});

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
        
        $(document).ready(function(){
        	
            $('#addtoOrderList').click(function(event) {
           	
         		var quantity =$("#quantity").val();
         		var productName =$("#productName").val();
         		var price =$("#price").val();     
           		$('#dbtable tr').eq(0).after('<tr><td colspan="1" id="productName">'+productName+'</td><td colspan="1" id="quantity" >'+quantity+'</td><td colspan="1" id="price"> '+price+'</td><td><button type="button" class="removebutton" title="Remove this row">X</button></tr>');  
           	        });
       	 $(document).on('click', 'button.removebutton', function () {
       	 
       	     $(this).closest('tr').remove();
       	     return false;
       	 });
       	 $('#placeOrder').click(function(event) {
       		 var h="hi";
       		var productName= Array(); 
       		var quantity=Array();
       		var price=Array();
       		var CustomerNo=$("#CustomerNo").val();
       		$("#dbtable tr").each(function(i,v){
       			productName[i] = Array();
     		    $(this).children('#productName').each(function(ii,vv){
     		    	productName[i][ii] = $(this).text();
     		    
     		    		    }); 
     		});
     		$("#dbtable tr").each(function(i, v){
     			quantity[i] = Array();
     	    $(this).children('#quantity').each(function(ii, vv){
     	    	quantity[i][ii] = $(this).text();
     	    	
     	    }); 
     	});
     		
     		$("#dbtable tr").each(function(i, v){
     			price[i] = Array();
     	    $(this).children('#price').each(function(ii, vv){
     	    	price[i][ii] = $(this).text();
     	    	
     	    	
     	    }); 
     	});

       		$.ajax({
       		type:"POST",
     		url:"SubOrder",
     		data:{
     			
     			CustomerNo1:CustomerNo,
     			"productName[]":productName,
     	  		 "quantity[]":quantity,
     	  		"price[]":price,
     	  		key:h,
     		},
     		datatype:"json",
     		success:function(data){
     			window.open("demo?name=makeToStock");
     		}
       		});
       	  	 });
        });
   		
     
        </SCRIPT>
     
     
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
      <!--sidebar start-->
        <!--sidebar start-->
                    <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              <li class="mt">
                      <a href="index.html">
                          <i class="fa fa-dashboard"></i>
                          <span>Dashboard</span>
                      </a>
                  </li>
                  <li class="sub-menu" id="todolist">
                      <a href="salesTodoList.jsp">
                          <i class="fa fa-desktop"></i>
                          <span>To Do List</span>
                      </a>
                      </li>
                      
                  <li class="sub-menu" id="masterdata">
                      <a href="javascript:;" >
                          <i class=" fa fa-tasks"></i>
                          <span>Master Data</span>
                      </a>
                      <ul class="sub">
                      
                          <li><a  href="customer.jsp">Customer</a></li>
                          <li><a  href="channel.jsp">channel</a></li>
                          <li><a  href="company.jsp">Company</a></li>
                          <li><a  href="product.jsp">Product</a></li>
                          <li><a  href="productType.jsp">Product Type</a></li>
                          <li><a  href="route.jsp">Route</a></li>
                      
                   
                      </ul>
                  </li>
                  <li class="sub-menu" id="menu">
                      <a href="javascript:;" >
                          <i class="fa fa-book"></i>
                          <span>Main Menu</span>
                      </a>
                      <ul class="sub">
                        <li><a  href="order.jsp"> Sales Order</a></li>
                          <li><a  href="CheckOrder.jsp">Check Order</a></li>
                          <li><a  href="paymentRecipt.jsp">Payment Recipet</a></li>
                          
                          <li><a  href="makeToBuy.jsp">Make to Buy</a></li>
                          <li><a  href="makToStock.jsp">Make to stock</a></li>
                         <li><a  href="delivery.jsp">Sale Delivery</a></li>
                         
                      </ul>
                  </li>                  
           <!--         <li class="sub-menu"  id="report">
                      <a href="javascript:;" >
                          <i class=" fa fa-bar-chart-o"></i>
                          <span>Reporting</span>
                      </a>
                      <ul class="sub">
                       <li><a  href="OrderInvoice.jsp">Order Invoice</a></li>
                       <li><a  href="SellInvoice.jsp">Sale Invoice</a></li>
                       
                      </ul>
                       -->
                  </li>
                 
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
   
            <!--sidebar end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h2><i class="fa fa-angle-right"></i> Sales And Distribution</h2>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	 <div class="panel panel-primary">
          	 		<div class="panel-heading">Make To Stock Order</div>
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  
                  	  <!-- FORM -->
                      <form class="form-horizontal style-form" >
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Product Name</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" id="productName" required>
                              </div>
                          </div>
                       
                         <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Enter Quantity</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" id="quantity" required>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Enter Price</label>
                              <div class="col-sm-10">
                                  <input type="name" class="form-control" id="price" required>
                              </div>
                          </div>
                          
                         
                         <input type="button"  value="add" class="btn btn-theme" id="addtoOrderList" >
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
         			
			  	<div class="panel panel-primary">
          	 		<div class="panel-heading">Order List</div>
          	<div class="row mt">
          	<div class="col-lg-12">
                      	<div class="col-lg-6">
            		  <table id="dbtable" class="table table-bordered table-striped table-condensed">
                              <thead>
                              <tr>
                              
                              <th>Product Name</th>
                                  <th>Quantity</th>
                                  <th>Price</th>
                                  <th>Delete</th>
                                                    </tr>
                              </thead>
                                         <tbody>
                              </tbody>
                          </table>
                          
          <button type="submit"  id="placeOrder"   class="btn btn-theme">Place Order</button>           
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
    
    
  

  </body>
</html>
