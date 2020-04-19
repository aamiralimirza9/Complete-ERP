<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Inventory Table</title>

        <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

        
  
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
     
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    <script src="js/jquery.js"></script>
    <script src="js/showOrderIds.js"></script>
     <script src="js/billinfo.js"></script>
     <script>
     $(document).ready(function(){
    		
    		$("#btn2").click(function(event){
    			
    			var materialNo=$("#Materialid").val();
    			
    			
    			var prQuantity=$("#mtQuantity").val();
    			
    			
    			
    			
    			$('#Materialshow tr').eq(0).after('<tr><td colspan="1" id="display" class="1price">'+materialNo+'</td><td colspan="1" id="prQuantity" class="prquantity">'+prQuantity+'</td><td><Button type="button" class="removebutton" title="remove this row">X</Button></td></tr>');
    			
    			
    			
    		});

    		 $(document).on('click', 'button.removebutton', function () {
    		 
    		     $(this).closest('tr').remove();
    		     return false;
    		 });

    		

    		

    		
    		 $("#total").click(function(event){
    		    var prId=$("#mpId").val();
    		    var ProductionID=$("#PoId").val();
    		    var OrderId=$("#OrderId").val();
    		    
    			var  tabledata=Array();
    		

    			var  tablePrQuantity=Array();

    			
    			
    			$(".price").each(function(){
    				var value=$("this").text();
    				//adding the value in only numbers 
    				
    				
    				
    			});
    			
    			
    		
    		
    				var header=Array();
    				$("table tr th").each(function(i, v){
    				        header[i] = $(this).text();
    				})
    				               
    			
    				//var a="s";
    				$("#Materialshow tr").each(function(i,v){
    					
    					tabledata[i]=Array();
    					$(this).children('#display').each(function(ii,vv){
    						tabledata[i][ii]=$(this).text();
    						
    					});  
    					
    				});   
    				
    				
    	             $("#Materialshow tr").each(function(i,v){
    					
    				    tablePrQuantity[i]=Array();
    					$(this).children('#prQuantity').each(function(ii,vv){
    						tablePrQuantity[i][ii]=$(this).text();
    					});
    				});
    				
    	            
    				
    				
    				
    				$.ajax({
    					type:"POST",
    					url:"tryServlet",
    					data:{
    						
    						"tableName[]":tabledata,
    						
    						
    						"tableprQuantity[]":tablePrQuantity,
    					
    						 PRID:prId,
    						 poid:ProductionID,
    						 orderid:OrderId,
    						
    					//	b:a,
    				
    				
    					},
    					datatype:"json",
    	  	    		success:function(data){
    	  	    			window.open("demo?name=production-inventory");
    	  	 		
    	  	    		}
    				});

    			
    		});
    		
    		
    	});              
     
     
     </script>
    
   
  </head>

  <body>

  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
   
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
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
                       
                      </ul>
                  </li>
           
              	  	
                  </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
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
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i>Partial Inventory data</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          		<div class="panel panel-primary">
          	<div class="panel-heading">Entry Form</div>
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Form Elements</h4>
                      <form class="form-horizontal style-form" >
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Main product Id</label>
                              <div class="col-sm-8">
                                  <input type="text" id="mpId" class="form-control round-form" disabled>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Production Order Id</label>
                              <div class="col-sm-8">
                                  <input type="text" id="PoId" class="form-control round-form" disabled>
                                  
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Order Id</label>
                              <div class="col-sm-8">
                                  <input type="text" id="OrderId" class="form-control round-form" >
                              </div>
                          </div>
                          
                          
                          
                           
                         
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
          	
          	<br>
          	<br>
          	
          	<div class="row mt">
          	             	<div class="col-lg-12">
                            <div class="form-panel">
                            <form  class="form-horizontal style-form" >
                            
                               <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">material id</label>
                              <div class="col-sm-8">
                                  <input type="text" id="Materialid" class="form-control ">
                              </div>
                          </div>
                            <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">quantity</label>
                              <div class="col-sm-8">
                                  <input type="text" id="mtQuantity" class="form-control ">
                              </div>
                              
                             </div>
                                <div class="form-group">
                             <center>
                              <div class="col-sm-10">
                                  <input type="button" id="btn2"  class="btn btn-theme"  value="add row">
                              </div>
                              </center>
                             </div>
                          
                           </form>
                             
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
          	<br>
                             
          	
          	
            <div class="content-panel">
                      <div class="row mt">
                      	<div class="col-lg-6">
                      	
            		  <table id="Materialshow" class="table table-bordered table-striped table-condensed">
                              <tbody>
                              <thead>
                              <tr>
                                  <th>Material no</th>
                                  <th>pr Quantity</th>
                                  <th>Remove</th>
                                  
                                            
                                                    </tr>
                              </thead>
                                           <thead>                 
            
            </thead>
                                           
                             </tbody>
                              
                          </table>
                         
                                             
                  
          </div>
                    	<div class="col-lg-6">
     
          <button type="submit"  id="total"   class="btn btn-theme">Complete</button>                                  
                   
          </div>
                
          </div></div>
         </div>
          	
          	
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
     
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
