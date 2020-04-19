<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Cash Payment</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
         <script src="js/jquery.js"></script>
               <link rel="stylesheet" type="text/css" href="datepicker/bootstrap-datepicker/css/datepicker.css" /> 
                <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/jquery-ui.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
	
	<% String s=(String)session.getAttribute("uname");%>
	<script>
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
	


    	var value=$("#cvpayment").val();        
	     
   		
		$.ajax({
		type:"POST",
		url:"BankVoucherServlet",
		data:{
			cvpayment:value
	
		},
		datatype:"json",
		success:function(data){
		
			
	           
			for(var a=0 ; a<data.length; a++)
			{	var bb=	data[a];
				var no=bb.id+1;
				
				$('#cvpayment').val("");
				$('#cvpayment').val($('#cvpayment').val() +"CV#"+no );
						
						}
	    	
		}

			
			
		});
    	
		$('#target').submit(function(event){
			var acno = $("#actitle").val();
	       	
       		$.ajax({
       			
           		type:"POST",
           		url:"account",
           		data:{
           			
           			a:acno,
           			
           		},
           		datatype:"json",
           		success:function(data){
				
				if(data=="success"){
		
		       		   chk();
		       		   alert();
		       		 window.open("demo?name=cash");
				}         		
				else{
					
					alert("enter correct account");
	       		}
	    
           		
           		}
        			
           		                  		
    	
           	  
               
                         			
           			
           		});  
       		
       		
       	   	       		    	       		
       	
       	        });


			

    	
    	$('#actitle').keyup(function(e){
    
    		var value=$("#actitle").val();        
      
       		
        		$.ajax({
        		type:"POST",
        		url:"BankVoucherServlet",
        		data:{
        			values:value
        	
        		},
        		datatype:"json",
        		success:function(data){
        		
        			
     	           
        			for(var a=0 ; a<data.length; a++)
        			{	var bb=	data[a];
        		
        				$('#actitle').val("");
        				$('#actitle').val($('#actitle').val() +bb.acTitle );
        						
        						}
        	    	
        		}

        			
        			
        		});
    	});		
    	  	

    	
	
    	
    	$('#actitle').keyup(function(event) {
       		var acno = $("#actitle").val();
       	
       		$.ajax({
       			
           		type:"POST",
           		url:"account",
           		data:{
           			
           			a:acno,
           			
           		},
           		datatype:"json",
           		success:function(data){
				
				if(data=="success"){
		
					 $("#pay").html(" <span class='glyphicon glyphicon-ok' style='font-size:30px;color:green'></span>"); 
	        		   
				}         		
				else{
					
					  $("#pay").html("<span class='fa fa-warning' style='font-size:30px;color:red'></span>");
	       		}
	    
           		
           		}
        			
           		                  		
    	
           	  
               
                         			
           			
           		});  
       		
       		
       		
       	        });
    	
    	
    	$('#enter').click(function(event){
    		<%String ss=request.getParameter("name"); %>
    		var bb=  "<%=ss%>"
    	alert("val is"+bb);
    		if(bb!=null){
    			
    		        
    		      
           		
        		$.ajax({

            		type:"POST",
            		url:"taskServlet",
        		data:{
        			toDoVal:bb
        	
        		},
        		datatype:"json",
        		success:function(data){
        		
        			
     	           
        		
        		}

        			
        			
        		});
    			
    			
    		}
    	
    	
    	});	
 	});	     	    	

    	

    			
		function chk(){
	    	var mode="payment";	
	    	alert("it is"+mode);
	   		var date=$("#nam").val();        
	   		var ac=$("#actitle").val();
	   		var amount=$("#amount").val();
	   		var type=  $("#type").val();
	   		var memo= $("#memo").val();
	   		var paid= $("#payto").val();
	   		alert(ac);
	    		$.ajax({
	    		type:"POST",
	    		url:"AccountReciept",
	    		data:{
	    			acdate:date,
	    			acname:ac,
	    			acamount:amount,
	    			actype:type,
	    			acmemo:memo,
	    			acmode:mode,
	    			paidto:paid
	    		},
	    		datatype:"json",
	    		success:function(data){
	    			
	    	    	   var select = $('#player');
	    	           select.find('option').remove();
	    			
	    		}

	    			
	    			
	    		});


			
		}
	
	
	</script>
   	
                <script>
                $(function ()
                		{
                			$("#nam").datepicker({ dateFormat: 'yy-mm-dd'});
                		});
                		
  </script>
               
                  <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
               
        
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
          	 		<div class="panel-heading">Cash Payment </div>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  
                      <form class="form-horizontal style-form" method="get" id="target">
                     
                     
                        <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Cash VoucherNo</label>
                              <div class="col-sm-6">
                                  <input type="text" class="form-control" id="cvpayment" name="dateofbirth"  required>
                              </div>
                        </div>
                     
   				<div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Paid to Mr/Miss:</label>
                              <div class="col-sm-6">
                                  <input type="text" value=<%=request.getParameter("name") %> class="form-control" id="payto"  required >
                              </div>
                        </div>
                        <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Cash Payment date</label>
                              <div class="col-sm-6">
                                  <input type="text" class="form-control" id="nam" name="dateofbirth" required >
                              </div>
                        </div>
                         <div class="form-group">
                              <label class="col-sm-2 col-sm-2 col-xs-3 control-label">Account</label>
                              <div class="col-lg-6 col-md-6 col-sm-6 col-xs-10">
                                  <input type="text" id="actitle"   class="form-control" required>
                              
                              </div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-1 " id="pay"></div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Amount</label>
                              <div class="col-sm-6">
                                  <input type="text" id="amount"  value=<%= request.getParameter("val") %> class="form-control"  required>
                            
                              </div>
                          </div>

                                         <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Type of Account</label>
                              <div class="col-sm-10">
                              
                          
					<select id="type">
             <option>Cash</option>
              <option>Bank</option>
        			</select>
        

					
                              </div>
                          </div>   
                          <div class="form-group">   
                                    <div class="col-sm-8">
                                
                              <label class="col-sm-2 col-sm-2 control-label">Memo</label>
                              <textarea class="form-control" rows="4" id="memo" required></textarea>
                                 </div>
                          </div>
                          
                          
                          <div class="form-group">
                              <div class="col-lg-10">
                          
                                <button type="submit" class="btn btn-theme" id="enter">save</button>
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
