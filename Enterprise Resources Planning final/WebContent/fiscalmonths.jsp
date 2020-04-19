<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Account Recieveable</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/jquery-ui.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
   
   	
    <% String s=(String)session.getAttribute("uname");%>
<% String d=(String)session.getAttribute("dept");%>
    
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
	  <script src="js/jquery.js"></script>

    <script>
	  
    $(document).ready(function(){
    	
 	   $("#dashboard").hide();

	    var testvalue= "<%=s%>";
	    var dept= "<%=d%>";

	        if(testvalue=="null"){
	      
	        	window.location.href = "login.jsp";
               
        	    }	

	


    });
    </script>


    	  <script>
    	  
    	    $(document).ready(function(){
    	    	
         	


    	    	$('#target').submit(function(event) {
    	    	    	
      	       		var nam=$("#nam").val();        
      	       		var nams=$("#nams").val();
      	       		
    	    		  $.ajax({
      	       			
      	           		type:"POST",
      	           		url:"BankVoucherServlet",
      	           		data:{
      	           			startdate:nam,
      	        			enddate:nams,		
      	           		},
      	           		datatype:"json",
            	    		success:function(data){
            	    			
            	    
            	    			
            	    				}

      	  				         			
      	           			
      	           		});  	});  
       		}); 

    	    		  

    	    		  
    	    	  
    	    			

    	  
    	  
    	  
    	  
    	  </script>
                       
	<script>
	
	$(function ()
	{
		$("#nam").datepicker({ dateFormat: 'yy-mm-dd'});
	});
	$(function ()
			{
				$("#nams").datepicker({ dateFormat: 'yy-mm-dd'});
			});
	</script>
	
	
  	
  
  </head>


  <body>

  <section id="container" >
      <!-- **********************************************************************************************************************************************************
      TOP BAR CONTENT & NOTIFICATIONS
      *********************************************************************************************************************************************************** -->
      <!--header start-->
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a  class="logo"><b>Enterprise Resource Planning</b></a>
            <!--logo end-->
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="logout">Logout</a></li>
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
          <div id="sidebar"  class="nav-collapse " >
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
                            	  <h5 class="centered"><%=s %></h5>
                  
                   
			<li class="sub-menu" id="usersetting">
                      <a href="javascript:;" >
                          <i class="fa fa-cogs"></i>
                          <span>User Account</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="EmployeeRegistration.jsp">Add User</a></li>
                          <li><a  href="role.jsp">Add Role</a></li>
                          </ul>
                  </li>
              
                  <li class="sub-menu" id="masterdata">
                      <a href="javascript:;" >
                          <i class=" fa fa-tasks"></i>
                          <span>Master Data</span>
                      </a>
                      <ul class="sub">
    <li><a  href="company.jsp">Company detail</a></li>
                          <li><a  href="fiscalmonths.jsp">Financial Year</a></li>
                        
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
          	<h3><i class="fa fa-angle-right"></i> Finanace and Accounting</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i>Fiscal Year Setting</h4>
                      <form class="form-horizontal style-form"  id="target">
                     
                     
   						 <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Starting Date</label>
                              <div class="col-sm-4">
                                  <input type="text" class="form-control" id="nam" required>
                              </div>
                               <label class="col-sm-2 col-sm-2 control-label">Ending Date</label>
                              <div class="col-sm-4">
                                  <input type="text" class="form-control" id="nams" required>
                              </div>
                        </div>
                        	 
            
                                      
                          
                                <button type="submit" class="btn btn-theme" >save</button>
                            
                          </div>
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
                            
                         
                        
          			</div>
          		</div>
          	</div><!-- /row -->
          	
          	
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
      </footer>
      <!--footer end-->
  </section>


  </body>
</html>
