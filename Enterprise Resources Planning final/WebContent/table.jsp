<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
         <script src="js/jquery.js"></script>
    <title>To do Task</title>

</script>
    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        <script>
    
        $(document).ready(function(){

        	var value="hello"; 
        	 var ac="journal";
			alert(value);    	     
       		
    		$.ajax({
    		type:"POST",
    		url:"showall",
    		data:{
    			jvlist:ac,
    	
    		},
    		datatype:"json",
    		success:function(data){
    			var balance=3;
    			var chk=3;
    			var nam2="";
    			
    			 
    			for(var a=0 ; a<data.length; a++)
    			{	var bb=	data[a];
    			
    	           var nam="<div class='product-panel-2 pn'>";
    	         
    		if(balance==chk){
    			$("#yahoo").append(nam);
    				$('#tb tr').eq(0).after(' <tr><td>'+bb.jvdate+'</td><td>'+bb.jvno+'</td><td>'+bb.debit+'</td><td>'+bb.credit+'</td><td>'+bb.cramount+'</td><td>'+bb.dbamount+'</td></tr></div>');
    				
    			
    			   			
    		    		}
    		balance=bb.jvno;
    		 
    		}
    			}
    	    	
    		

    			
    			
    		});	});

        </script>
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <script src="assets/js/chart-master/Chart.js"></script>

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
            <a  class="logo"><b>Enterprise Resource Planning</b></a>
            <!--logo end-->
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="login.html">Logout</a></li>
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
                      <a href="dashboard.jsp">
                          <i class="fa fa-dashboard"></i>
                          <span>Dashboard</span>
                      </a>
                  </li>
                  
                                    <li class="sub-menu">
                      <a href="panels.jsp">
                          <i class="fa fa-desktop"></i>
                          <span>To Do List</span>
                      </a>
                      </li>
                  

                  <li class="sub-menu">
                      <a href="javascript:;" >
                          <i class="fa fa-cogs"></i>
                          <span>Master Data</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="AccountOpen.jsp">Account Opening</a></li>
                          <li><a  href="AccountType.jsp">Account type</a></li>
                          <li><a  href="Financ">Financial Year</a></li>
                            <li><a  href="BankAccount.jsp">Bank Account</a></li>
                      </ul>
                  </li>

               
                  <li class="sub-menu">
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
                           <li><a  href="AccountPayable.jsp">Account Payable</a></li>
                             <li><a  href="show.jsp">General Ledger</a></li>
                      </ul>
                  </li>
                  
                 
                  <li class="sub-menu">
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
          <section class="wrapper site-min-height">
          	<h3><i class="fa fa-angle-right"></i> Task to do</h3>
         
                      <!-- CHART PANELS -->
                      <div class=class="col-lg-12 col-md-12 col-sm-12 mb">
                      <div id="yahoo" class="class='col-lg-12 col-md-12 col-sm-12 mb">
                      
						<table id="tb" class='table table-bordered table-striped table-condensed cf' >
						                   <thead>
                   
                   
                   <th>date</th>
                    <th>Journal No</th>
                     <th>Debit Account</th>
                     <th>Credit Account</th>
                     <th>Debit Amount</th>
                      <th>Credit Amount</th>
                      
                       
                   </thead>
    <tbody>
    
    
    

   
    
   
    
    </tbody>
						</table>
				
                


                     
                    </div><!-- /END CHART - 4TH ROW OF PANELS -->
                    </div>

					
          		</div>
          	</div>
			
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              
              <a href="panels.html#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>


  </body>
</html>
