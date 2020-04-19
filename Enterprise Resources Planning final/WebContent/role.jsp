i
<!DOCTYPE html>
<html lang="en">

<%@ page import="javax.servlet.http.HttpServlet" %>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Role</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
         <script src="js/jquery.js"></script>
<% String s=(String)session.getAttribute("uname");%>

               <script>
               $(document).ready(function() {
            	   $("#dashboard").hide();
                   $("#todolist").hide();
                   $("#masterdata").hide();
                   $("#menu").hide();
                   $("#report").hide();
                   $("#usersetting").hide();
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
        	$('#permission').keyup(function(event) {
	       		var permit = $("#permission").val();
	       	
	       		$.ajax({
	       			
	           		type:"POST",
	           		url:"NewUser",
	           		data:{
	           			
	           			rolecheck:permit,
	           			
	           		},
	           		datatype:"json",
	           		success:function(data){
					
					if(data=="success"){
			
						 $("#recieve").html(" <span style='background-color: red; color: white'  id='status'>This role is not availble</span>"); 
		        		   
					}         		
					else{
						
						  $("#recieve").html("<span style='background-color: green; color: white'  id='status'>This role is availble</span>");
		       		}
		    
	           		
	           		}
	        			
	           		                 			
	           			
	           		});  
	       	
	       	        });
           	
         
            	

            
            	   
           	$('#target').submit(function(event) {
           	var master=$("input[name=data]:checked").val();
           	var menu=$("input[name=menu]:checked").val();
           	var report=$("input[name=report]:checked").val();
        	var todolist=$("input[name=todolist]:checked").val();
        	var dashboard=$("input[name=dashboard]:checked").val();
        	var role=$("input[name=role]:checked").val();
           	var perm=$("#permission").val();
           	alert(master+menu+report+perm);
           		$.ajax({
           			
               		type:"POST",
               		url:"role",
               		data:{
               			
               			a:master,
               			b:menu,
               			c:report,
                        d:perm,
                        board:dashboard,
                       
               		},
               		datatype:"json",
               		success:function(data){

               		                  		}

               			
               			
               		});  
           		
           		
           		
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
      <!--header start-->
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a  class="logo"><b>Galaxy ERP</b></a>
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
						
          
            <!--sidebar end-->
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
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> Finanace and Accounting</h3>
          	 <div class="panel panel-primary">
          	 		<div class="panel-heading">Role And Permission </div>
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	 
                      <form class="form-horizontal style-form" method="get" id="target">
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label"> Role Name</label>
                              <div class="col-sm-10">
                                  <input type="text" id="permission" class="form-control" required>
                                  <div id="recieve">
                                  </div>
                              </div>
                          </div>
                      Permissions:
      			 <div class="checkbox-employee">
                    	<input type="checkbox" name="data" id="data" class="employeePermission" value="master data">
                      Master Data
                    &nbsp;
                    	<input type="checkbox" name="todolist" id="data" class="employeePermission" value="todolist">
                    TodoList
                    &nbsp;
                    	<input type="checkbox" name="dasboard" id="data" class="employeePermission" value="dashboard">
                     Dashboard
                    &nbsp;
                    
                      	<input type="checkbox" name="menu" id="menu" class="employeePermission" value="menu">
                      Main Menu
                    &nbsp;
                    
                      	<input type="checkbox" name="report" id="report" class="employeePermission" value="report">
                      Reporting
                      &nbsp;
                      
                      	<input type="checkbox" name="role" id="role" class="employeePermission" value="role">
                      Role
                    
                  </div>
                        
                          <div class="form-group">
                              <div class="col-lg-10">
                          
                                <button type="submit" class="btn btn-theme" id="enter">Assign</button>
                              </div>
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
