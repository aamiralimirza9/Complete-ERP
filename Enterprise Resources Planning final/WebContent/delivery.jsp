<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Enterprise Resource Planning</title>

    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/jquery-ui.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
   
   	
    
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
	  <script src="js/jquery.js"></script>
         
          <script>
	
	$(function ()
	{
		$("#deliveryDate").datepicker({ dateFormat: 'yy-mm-dd'});
	});
	
	</script>
	
	
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
        $(document).ready(function(){

        	nam="ali";
        	$.ajax({
        	type:"POST",
        	url:"Delivery",
        	datatype:"json",
        	data:{
        		name2:nam,
        		
        	},
        	success:function(data){
        		
        		var select=$('#routeId');
        		select.find('option').remove();
        		for(var a=0 ; a<data.length; a++)
        		{					var bb=	data[a];
        				
        		   $('<option>').val(bb.routeId).text(bb.routeId).appendTo(select);

        					}	}	
        	});
        	var name = 'india';
        	$.ajax({
            	type:"POST",
            	url:"Delivery",
            	data:{
            		name1:name,
            	},
            	datatype:"json",
            	success:function(data){
            		var select=$('#vendorId');
            		select.find('option').remove();
            		for(var i=0 ; i<data.length; i++)
            		{					var ii=	data[i];
            		
            		   $('<option>').val(ii.vendorId).text(ii.vendorId).appendTo(select);
            					
            	
            					}	}	
            			
            	
            	});	
        	

			var dd="delivery";
			
  	      $.ajax({
  	    	  type:"POST",
  	  		url:"Delivery", 
  	  		data:{
  	  		    delivery:dd,
  	  		},
  	  		datatype:"json",
  			success:function(data){
  		
  			for(var a=0 ; a<data.length; a++)
  			{					var bb=	data[a];
  				

                    $("#deliveryid").val(bb.productTypeId+1).text(bb.productTypeId+1).appendTo("#deliveryid");

  						}
  			}
  	      });
  	      
        	$("#myForm").submit(function(event){
        		
        		var deliveryDescription=$("#deliveryDescription").val();
        		var deliveryDate=$("#deliveryDate").val();
        		var dfrom=$("#dfrom").val();
        		var dTo=$("#dTo").val();
        		var weight=$("#weight").val();
        		var routeId=$("#routeId").val();
        		var vendorId=$("#vendorId").val();
        		var cNo=$("#cNo").val();
        		
        		var orderid=$("#orderid").val();
        		var dCustomerNo='2';
        		var dPrice=$("#dPrice").val();
        		var vNo=$("#vNo").val();
        		var driverName=$("#driverName").val();
        		var did=$("#deliveryid").val();
              
        		$.ajax({
                	type:"POST",
                	url:"Delivery",
                	data:{
                		deliveryDescription1:deliveryDescription,
                		deliveryDate1:deliveryDate,
                		dfrom1:dfrom,
                		dTo1:dTo,
                		cNo1:cNo,
                		dCustomerNo1:dCustomerNo,
                		driverName1:driverName,
                		vNo1:vNo,
                		routeId1:routeId,
                		vendorId1:vendorId,
                		weight1:weight,
                		dPrice1:dPrice,
                		orderid:orderid,
                		dlvid:did,
                		
                	},
                	datatype:"json",
                	success:function(data){
                		for(var i=0 ; i<data.length; i++)
                		{					var ii=	data[i];
                			
                					}	}	
                			
                	
                	});	
     		    window.open("Invoice.jsp");

            });
        	
        });
        </SCRIPT>
            	<SCRIPT>
         $(document).ready(function(){
           	 $("#dCustomerNo").keyup(function(event){
           		var dCustomerNo=$("#dCustomerNo").val();
           
           		$.ajax({
           			type:"POST",
           			url:"Delivery",
           			data:{
           				dCustomerNo:dCustomerNo,
           				
           			},
           			datatype:"json",
           			success:function(data){
           			
           				if(data=="success"){
       					$("#check").html(" <span class='glyphicon glyphicon-ok' style='font-size:30px;color:green'></span>");
       	        		   
       				}         		
       				else{
       				 $("#check").html("<span class='fa fa-warning' style='font-size:30px;color:red'></span>");
       	           		
       				}

           			}
           			
           				
           			
           			
           			
           		});
           		});
           });
         </SCRIPT>
 
      
  </head>

  <body>

  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
   <!--header start-->
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a  class="logo"><b>GALAXY ERP</b></a>
            <!--logo end-->
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="login.jsp">Logout</a></li>
            	</ul>
            </div>
        </header>
      <!--header end-->
      
      <!--header end-->
   
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
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
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> Sales And Distribution</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	     	 <div class="panel panel-primary">
          	 		<div class="panel-heading">Order Delivery</div>
      
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Delivery</h4>
                      <form class="form-horizontal style-form"   id="myForm"  >
                                            <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Delivery Id</label>
                              <div class="col-sm-8">
                                  <input type="text" class="form-control" id="deliveryid" required>
                              </div>
                          </div>
    
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">OrderId</label>
                              <div class="col-sm-8">
                                  <input type="text" class="form-control" value=<%=request.getParameter("porder") %>  id="orderid" required>
                              </div>
                          </div>
              
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Delivery Description</label>
                              <div class="col-sm-8">
                                  <input type="text" class="form-control" name="deliveryDescription" id="deliveryDescription" required>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Delivery Date</label>
                              <div class="col-sm-8">
                                  <input type="name" class="form-control" name="deliveryDate"  id="deliveryDate" required>
                              </div>
                          </div>
                            <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Weight(KG)</label>
                              <div class="col-sm-8">
                                  <input type="text" class="form-control" name="weight" id="weight" required>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Delivery From</label>
                              <div class="col-sm-8">
                                  <input type="text" class="form-control" name="dfrom" id="dfrom" required>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Delivery To</label>
                              <div class="col-sm-8">
                                  <input class="form-control"  type="text" name="dTo" id="dTo" required>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Mobile Number</label>
                              <div class="col-sm-8">
                              <input type="text" class="form-control bfh-phone"  data-mask="9999-9999999"  name="cNo" id="cNo" required>
                              
                              </div>
                          </div>
                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Delivery Price</label>
                              <div class="col-sm-8">
                                  <input class="form-control"  type="text" name="dPrice" id="dPrice" required>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label"> Vechile Number</label>
                              <div class="col-sm-8">
                                  <input class="form-control"  type="text" name="vNo" id="vNo" required>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Driver Name</label>
                              <div class="col-sm-8">
                                  <input class="form-control"  type="text" name="driverName" id="driverName" required>
                              </div>
                          </div>
                           <div class="form-group">
                     <label class="col-sm-2 col-sm-2 control-label" for="inlineFormCustomSelect">Route Id</label>
                      <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="routeId">
                      <option selected >Choose...</option>
                      
                      
                       </select>
                       </div>
                        <div class="form-group">
                     <label class="col-sm-2 col-sm-2 control-label" for="inlineFormCustomSelect">Vender Id</label>
                      <select class="custom-select mb-2 mr-sm-2 mb-sm-0" id="vendorId">
                      <option selected >Choose...</option>
                      
                      
                       </select>
                       </div>
                           <button type="submit" class="btn btn-theme" id="save">Save</button>
                         
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
          	
          	
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              
              <a href="mainmenu.jsp" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
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
