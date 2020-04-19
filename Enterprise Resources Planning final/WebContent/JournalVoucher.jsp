<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Finance and Accounting</title>

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
	$(function ()
	{
		$("#vdate").datepicker({ dateFormat: 'yy-mm-dd'});
	});
	  </script>
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
  	

    	
    		
    		var value=$("#journal").val();        
     
       		
        		$.ajax({
        		type:"POST",
        		url:"BankVoucherServlet",
        		data:{
        			jv:value
        	
        		},
        		datatype:"json",
        		success:function(data){
        		
        			
     	           
        			for(var a=0 ; a<data.length; a++)
        			{	var bb=	data[a];
        			
        				$('#journal').val("");
        				$('#journal').val($('#journal').val() +"JV#"+bb.id );
        						
        						}
        	    	
        		}

        			
        			
        		});
    			

    	$('#debit').click(function(event) {
       		var acno = $("#dbac").val();
       	
       
       		var amount =  $("#dbamount").val();
       		
 
      
      
       		$('#dbtable tr').eq(0).after('<tr><td colspan="1" id="find" class="price"> '+acno+'</td><td colspan="1" id="amount" class="price"> '+amount+'</td><td></td>   <td><button type="button" class="removebutton" title="Remove this row">X</button></tr>');  
       	        });
   		
    	$('#dbac').keyup(function(e){
    		
    		var value=$("#dbac").val();        
      
       		
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
        		
        				$('#dbac').val("");
        				$('#dbac').val($('#dbac').val() +bb.acTitle );
        						
        						}
        	    	
        		}

        			
        			
        		});
    	});		
   	  

    	$('#crac').keyup(function(e){
    		
    		var value=$("#crac").val();        
      
       		
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
        		
        				$('#crac').val("");
        				$('#crac').val($('#crac').val() +bb.acTitle );
        						
        						}
        	    	
        		}

        			
        			
        		});
    	});		
   	  	
    	$('#dbac').keyup(function(event) {
       		var acno = $("#dbac").val();
       	
       		$.ajax({
       			
           		type:"POST",
           		url:"account",
           		data:{
           			
           			a:acno,
           			
           		},
           		datatype:"json",
           		success:function(data){
				
				if(data=="success"){
		
					 $("#jdb").html(" <span class='glyphicon glyphicon-ok' style='font-size:30px;color:green'></span>"); 
	        		   
				}         		
				else{
					
					  $("#jdb").html("<span class='fa fa-warning' style='font-size:30px;color:red'></span>");
	       		}
	    
           		
           		}
        			
           		                  		
    	
           	  
               
                         			
           			
           		});  
       		
       		
       		
       	        });

    	$('#crac').keyup(function(event) {
       		var acno = $("#crac").val();
       	
       		$.ajax({
       			
           		type:"POST",
           		url:"account",
           		data:{
           			
           			a:acno,
           			
           		},
           		datatype:"json",
           		success:function(data){
				
				if(data=="success"){
		
					 $("#jcr").html(" <span class='glyphicon glyphicon-ok' style='font-size:30px;color:green'></span>"); 
	        		   
				}         		
				else{
					
					  $("#jcr").html("<span class='fa fa-warning' style='font-size:30px;color:red'></span>");
	       		}
	    
           		
           		}
        			
           		                  		
    	
           	  
               
                         			
           			
           		});  
       		
       		
       		
       	        });
		
	

    	$('#credit').click(function(event) {
       		var acno = $("#crac").val();
       	
       
       		var amount =  $("#cramount").val();
       		
       		$('#crtable tr').eq(0).after('<tr><td colspan="1" id="CrAcName"> '+acno+'</td><td colspan="1" class="crtotal" id="CrActotal"> '+amount+'</td><td></td> <td><button type="button" class="removebutton" title="Remove this row">X</button></td></tr>');  		
       	   
       		
       		
       	        });

    	
    	
    	 $(document).on('click', 'button.removebutton', function () {
    	 
    	     $(this).closest('tr').remove();
    	     return false;
    	 });
    	 
    	 
    	 $('#total').click(function(event) {
    		
    		 var tabledata = Array();  		
    		 var tableamount = Array();  		
    		 var tabletotal = Array();  		
    		 var jv=$("#journal").val();
    		 var vdate=$("#vdate").val();
    		 var comments=$("#memo").val();
    		 var names=$("#names").val();
    		 var tableCramount = Array();  		
    		 var tableCrName = Array();
    		 
    		  var sum = 0;
    		  var total=0;
    		// iterate through each td based on class and add the values
    		$(".price").each(function() {

    		    var value = $(this).text();
    		    // add only if the value is number
    		    if(!isNaN(value) && value.length != 0) {
    		        sum += parseFloat(value);
    		    }
    		  
    		});
    		$("<td colspan='2' class='price' id='sum'>"+sum+"</td>").insertAfter('#dbtable tr td:last')
    		  
      		$(".crtotal").each(function() {

    		    var value = $(this).text();
    		    // add only if the value is number
    		    if(!isNaN(value) && value.length != 0) {
    		        total += parseFloat(value);
    		    }
    		  
    		});
      		
      		$("<td colspan='2'>"+total+"</td>").insertAfter('#crtable tr td:last');
      		var trail=sum-total;
      		if(trail==0){
      			window.alert('successful');
      			var header = Array();
      		   
      			$("table tr th").each(function(i, v){
      			        header[i] = $(this).text();
      			})
      			               
      			alert(header);

      			
      			    var a="ss";
      			$("#dbtable tr").each(function(i, v){
      			    tabledata[i] = Array();
      			    $(this).children('#find').each(function(ii, vv){
      			    	tabledata[i][ii] = $(this).text();
      			    }); 
      			});
      			$("#dbtable tr").each(function(i, v){
      				tableamount[i] = Array();
      			    $(this).children('#amount').each(function(ii, vv){
      			    	tableamount[i][ii] = $(this).text();
      			    }); 
      			});
      			$("#crtable tr").each(function(i, v){
      				tableCrName[i] = Array();
      			    $(this).children('#CrAcName').each(function(ii, vv){
      			    	tableCrName[i][ii] = $(this).text();
      			    }); 
      			});
      			$("#crtable tr").each(function(i, v){
      				tableCramount[i] = Array();
      			    $(this).children('#CrActotal').each(function(ii, vv){
      			    	tableCramount[i][ii] = $(this).text();
      			    }); 
      			});
      			

      			$.ajax({
      			
      	    		type:"POST",
      	    		url:"JournalVocherServlet",
      	    		data:{
      	    			"tablename[]":tabledata,
      	    			"tableamount[]":tableamount,
      	    			"tabletCramount[]":tableCramount,
      	    			"tableCrName[]":tableCrName,
      	    				j:jv,
      	    				v:vdate,
      	    				t:total,
      	    				comment:comments,
      	    				nam:names
      	    		},
      	    		datatype:"json",
      	    		success:function(data){
					window.open("demo?name=journal");
      	 		
      	    		}

      	    			
      	    			
      	    		});
      	    


      		}
      		else{
      			window.alert('unsuccessful');
      		}
    
	});

     	$('#total').click(function(event){
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
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
               	  <h4 class="mb"><i class="fa fa-angle-right"></i> Journal Voucher</h4>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          	 <div class="panel panel-primary">
          	 		<div class="panel-heading">Entry Form</div>
          	<div class="row mt">
          	<div class="col-lg-12">
                  <div class="form-panel">
                  	  
                      <form class="form-horizontal style-form" role="form" method="get">
                          <div class="form-group">
                              <label class="col-sm-2  control-label">Journal No</label>
                              <div class="col-sm-4">
                                  <input type="text" id="journal" class="form-control">
                              </div>                       
                          </div>
                           <div class="form-group">
                              <label class="col-sm-2  control-label">Date</label>
                              <div class="col-sm-4">
               				<input type="text" class="form-control" id="vdate">
                              </div> </div>        
                              
                           <div class="form-group">
                              <label class="col-sm-2  control-label">Name</label>
                              <div class="col-sm-4">
               				<input type="text" class="form-control"  value=<%= request.getParameter("name") %> id="names">
                              </div> </div>            
                                           
             					<div class="form-group">   
             					<label class="col-sm-2 col-sm-2 control-label">Narration</label>
                                    <div class="col-sm-4">
                                
                              
                              <textarea class="form-control" rows="4"  id="memo"></textarea>
                                 </div>
                          </div>            
                         
                      </form>
                      
                  </div>
          		</div>
          	
          		<div class="col-lg-6">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Debit</h4>
                      <form class="form-horizontal style-form" role="form" method="get">
                          <div class="form-group">
                              <label class="col-sm-2  control-label">A/C Head</label>
                              <div class="col-sm-6">
                                  <input type="text"   id="dbac" class="form-control" required>
                              </div>
                              <div id="jdb"></div>                       
                          </div>
                           <div class="form-group">
                              <label class="col-sm-2  control-label">Debit Amount</label>
                              <div class="col-sm-6">
                                  <input type="text" value=<%= request.getParameter("val") %> id="dbamount" class="form-control" required>
                              </div>                       
                          </div>
                         
                      </form>
                      <input type="submit"  id="debit" value="Add Debit"  class="btn btn-theme">
                  </div>
          		</div>
          		
     				     	
          		<div class="col-lg-6">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Credit</h4>
                      <form class="form-horizontal style-form" role="form" method="get">
                          <div class="form-group">
                              <label class="col-sm-2  control-label">A/C Head</label>
                              <div class="col-sm-6">
                                  <input type="text" id="crac" class="form-control" required>
                              </div>
                       <div id="jcr"></div>
                            
                          </div>
                             <div class="form-group">
                              <label class="col-sm-2  control-label">Credit Amount</label>
                              <div class="col-sm-6">
                                  <input type="text" id="cramount" class="form-control" required>
                              </div>
                       
                            
                          
                         
                      </form>
                      </div>
                      <button type="submit"  id="credit"   class="btn btn-theme">Add Credit</button>
                  </div>
          		</div>
          		     		</div>
          		<!-- col-lg-12-->      	
          	</div>
          	</section>
          
          	<!-- /row -->
          	
		  <section class="wrapper"> 		
			  	<div class="panel panel-primary">
          	 		<div class="panel-heading">Voucher List</div>
          	<div class="row mt">
          	<div class="col-lg-12">
                      	<div class="col-lg-6">
            		  <table id="dbtable" class="table table-bordered table-striped table-condensed">
                              <thead>
                              <tr>
                                  <th>Debit A/C Head</th>
                                  <th>Amount</th>
                                  <th>Memo</th>
                                  <th>Action</th>
                                  
                                            
                                                    </tr>
                              </thead>
                                           <thead>                 
            
            </thead>
                                           <thead>                 
            <tr>
            <td colspan="2">Total</td>
           
            </tr>
            </thead>
            
                              </tbody>
                          </table>
                                             
                   
          </div>
                    	<div class="col-lg-6">
            		  <table id="crtable" class="table table-bordered table-striped table-condensed">
                             
                              <tr>
                                  <th>Credit A/C Head</th>
                                  <th>Amount</th>
                                  <th>Memo</th>
                                  <th>Action</th>
                                  
                                            
                                                    </tr>
                                                                                       
    
           
            <tr>
            <td colspan="2">Total</td>
           
            </tr>
           
      
                                    </table>
          <button type="submit"  id="total"   class="btn btn-theme">Complete</button>                                  
                   
          </div>
                
          </div></div>   </div></div></section>
          	
                  	
          	
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
      
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
