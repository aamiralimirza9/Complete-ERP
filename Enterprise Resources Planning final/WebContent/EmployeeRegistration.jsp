<!DOCTYPE html>
<html lang="en">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>User Registration</title>

    <!-- Bootstrap core CSS -->
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
<% String s=(String)session.getAttribute("uname");%>
               <script>


               $(document).ready(function()
               {
             	   $("#dashboard").hide();
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
            	
            

            	   
            	
            	    	
                		var nam="name";
                
                		$.ajax({
                		type:"POST",
                		url:"NewUser",
                		data:{
                			empname:nam,
                		},
                		datatype:"json",
                		success:function(data){

                	    	   var select = $('#roles');
                	           select.find('option').remove();
                		
                			for(var a=0 ; a<data.length; a++)
                	{					var bb=	data[a];
               			
                	   $('<option>').val(bb.rolename).text(bb.rolename).appendTo(select);	
                				
                				
                				}		
                		}

                			
                			
                		});
                		
                			
                		
                		
                		
             
                
                
            	   
               	$("#getPassword").click(function ()
               	{
               		$.ajax(
               		{
               			data:{"action":"getpassword"},
               			
               			type:"POST",
               			url:"NewUser",
               			datatype:"json",
               			
               			success:function(data)
               			{
               				$("#password").val(data);
               				$("#passwordhidden").val(data);
               			}
               		});
                   });
               	$('#username').keyup(function(event) {
    	       		var acno = $("#username").val();
    	       	
    	       		$.ajax({
    	       			
    	           		type:"POST",
    	           		url:"NewUser",
    	           		data:{
    	           			
    	           			user:acno,
    	           			
    	           		},
    	           		datatype:"json",
    	           		success:function(data){
    					
    					if(data=="success"){
    			
    						 $("#recieve").html(" <span style='background-color: red; color: white'  id='status'>This username is not availble</span>"); 
    		        		   
    					}         		
    					else{
    						
    						  $("#recieve").html("<span style='background-color: green; color: white'  id='status'>This username is availble</span>");
    		       		}
    		    
    	           		
    	           		}
    	        			
    	           		                 			
    	           			
    	           		});  
    	       	
    	       	        });
               	
              	});	


               </script>
               <script>

           	$(function ()
           	{
           		$("#dateof").datepicker({ dateFormat: 'yy-mm-dd'});
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
          		 <div class="panel panel-primary">
          	 		<div class="panel-heading">Add User </div>
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  
						
					<form class="form-horizontal style-form"  action="NewUser" method="Post">
                        <input type="hidden" id="action" name="action" value="addEmployee">    
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Full Name</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" id="fullname" name="fullname"  required>
                              </div>
                          </div>
                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">UserName</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" id="username" name="username"  required>
                                  <div id="recieve">


</div>
                              </div>
                          </div>
                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Password</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control round-form" id="password" name="password" required >
                                  <input type="hidden" id="passwordhidden" name="passwordhidden">
                                  <span class="help-block"> Automatically Generated Password.</span>
                                  <a class="btn btn-theme" id="getPassword">Password Generator</a>


                              </div>
                          </div>
                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Role</label>
                              <div class="col-sm-10">
                                  <select id="roles" name="roles">
                                  <option>roles</option>
                                 
                                  </select>
                              </div>	
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label" id="dept">Department</label>
                              <div class="col-sm-10">
                                  <select name="dept">
                                    <option>Finanace And Accounting</option>
                                  <option>Sales And Distribution</option>
                                  <option>Production Planning</option>
                                   <option>Material Planning</option>
                                  
                                  </select>
                              </div>	
                          </div>
                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Email</label>
                              <div class="col-sm-10">
                                  <input type="email" class="form-control" id="email" name="email" required>
                              </div>	
                          </div>
                          
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">NIC</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" id="nic" name="nic" data-mask="99999-9999999-9" required>
                              </div>
                          </div>
                          
            			  <div class="form-group">
							  <label class="col-sm-2 col-sm-2 control-label">Gender</label>
                              	<input type="radio" value="Male" name="tutorRadios"  id="optionsRadios1" value="option1" checked>
						      	Male:
						      	
						  	  	<input type="radio" value="Female" name="tutorRadios" id="optionsRadios2" value="option2">
						    	Female:
						  	  </label>
						</div>              
                          
                        <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Appointment Date</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" id="dateof" name="dateof"  required>
                              </div>
                        </div>
        
        
                          
                        <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Phone Number</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" id="phone" name="phone" data-mask="9999-9999999" required>
                              </div>
                        </div>
						
						 
						  
						  <div class="form-group">
						  	<div class="col-md-6">
                             <button type="reset" class="btn btn-theme btn-block" onclick=" clearFields();">Reset</button>
                            </div>
						  	
						  	<div class="col-md-6">
                              <button type="submit" class="btn btn-theme btn-block">Add User</button>
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
