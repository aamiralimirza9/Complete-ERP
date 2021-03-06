<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Goods Issues</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
         <script src="js/jquery.js"></script>
     <!--      <script src="js/ChangePageIssues.js"></script>   -->
         <script src="js/partialissues.js"></script>
         
        
         
         <% String s=(String)session.getAttribute("uname");%>
          <script>
          $(document).ready(function() {
          	
        	  $("#dashboard").hide();
              $("#inventory").hide();
              $("#masterdata").hide();
              $("#menu").hide();
              $("#todolist").hide();
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
          <script>
        $(document).ready(function(){
          	 $("#OrderID").keydown(function(e){
          		if(e.which == 16) {
          		var VendorId=$("#OrderID").val();
          
          		
          		$.ajax({
          			type:"Post",
          			url:"goodReciptValidation",
          			data:{
          				Mid:VendorId,
          				
          		
          			},
          			datatype:"json",
          			success:function(data){
          				
          				if(data=="success"){
      					
          					$("#check1").html(" <span class='glyphicon glyphicon-ok' style='font-size:30px;color:green'></span>");
      	        		   
      				}         		
      				else{
      				  $("#check1").html("<span class='fa fa-warning' style='font-size:30px;color:red'></span>");
      	           		
      				}

          				
        				

          			}
          			
          				
          			
          			
          			
          		});
          		}
          		});
          });
        
        
        </script>
        
          <script>
        $(document).ready(function(){
          	 $("#InvId").keydown(function(e){
          		if(e.which == 16) {
          		var VendorId=$("#InvId").val();
          
          		
          		$.ajax({
          			type:"Post",
          			url:"goodReciptValidation",
          			data:{
          				Mid4:VendorId,
          				
          		
          			},
          			datatype:"json",
          			success:function(data){
          				
          				if(data=="success"){
      					
          					$("#check3").html(" <span class='glyphicon glyphicon-ok' style='font-size:30px;color:green'></span>");
      	        		   
      				}         		
      				else{
      				  $("#check3").html("<span class='fa fa-warning' style='font-size:30px;color:red'></span>");
      	           		
      				}

          				
        				

          			}
          			
          				
          			
          			
          			
          		});
          		}
          		});
          });
        
        
        </script>
        
        <script>
        $(document).ready(function(){
          	 $("#PrequsitionId").keyup(function(e){
          		if(e.which == 16) {
          		var VendorId=$("#PrequsitionId").val();
          
          		
          		$.ajax({
          			type:"Post",
          			url:"goodReciptValidation",
          			data:{
          				Mid3:VendorId,
          				
          		
          			},
          			datatype:"json",
          			success:function(data){
          				
          				if(data=="success"){
      					
          					$("#check2").html(" <span class='glyphicon glyphicon-ok' style='font-size:30px;color:green'></span>");
      	        		   
      				}         		
      				else{
      				  $("#check2").html("<span class='fa fa-warning' style='font-size:30px;color:red'></span>");
      	           		
      				}

          				
        				

          			}
          			
          				
          			
          			
          			
          		});
          		}
          		});
          });
        
        
        </script>
          
          
          
         
         
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

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
    
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
        <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	
              	  <h5 class="centered"><%=s%></h5>
              	  	
                  <li class="mt" id="dashboard">
                      <a href="dashboard2.jsp">
                          <i class="fa fa-dashboard"></i>
                          <span>Dashboard</span>
                      </a>
                  </li>
                  <li class="sub-menu" id="todolist">
                      <a href="javascript:;" >
                          <i class=" fa fa-bar-chart-o"></i>
                          <span>To Do List</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="todoList.jsp">Todolist</a></li>
                         <li><a  href="InventoryTodolist.jsp">Inventory To do List</a></li>
                          
                      </ul>
                  </li>

                  <li class="sub-menu" id="masterdata">
                      <a href="javascript:;" >
                          <i class="fa fa-desktop"></i>
                          <span>Master Data</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="materialData.jsp">Material data</a></li>
                          <li><a  href="MaterialType.jsp">Material type</a></li>
                          <li><a  href="vender.jsp">Vendor</a></li>
                          <li><a  href="materialdataCurd.jsp">Show Material data</a></li>
                          <li><a  href="MaterialTypeCurd.jsp">show Material type</a></li>
                          <li><a  href="VendorCurd.jsp">show Vendor</a></li>
                          
                      </ul>
                  </li>

                  <li class="sub-menu" id="menu">
                      <a href="javascript:;" >
                          <i class="fa fa-cogs"></i>
                          <span>Main menu</span>
                      </a>
                      <ul class="sub">
                               
                          <li><a  href="Mpdashboard.jsp">MP Menu</a></li>
                          <li><a  href="mainmenu.jsp">Main Menu</a></li>
                       
                      </ul>
                  </li>
                  <li class="sub-menu" id="inventory">
                      <a  href="javascript:;" >
                          <i class="fa fa-book"></i>
                          <span>Inventory</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="InventoryGoodsRecipets.jsp">Goods recipets</a></li>
                          <li><a  href="partialGoodsIssues.jsp">Goods issues</a></li>
                          <li><a  href="Batch.jsp">Batch</a></li>
                          <li><a    href="bin.jsp">Bin </a>
                         <li><a    href="ShowInventorySearch.jsp.jsp">Inventory show </a>
                         <li><a    href="productionOrderSearch.jsp">Production show</a>
                      </ul>
                  </li>
                 
                  

              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      
       <!--sidebar end-->
     
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
          	<h3><i class="fa fa-angle-right"></i> Material and Planing</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          		<div class="panel panel-primary">
          	<div class="panel-heading">Entry Form</div>
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> partial issues</h4>
                      <form class="form-horizontal style-form" method="post" id="issue">
                          <div class="form-group">
                              <label class="col-sm-3 col-sm-3 control-label">Purchasing Rreq Id</label>
                              <div class="col-sm-6">
                                  <input type="text" id="PrequsitionId"  class="form-control" required>
                              </div>
                              <div id="check2" class="col-sm-1"></div>
                          </div>
                          
                           <div class="form-group">
                              <label class="col-sm-3 col-sm-3 control-label">Order Id</label>
                              <div class="col-sm-6">
                                  <input type="text" id="OrderID" class="form-control" required>
                              </div>
                              <div id="check1" class="col-sm-1"></div>
                          </div>
                           <div class="form-group">
                              <label class="col-sm-3 col-sm-3 control-label">Inventory Id</label>
                              <div class="col-sm-6">
                                  <input type="text" id="InvId" class="form-control" required>
                              </div>
                               <div id="check3" class="col-sm-1"></div>
                          </div>
                          <div class="form-group">
                              
                              <div class="col-sm-10">
                                  <input type="submit" id="btn1" value="submit data" >
                               
                              </div>
                          </div>
                          
                        
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
          	</div>
          	
          	
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->
      </section>
      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
                            <a href="form_component.html#" class="go-top">
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
