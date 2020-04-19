<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Account Open</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
         <script src="js/jquery.js"></script>
			<script src="js/script.js"></script>
			
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
    <% String s=(String)session.getAttribute("uname");%>
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



       	$('#player').change(function(event) {
       		var actype = $("select#player").val();
       		$.ajax({
       			
           		type:"POST",
           		url:"AccountOpenServlet",
           		data:{
           			
           			name:actype,
           		},
           		datatype:"json",
           		success:function(data){

           		   var select = $('#sport');
    	           select.find('option').remove();
    		
    			for(var a=0 ; a<data.length; a++)
    	{					var bb=	data[a];
   			
    	   $('<option>').val(bb.name).text(bb.name).appendTo(select);	
    				
    				
    				}
           		}

           			
           			
           		});  
       		
       		
       		
       	        });
       	
    	$('#enter').click(function(event) {
       		var acno = $("#bankno").val();
       		var actitle = $("#title").val();
       		var actype = $("#player").val();
       		var acsubtype = $("#sport").val();
       		var name = $("#bankname").val();
       
       		var code = $("#bankcode").val();
       		var location = $("#banklocation").val();
       		var amount = $("#openning").val();
       		alert(location+name);
       		$.ajax({
       			
           		type:"POST",
           		url:"BankOpenServlet",
           		data:{
           			
           			a:acno,
           			b:actitle,
           			c:actype,
           			d:acsubtype,
					e:amount,
					f:name,
					h:code,
					i:location,
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
                  <li class="mt" id="dashboard">
                      <a href="dashboard.jsp">
                          <i class="fa fa-dashboard"></i>
                          <span>Dashboard</span>
                      </a>
                  </li>
                  
                                    <li class="sub-menu" id="todolist">
                      <a href="panels.jsp">
                          <i class="fa fa-desktop"></i>
                          <span>To Do List</span>
                      </a>
                      </li>
                  
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
                          <li><a  href="AccountOpen.jsp">Account Opening</a></li>
                          <li><a  href="fiscalmonths.jsp">Financial Year</a></li>
                            <li><a  href="BankAccount.jsp">Bank Account Openning</a></li>
                      </ul>
                  </li>

               
                  <li class="sub-menu" id="menu">
                      <a href="javascript:;" >
                          <i class="fa fa-book"></i>
                          <span>Main Menu</span>
                      </a>
                      <ul class="sub">
                        <li><a  href="vouchers.jsp"> Voucher</a></li>
                          <li><a  href="BankVoucher.jsp">Bank Voucher</a></li>
                          <li><a  href="CashVoucher.jsp">Cash Voucher</a></li>
                          <li><a  href="JournalVoucher.jsp">Journal Voucher</a></li>
                               <li><a  href="AccountRecieveable.jsp">Account Recieveable</a></li>
                           <li><a  href="AccountPayablejsp.jsp">Account Payable</a></li>
                             <li><a  href="show.jsp">General Ledger</a></li>
                      </ul>
                  </li>
                  
                 
                  <li class="sub-menu"  id="report">
                      <a href="javascript:;" >
                          <i class=" fa fa-bar-chart-o"></i>
                          <span>Reporting</span>
                      </a>
                      <ul class="sub">
                       <li><a  href="reports.jsp">Reports</a></li>
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
          	 		<div class="panel-heading">Bank Account Open</div>
          	  	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  
                      <form class="form-horizontal style-form" method="get">
                         <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label"> Bank Account Number</label>
                              <div class="col-sm-10">
                                  <input type="text" id="bankno" class="form-control" required>
                                  
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label"> Bank Account Name</label>
                              <div class="col-sm-10">
                                  <input type="text" id="bankname" class="form-control" required>
                                  
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Account Title</label>
                              <div class="col-sm-10">
                                  <input type="text" id="title" class="form-control" required>
                              </div>
                          </div>
                               <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">  Branch Code</label>
                              <div class="col-sm-10">
                                  <input type="text" id="bankcode" class="form-control" required>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">  Branch Location</label>
                              <div class="col-sm-10">
                                  <input type="text" id="banklocation" class="form-control" required>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Type of Account</label>
                              <div class="col-sm-10">
                              
                          
					<select id="player">
             <option>Account</option>
        </select>
         <select id="sport">
                <option>Account type</option>
                
        </select>

					
                              </div>
                          </div>
                   <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Openning Balance</label>
                              <div class="col-sm-10">
                                  <input type="text" id="openning" class="form-control" required>
                              </div>
                          </div>       
                          
                          </div>
                          
                          
                          
                          <div class="form-group">
                              <div class="col-lg-10">
                          
                                <button type="submit" class="btn btn-theme" id="enter">Open</button>
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
