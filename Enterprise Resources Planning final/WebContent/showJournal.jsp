<!DOCTYPE html>
<html lang="en">
  <head>
  <style>
tr:hover{background-color:#f5f5f5}


</style>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Journal Voucher List</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <link href="assets/css/table-responsive.css" rel="stylesheet">
 <script src="js/jquery.js"></script>
<% String s=(String)session.getAttribute("uname");%>
          <script >
         $(document).ready(function(){
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
      	
      

       
              var ac="journal";   
                 $.ajax({

                	 type:"POST",
            		url:"showall",
            		data:{
           				jvlist:ac,
           			
           			},
            		datatype:"json",
            		success:function(data){
   			
   				for(var a=0 ; a<data.length; a++)
   				{					var bb=	data[a];
   					
   	      		$('#mytable tr').eq(0).after(' <tr  height=80px"><td>'+bb.jvdate+'</td><td>'+bb.jvno+'</td><td>'+bb.debit+'</td><td>'+bb.credit+'</td><td>'+bb.cramount+'</td><td>'+bb.dbamount+'</td></tr>');  					
   							}
   	
   }
            			
           });
         
         });	
    
	
         			
         
         </script>

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
            <a  class="logo"><b>Galaxy ERP</b></a>
            <!--logo end-->
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="logout">Logout</a></li>
            	</ul>
            </div>
        </header>
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
          	<h3><i class="fa fa-angle-right"></i> Finance And Accounting</h3>
		  			 <div class="panel panel-primary">
          	 		<div class="panel-heading">Show Journal Voucher</div>
		  		<div class="row mt">
			  		<div class="col-lg-12">
                      <div class="content-panel">
                  
                          <section id="unseen">
                            <table class="table table-striped table-advance table-hover" id="mytable" >
                              <thead>
                              <tr>
                                  
                                  <th class="numeric">Date</th>
                                  <th class="numeric">Voucher No</th>
                                  <th class="numeric">Account</th>
                                  <th class="numeric">Account Type</th>
                                  <th class="numeric">Debit</th>
                                   <th class="numeric">Credit</th>
                                  
                              </tr>
                              </thead>
                              <tbody>
                              
                                 
                              </tbody>
                          </table>
                          <div class="clearfix"></div>
<ul class="pagination pull-right">
  <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
  <li class="active"><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
</ul>
                          </section>
                  </div><!-- /content-panel -->
               </div><!-- /col-lg-4 -->			
		  	</div><!-- /row -->
		  <!-- /row -->

		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              2014 - Alvarez.is
              <a href="responsive_table.html#" class="go-top">
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
    

  </body>
</html>
