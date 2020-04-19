<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Dashboard</title>
 <script src="js/jquery.js"></script>
 <script src="js/highcharts-4.0.1.js"></script>
    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
    

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<% String s=(String)session.getAttribute("uname");%>    
    <script language="JavaScript">
    $(document).ready(function() { 
		var cash=null;
		var sale=null;
		var profit=null;
	  	   
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
 	




	
			var cc=0;
  			var bb;
  			var dd=0;
  			var ee=0;
  			
    	   var chart = {
    	      type: 'column'
    	   };
    	   var title = {
    	      text: 'Financial Reports Yearly'   
    	   };
    	   var subtitle = {
    	      text: 'COGS vs Sale vs Profit'  
    	   };
    	   var xAxis = {
    	      categories: ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'],
    	      crosshair: true
    	   };
    	   var yAxis = {
    	      min: 0,
    	      title: {
    	         text: 'Amount(Thousands)'         
    	      }      
    	   };
    	   var tooltip = {
    	      headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
    	      pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
    	         '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
    	      footerFormat: '</table>',
    	      shared: true,
    	      useHTML: true
    	   };
    	   var plotOptions = {
    	      column: {
    	         pointPadding: 0.2,
    	         borderWidth: 0
    	      }
    	   };  
    	   var credits = {
    	      enabled: false
    	   };
    	   $.ajax({
      			
          		type:"POST",
          		url:"dashboard",
        
          		datatype:"json",
          		success:function(data){
          			
        
          	    	
          			for(var a=0 ; a<data.length; a++)
          	    	{					bb=data[a];
          	   							cc=bb.sale;
          	   							dd=bb.profit;
          	   							ee=bb.expense;
          	   							cash=bb.sale;
          	   							sale=bb.profit;
          	   							profit=bb.expense;
          	   						$('#irf').text("Cash in Hand:"+bb.cash);			
          	   					$('#reciept').text("Recieveable:"+bb.recieveable);
          	   				$('#payment').text("Payable:"+bb.payable);
    
          	    	}
          		}});
  
    	   var series= [{
    	        name: 'COGS',
    	            data: [cash, 28.8, 18.5, 23.4, 44.0, 64.5, 67.0, 55.3, 23.2, 33.5, 33.6, 53.3]
    	        }, {
    	            name: 'Sale',
    	            data: [sale, 48.8, 98.5, 93.4, 106.0, 84.5, 105.0, 104.3, 91.2, 83.5, 106.6, 92.3]
    	        }, {
    	            name: '{Profit}',
    	            data: [profit, 28.8, 38.3, 43.4, 47.0, 48.3, 59.0, 59.6, 52.4, 65.2, 59.3, 51.2]
    	        }, ];     
          	

          	   		

          			
          			
            		  
              		
          	        		
    	   var json = {};   
    	   json.chart = chart; 
    	   json.title = title;   
    	   json.subtitle = subtitle; 
    	   json.tooltip = tooltip;
    	   json.xAxis = xAxis;
    	   json.yAxis = yAxis;  
    	   json.series = series;
    	   json.plotOptions = plotOptions;  
    	   json.credits = credits;
    	  
    	   $('#chat').highcharts(json);
    	   var title1 = {
    			      text: 'Income and Expenses from 12 Month'   
    			   };
    			   var subtitle1 = {
    			      text: ''
    			   };
    			   var xAxis1 = {
    			      categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    			         'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    			   };
    			   var yAxis1 = {
    			      title: {
    			         text: ''
    			      },
    			      plotLines1: [{
    			         value: 0,
    			         width: 1,
    			         color: '#808080'
    			      }]
    			   };   

    			   var tooltip1 = {
    			      valueSuffix: '\xB0C'
    			   }

    			   var legend1 = {
    			      layout: 'vertical',
    			      align: 'right',
    			      verticalAlign: 'middle',
    			      borderWidth: 0
    			   };

    			   var series1 =  [
    			      {
    			         name: 'Profit',
    			         data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2,
    			            26.5, 23.3, 18.3, 13.9, 9.6]
    			      }, 
    			      {
    			         name: 'Expense',
    			         data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8,
    			            24.1, 20.1, 14.1, 8.6, 2.5]
    			      },
    			      {
    			         name: 'Income',
    			         data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 
    			            16.6, 14.2, 10.3, 6.6, 4.8]
    			      }
    			   ];

    			   var json1 = {};

    			   json1.title = title1;
    			   json1.subtitle = subtitle1;
    			   json1.xAxis = xAxis1;
    			   json1.yAxis = yAxis1;
    			   json1.tooltip = tooltip1;
    			   json1.legend = legend1;
    			   json1.series = series1;
    			 
    			   $('#ali').highcharts(json1);
    			   
    			   var chart2 = {
    					      type: 'bar'
    					   };
    					   var title2 = {
    					      text: 'Expenses from 3 Months '   
    					   };
    					   var subtitle2 = {
    					      text: 'Financial Reports'  
    					   };
    					   var xAxis2 = {
    					      categories: ['Advertising', 'Salary', 'Electricity Expenses', 'Other Expenses', 'Transportion'],
    					      title: {
    					         text: null
    					      }
    					   };
    					   var yAxis2 = {
    					      min: 0,
    					      title: {
    					         text: 'Expenses (in thousand)',
    					         align: 'high'
    					      },
    					      labels2: {
    					         overflow: 'justify'
    					      }
    					   };
    					   var tooltip2 = {
    					      valueSuffix: ' Hundred '
    					   };
    					   var plotOptions2 = {
    					      bar: {
    					         dataLabels: {
    					            enabled: true
    					         }
    					      }
    					   };
    					   var legend2 = {
    					      layout: 'vertical',
    					      align: 'right',
    					      verticalAlign: 'top',
    					      x: -40,
    					      y: 100,
    					      floating: true,
    					      borderWidth: 1,
    					      backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
    					      shadow: true
    					   };
    					   var credits2 = {
    					      enabled: false
    					   };
    					   
    					   var series2= [{
    					         name: 'First Month',
    					            data: [107, 31, 635, 203, 2]
    					        }, {
    					            name: 'Second Month',
    					            data: [133, 156, 947, 408, 6]
    					        }, {
    					            name: '3rd Month',
    					            data: [973, 914, 4054, 732, 34]      
    						    }
    					   ];     
    					      
    					   var json2 = {};   
    					   json2.chart = chart2; 
    					   json2.title = title2;   
    					   json2.subtitle = subtitle2; 
    					   json2.tooltip = tooltip2;
    					   json2.xAxis = xAxis2;
    					   json2.yAxis = yAxis2;  
    					   json2.series = series2;
    					   json2.plotOptions = plotOptions2;
    					   json2.legend = legend2;
    					   json2.credits = credits2;
    					   $('#bar').highcharts(json2);
    					  
    	  
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
          <h3><i class="fa fa-angle-right"></i> Financial DashBoard</h3>
              <!-- page start-->
              <div class="tab-pane" id="chartjs">
                  <div class="row mt">
                      <div class="col-lg-6">
                                    	 <div class="panel panel-primary">
          	 		<div class="panel-heading">Sales vs COGS  vs Profit</div>

							 
                              <div class="panel-body text-center">
                               <div id="chat" ></div>
                              </div>
                          </div>
        	         </div>   
									                  <div class="col-lg-6">
                          
						
                              <div class="panel panel-primary">
                                        
      						<div class="panel-heading">Top 5 Recieveable</div>
      
    
                                    <table class="table table-bordered table-striped table-condensed">
                              <thead>
                              <tr>
                                  <th>No</th>
                                  <th>Name</th>
                                  <th>Amount</th>
                                  
                              </tr>
                              </thead>
                              <tbody>
                              <tr>
                                  <td>1</td>
                                  <td>waheed company</td>
                                   <td>500000 Rs</td>
                                  
                              </tr>
                               <tr>
                               <td>2</td>
                                  <td>sahara textile</td>
                                   <td>400000 Rs</td>
                                  
                              </tr> <tr>
                              <td>3</td>
                                  <td>hassan limited</td>
                                   <td>300000 Rs</td>
                                  
                              </tr> <tr>
                                  <td>4</td>
                                  <td>Shezore textile</td>
                                   <td>200000 Rs</td>
                                                               </tr> <tr>
                                  <td>5</td>
                                  <td>sitara mills</td>
                                   <td>100000 Rs</td>
                                  
                              </tr>
                          </tbody>
                          </table>
                            
                              </div>
                          </div>
								                  </div>
                  <div class="row mt">
                      <div class="col-lg-6">
                          
                                    	 <div class="panel panel-primary">
          	 		<div class="panel-heading">Expenses</div>
                             <div id="bar" ></div>
                              </div>
                          </div>
                                             <div class="col-lg-6">
                          
						
                              <div class="panel panel-danger">
                                        
      						<div class="panel-heading">Top 5 Payable</div>
      
    
                                    <table class="table table-bordered table-striped table-condensed">
                              <thead>
                              <tr>
                                    <th>No</th>
                                  <th>Name</th>
                                  <th>Amount</th>
                            
                              </tr>
                              </thead>
                              <tbody>
                              <tr>
                                  <td>1</td>
                                  <td>Sajjad</td>
                                   <td>1000000 Rs</td>
                                  
                              </tr>
                               <tr>
                               <td>2</td>
                                  <td>Aqeel</td>
                                   <td>800000 Rs</td>
                                  
                              </tr> <tr>
                              <td>3</td>
                                  <td>Mumtaz</td>
                                   <td>600000 Rs</td>
                                  
                              </tr> <tr>
                                  <td>4</td>
                                  <td>hamza</td>
                                   <td>400000 Rs</td>
                                                               </tr> <tr>
                                  <td>5</td>
                                  <td>Shahzed</td>
                                   <td>100000 Rs</td>
                                  
                              </tr>
                          </tbody>
                          </table>
                            
                              </div>
                          </div>
                      </div>
                      </div>
                                   
                  <div class="row mt">
                      <div class="col-lg-6">
                          <div class="content-panel">
							  <h4><i class="fa fa-angle-right"></i> Line Chart</h4>
                              <div class="panel-body text-center">
                                <div id="ali"></div>
                              </div>
                          </div>
                      </div>
                      
    
    
                    						                  <div class="col-lg-6">
                          
						
                              <div class="panel panel-primary">
                                        
      						<div id="my" class="panel-heading">Balance</div>
      						
      			<div class="alert alert-success"><h4 id="irf">Well done!</h4> </div>
      			<div class="alert alert-success"><h4>Cash in Bank: 9 Million Rs</h4></div>
      <div class="alert alert-danger" id="payment"> <h4>Account Payable Balance: 3000 Million Rs</h4></div>
      		 <div class="alert alert-info" id="reciept"> <h4>Account Payable Balance: 3000 Million Rs</h4></div>
      		
      		<div class="alert alert-info"><h4>Net Profit: 6  Million Rs</h4></div>
      		
      
      
    
                                                                 </div>
                          </div>
                  </div>
              </div>
              <!-- page end-->
          </section>          
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
             Galaxy ERP(Easily monitoring the heartbeat of Your Business)
              
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>


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
