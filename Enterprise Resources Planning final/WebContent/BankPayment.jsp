<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Bank Payment</title>

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
    	  <script>
    	  <% String s=(String)session.getAttribute("uname");%>    	  
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


    	    	var bankpay="payment"       
    		     
    	   		
    			$.ajax({
    			type:"POST",
    			url:"BankVoucherServlet",
    			data:{
    				bankpayment:bankpay
    		
    			},
    			datatype:"json",
    			success:function(data){
    			
    				
    		           
    				for(var a=0 ; a<data.length; a++)
    				{	var bb=	data[a];
    					var no=bb.id+1;
    					alert(bb.id);
    					$('#cv').val("");
    					$('#cv').val($('#cv').val() +"BPV#"+no );
    							
    							}
    		    	
    			}

    				
    				
    			});
    		


    	    	$('#bankform').submit(function(event) {
    	    		var value=$("#bankacname").val();        
    	      		var getac="getac";
    	       		
    	        		$.ajax({
    	        		type:"POST",
    	        		url:"account",
    	        		data:{ 
    	        			values:value,
    	        			getbankac:getac,
    	        		},
    	        		datatype:"json",
    	        		success:function(data){
    	        		
    	        			if(data=="success"){
    	        				
							validBank();
							window.open("demo?name=bank");
    						}         		
    						if(data="unsuccess"){
    							
    						alert("enter corrected number");
    			       		}
    			    			
    	     	           
    	        	    	
    	        		}

    	        			
    	        			
    	        		});
    	       		
    	       	        });
    	    	

    	    	$('#bankacname').keyup(function(e){
    	    		
    	    		var value=$("#bankacname").val();        
    	      		var getac="getac";
    	       		
    	        		$.ajax({
    	        		type:"POST",
    	        		url:"showall",
    	        		data:{ 
    	        			values:value,
    	        			getbankac:getac,
    	        		},
    	        		datatype:"json",
    	        		success:function(data){
    	        		
    	        			
    	     	           
    	        			for(var a=0 ; a<data.length; a++)
    	        			{	var bb=	data[a];
    	        				
    	        				$('#bankname').val("");
    	        				$('#bankname').val($('#bankname').val() +bb.branchname );
    	        				 $("#a").html(" <span class='glyphicon glyphicon-ok' style='font-size:30px;color:green'></span>");
    	        				$('#bankactitle').val("");
    	        				$('#bankactitle').val($('#bankactitle').val() +bb.branchlocation );
    	        				 $("#b").html(" <span class='glyphicon glyphicon-ok' style='font-size:30px;color:green'></span>");
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
    	        				alert(bb.acTitle);
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
			
						 $("#recieve").html(" <span class='glyphicon glyphicon-ok' style='font-size:30px;color:green'></span>"); 
		        		   
					}         		
					else{
						
						  $("#recieve").html("<span class='fa fa-warning' style='font-size:30px;color:red'></span>");
		       		}
		    
	           		
	           		}
	        			
	           		                 			
	           			
	           		});  
	       	
	       	        });

    	    
	    	$('#bankacname').keyup(function(e){
	    		
	    		var value=$("#bankacname").val();        
	      		var getac="getac";
	       		
	        		$.ajax({
	        		type:"POST",
	        		url:"account",
	        		data:{ 
	        			values:value,
	        			getbankac:getac,
	        		},
	        		datatype:"json",
	        		success:function(data){
	        		
	        			if(data=="success"){
	        				
							 $("#bankacno").html(" <span class='glyphicon glyphicon-ok' style='font-size:30px;color:green'></span>"); 
			        		   
						}         		
						else{
							
							  $("#bankacno").html("<span class='fa fa-warning' style='font-size:30px;color:red'></span>");
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

    	  function validBank(){
	    		var mode='payment';
	        	alert("it is"+mode);
	       		var nam=$("#nam").val();        
	       		var ac=$("#actitle").val();
	       		var amount=$("#amount").val();
	       		var type=  $("#type").val();
	       		var memo= $("#memo").val();
	       		var cv= $("#cv").val();
	       		var value=$("#cv").val();
	       		var bankno=$("#bankacname").val();
	       		var bankname=$("#bankname").val();
	       		 var title=$("#bankactitle").val();
	       		$.ajax({
	       			
	           		type:"POST",
	           		url:"BankBook",
	           		data:{
	           			acdate:nam,
	        			acname:ac,
	        			acamount:amount,
	        			actype:type,
	        			acmemo:memo,
	        			acmode:mode,
	        			cashcv:cv,
	        			cvrecieved:value,
	        			acno:bankno,
	        			branchname:bankname,
	        			actitle:title,
	           		},
	           		datatype:"json",
	           		success:function(data){
	           			
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
          	 		<div class="panel-heading">Bank Payment </div>
          	<!-- BASIC FORM ELELEMNTS -->
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  
                      <form class="form-horizontal style-form" method="get" id="bankform">
                     
                     
   						 <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Bank Voucher no</label>
                              <div class="col-sm-6">
                                  <input type="text" class="form-control" id="cv" required>
                              </div>
                        </div>
                     
   						 <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Date</label>
                              <div class="col-sm-6">
                                  <input type="text" class="form-control" id="nam" required>
                              </div>
                        </div>
            					 <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Bank Account No</label>
                              <div class="col-sm-6">
                                  <input type="text" class="form-control" id="bankacname" required>
                              </div>
                              <div id="bankacno"> <span class='fa fa-warning' style='font-size:30px;color:red'></span></div>
                        </div>
                     				 <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Bank Name</label>
                              <div class="col-sm-6">
                                  <input type="text" class="form-control" id="bankname" required>
                              </div>
                                 <div id="a"><span class='fa fa-warning' style='font-size:30px;color:red'></span> </div>
                        </div>
	 					
	 					                     				 <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Account Title</label>
                              <div class="col-sm-6">
                                  <input type="text" class="form-control" id="bankactitle" required>
                              </div>
                                 <div id="b"> <span class='fa fa-warning' style='font-size:30px;color:red'></span></div>
                        </div>
	 					                    
                         <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Account</label>
                              <div class="col-sm-6">
                                  <input type="text"  value=<%= request.getParameter("name") %> id="actitle" class="form-control" required>
                            
                              </div>
                              <div id="recieve"></div>
                          </div>
                         
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Amount</label>
                              <div class="col-sm-6">
                                  <input type="text" id="amount"  value=<%= request.getParameter("val") %> class="form-control" required>
                            
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
                          
                                <button type="submit" class="btn btn-theme" id="enter">Add</button>
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
