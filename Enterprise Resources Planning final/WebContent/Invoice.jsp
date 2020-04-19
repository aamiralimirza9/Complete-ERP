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
    <script src="js/jquery.js"></script>
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
      	    

      			var temp='ghq'
      				 
      	      $.ajax({
      	    	  type:"POST",
      	  		url:"Delivery", 
      	  		data:{
      	  			temp1:temp,
      	  		},
      	  		datatype:"json",
      			success:function(data){
      		
      			for(var a=0 ; a<data.length; a++)
      			{					var bb=	data[a];
      			 
		      		$('#ordertable tr').eq(0).after(' <tr><td id="pName">'+bb.productName+'</td><td id="quan">'+bb.quantity+'</td><td class="price" id="p">'+bb.price+'</td></tr>');  					


      						}
      			}
      	      });
      			
      			
});
        </SCRIPT>
         <SCRIPT >
$(document).ready(function() {
      	    

      			var temp1='robot'
      				 
      	      $.ajax({
      	    	  type:"POST",
      	  		url:"Delivery", 
      	  		data:{
      	  			temp2:temp1,
      	  		},
      	  		datatype:"json",
      			success:function(data){
      		
      			for(var a=0 ; a<data.length; a++)
      			{					var bb=	data[a];
		      		$('#deliveryTable tr').eq(0).after(' <tr><td>'+bb.dId+'</td><td id="des">'+bb.dDescription+'</td><td id="dDate">'+bb.dDate+'</td><td id="dFrom">'+bb.dFrom+'</td><td id="dTo">'+bb.dTo+'</td><td id="weight">'+bb.weight+'</td><td id="rId">'+bb.routId+'</td><td id="cNo">'+bb.contactNo+'</td><td id="vId">'+bb.venderId+'</td><td id="cusNo">'+bb.customerNo+'</td><td id="pr">'+bb.price+'</td><td id="vechileNo">'+bb.vechileNo+'</td><td id="dName">'+bb.driverName+'</td></tr>');  					

     		  

      						}
      			}
      	      });
      			
});
        </SCRIPT>
       
        <script>
        $(document).ready(function(){
        $('#save').click(function(){
		  	    var d='place';
		  		var productName= Array(); 
		  	 	var quantity=Array();
		  	 	var price=Array();
		  	 	var description= Array(); 
		  	 	var dDate= Array(); 
		  	 	var dFrom= Array(); 
		  	 	var dTo= Array(); 
		  	 	var weight= Array(); 
		  	 	var rId= Array(); 
		  	 	var cNo= Array(); 
		  	 	var vId= Array(); 
		  	 	var cNum= Array(); 
		  	 	var price1= Array(); 
		  	 	var vechileNo= Array(); 
		  	 	var drvrName= Array(); 
		  	 	
		  	 	
		  	 	  
		  	
		  	 	 $("#ordertable tr").each(function(i,v){
		  	 			productName[i] = Array();
		  			    $(this).children('#pName').each(function(ii,vv){
		  			    	productName[i][ii] = $(this).text();
		  			    		    }); 
		  			});
		  	 	 $("#ordertable tr").each(function(i, v){
		  				quantity[i] = Array();
		  		    $(this).children('#quan').each(function(ii, vv){
		  		    	quantity[i][ii] = $(this).text();
		  		    }); 
		  		});
		  	 	 $("#ordertable tr").each(function(i, v){
					price[i] = Array();
				    $(this).children('#p').each(function(ii, vv){
				    	price[i][ii] = $(this).text();
				    
				    }); 
				});
		  	 	$("#deliveryTable tr").each(function(i, v){
		  	 		description[i] = Array();
				    $(this).children('#des').each(function(ii, vv){
				    	description[i][ii] = $(this).text();
				    
				    }); 
				});
		  	 	$("#deliveryTable tr").each(function(i, v){
		  	 		dDate[i] = Array();
				    $(this).children('#dDate').each(function(ii, vv){
				    	dDate[i][ii] = $(this).text();
				    
				    }); 
				});
		  	 	$("#deliveryTable tr").each(function(i, v){
		  	 		dFrom[i] = Array();
				    $(this).children('#dFrom').each(function(ii, vv){
				    	dFrom[i][ii] = $(this).text();
				    
				    }); 
				});
		  	 	$("#deliveryTable tr").each(function(i, v){
		  	 		dTo[i] = Array();
				    $(this).children('#dTo').each(function(ii, vv){
				    	dTo[i][ii] = $(this).text();
				    
				    }); 
				});
		  	 	$("#deliveryTable tr").each(function(i, v){
		  	 		weight[i] = Array();
				    $(this).children('#weight').each(function(ii, vv){
				    	weight[i][ii] = $(this).text();
				    alert(weight[i][ii] );
				    }); 
				});
		  	 	$("#deliveryTable tr").each(function(i, v){
		  	 		rId[i] = Array();
				    $(this).children('#rId').each(function(ii, vv){
				    	rId[i][ii] = $(this).text();
				    
				    }); 
				});
		  	 	$("#deliveryTable tr").each(function(i, v){
		  	 		cNo[i] = Array();
				    $(this).children('#cNo').each(function(ii, vv){
				    	cNo[i][ii] = $(this).text();
				    
				    }); 
				});
		  	 	$("#deliveryTable tr").each(function(i, v){
		  	 		vId[i] = Array();
				    $(this).children('#vId').each(function(ii, vv){
				    	vId[i][ii] = $(this).text();
				    
				    }); 
				});
		  	 	$("#deliveryTable tr").each(function(i, v){
		  	 		cNum[i] = Array();
				    $(this).children('#cusNo').each(function(ii, vv){
				    	cNum[i][ii] = $(this).text();
				    
				    }); 
				});
		  	 	$("#deliveryTable tr").each(function(i, v){
		  	 		price1[i] = Array();
				    $(this).children('#pr').each(function(ii, vv){
				    	price1[i][ii] = $(this).text();
				    
				    }); 
				});
		  	 	$("#deliveryTable tr").each(function(i, v){
		  	 		vechileNo[i] = Array();
				    $(this).children('#vechileNo').each(function(ii, vv){
				    	vechileNo[i][ii] = $(this).text();
				    
				    }); 
				});
		  	 	$("#deliveryTable tr").each(function(i, v){
		  	 		drvrName[i] = Array();
				    $(this).children('#dName').each(function(ii, vv){
				    	drvrName[i][ii] = $(this).text();
				    
				    }); 
				});
		  	 	$.ajax({
		  	   		type:"POST",
		  	 		url:"Invoice",
		  	 		data:{
		  	 			d1:d,
		  	 			 "productName[]":productName,
		  	 	  		 "quantity[]":quantity,
		  	 	  		 "price[]":price,
		  	 	  	     "description[]":description,
		  	 	  	     "dDate[]":dDate ,
		  	 	         "dFrom[]":dFrom ,
		  	 	         "dTo[]":dTo,
		  	 	         "weight[]":weight ,
		  	 	         "rId[]":rId,
		  	         	 "cNo[]":cNo,
		  	 	         "vId[]":vId ,
		  	 	         "cNum[]":cNum ,
		  	 	         "price1 []":price1,
		  	 	         "vechileNo []":vechileNo  ,
 	 	  	             "drvrName[]":drvrName ,

		  	 		},
		  	 		datatype:"json",
		  	 		success:function(data){
		  	 		}
		  	   		});
		  			   
		  		   });
		  
		      
		      	});
        </script>
         <SCRIPT>
        $(document).ready(function(){
        
         $('#print').click(function(){
         	

	    var name='report8';        

		
		$.ajax({
		type:"POST",
		url:"demo",
		data:{
			name:name,
	
		},
		datatype:"json",
		success:function(data){
			
			window.open("demo?name=report8");
	           
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
                          <li><a  href="company.jsp">Company</a></li>
                          <li><a  href="product.jsp">Product</a></li>
                          <li><a  href="productType.jsp">Product Type</a></li>
                          <li><a  href="showVendor.jsp">Show Vendor</a></li>
                          <li><a  href="showCompany.jsp">Show Company</a></li>
                          <li><a  href="showCustomer.jsp">Show Customer</a></li>
                          <li><a  href="showProduct.jsp">Show Product</a></li>
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
                         
                      </ul>
                  </li>                  
                  <li class="sub-menu"  id="report">
                      <a href="javascript:;" >
                          <i class=" fa fa-bar-chart-o"></i>
                          <span>Reporting</span>
                      </a>
                      <ul class="sub">
                       <li><a  href="OrderInvoice.jsp">Order Invoice</a></li>
                       <li><a  href="SellInvoice.jsp">Sale Invoice</a></li>
                       
                      </ul>
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
                 	        
   
          	<h3><i class="fa fa-angle-right"></i>Sales and Distribution</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          		 <div class="panel panel-primary">
          	        	 <div class="panel-heading">Sales Invoice</div>
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Sell Invoice</h4>
                      <table class="table" id="ordertable">
  <thead class="thead-inverse">
    <tr>
      <th>Product Name</th>
      <th>Quantity</th>
      <th>Price</th>
    </tr>
  </thead>
  <tbody>
   
  </tbody>
</table>

      </div>
         <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Delivery Invoice</h4>
                      <table class="table" id="deliveryTable">
  <thead class="thead-inverse">
    <tr>
      <th>Delivery Idss</th>
      <th>Description</th>
      <th>Delivery Date</th>
      <th>Delivery From</th>
      <th>Delivery To</th>
      <th>Weight</th>
      <th>Route Id</th>
      <th>Contact Number</th>
      <th>Vendor Id</th>
      <th>Customer Number</th>
      <th>Price</th>
      <th>Vechile Number</th>
      <th>Driver Name</th>
     
    </tr>
  </thead>
  <tbody>
   
  </tbody>
</table>
<button type="button" class="btn btn-primary btn-sm" id="save">Save</button>
<button type="button" class="btn btn-primary btn-sm" id="print">Print</button>

      </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
          	
          	
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
                     <a href="form_component.html#" class="go-top">
                  <i class="mainmenu.jsp"></i>
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

     
  </script>

  </body>
</html>
