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
  
    <script >
    $(document).ready(function() { 
    

	
			var cc=0;
  			var bb;
  			var dd=0;
  			var ee=0;
  			
    	   var chart = {
    	      type: 'column'
    	   };
    	   var title = {
    	      text: 'Vendor Payment'   
    	   };
    	   var subtitle = {
    	      text: 'purchase'  
    	   };
    	   var xAxis = {
    	      categories: ['Jan','Feb','Mar','Apr','May','Jun'],
    	      crosshair: true
    	   };
    	   var yAxis = {
    	      min: 0,
    	      title: {
    	         text: 'Amount'         
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
          	   						$('#irf').text("Cash in Hand:"+bb.cash);			
          	   					$('#reciept').text("Recieveable:"+bb.recieveable);
          	   				$('#payment').text("Payable:"+bb.payable);
          	    	}
          		}});
  
    	   var series= [{
    	        name: 'Vendor',
    	            data: [300,400,700,900]
    	        }, {
    	            name: 'Customer',
    	            data: [400, 78.8, 98.5, 93.4, 106.0, 84.5]
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
    			      text: 'Purchases (Invoiced)'   
    			   };
    			   var subtitle1 = {
    			      text: ''
    			   };
    			   var xAxis1 = {
    			      categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun']
    			    
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
    			         name: 'purchase',
    			         data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2,
   			          ]
    			      }, 
    			      
    			      
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
    			 			  
    	  
    	});
    	</script>
  </head>

  <body>

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
              
              	
              	  
              	  	
                  <li class="mt" id="dashboard">
                      <a href="dashboard2.jsp">
                          <i class="fa fa-dashboard"></i>
                          <span>Dashboard</span>
                      </a>
                  </li>

                  <li class="sub-menu" id="masterdata">
                      <a href="javascript:;" >
                          <i class="fa fa-desktop"></i>
                          <span>Master Data</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="materialData.jsp">Material data</a></li>
                          <li><a  href="MaterialType.jsp">Material type</a></li>
                          <li><a  href="vender.jsp">Vendor</a></li>
                          <li><a  href="materialdataCurd.jsp">Show Material data</a></li>
                          <li><a  href="MaterialTypeCurd.jsp">show Material type</a></li>
                          <li><a  href="VendorCurd.jsp">show Vendor</a></li>
                          
                      </ul>
                  </li>

                  <li class="sub-menu" id="menu">
                      <a href="javascript:;" >
                          <i class="fa fa-cogs"></i>
                          <span>Main menu</span>
                      </a>
                      <ul class="sub">
                               
                          <li><a  href="Mpdashboard.jsp">PM Menu</a></li>
                          <li><a  href="mainmenu.jsp">Main Menu</a></li>
                       
                      </ul>
                  </li>
                  <li class="sub-menu" id="inventory">
                      <a  href="javascript:;" >
                          <i class="fa fa-book"></i>
                          <span>Inventory</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="InventoryGoodsRecipets.jsp">Goods recipets</a></li>
                          <li><a  href="partialGoodsIssues.jsp">Goods issues</a></li>
                          <li><a  href="Batch.jsp">Batch</a></li>
                          <li><a    href="bin.jsp">Bin </a>
                         <li><a    href="ShowInventorySearch.jsp.jsp">Inventory show </a>
                         <li><a    href="productionOrderSearch.jsp">Production show</a>
                      </ul>
                  </li>
                 
                  <li class="sub-menu" id="todolist">
                      <a href="javascript:;" >
                          <i class=" fa fa-bar-chart-o"></i>
                          <span>To Do List</span>
                      </a>
                      <ul class="sub">
                          <li><a  href="todoList.jsp">Todolist</a></li>
                         <li><a  href="InventoryTodolist.jsp">Inventory To do List</a></li>
                          
                      </ul>
                  </li>

              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
        <section id="container" >
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          <h3><i class="fa fa-angle-right"></i> Material Planing DashBoard</h3>
              <!-- page start-->
              <div class="tab-pane" id="chartjs">
                  <div class="row mt">
                      <div class="col-lg-6">
                                    	 <div class="panel panel-primary">
          	 		<div class="panel-heading">Purchasing </div>

							 
                              <div class="panel-body text-center">
                               <div id="chat" ></div>
                              </div>
                          </div>
        	         </div>   
									                  <div class="col-lg-6">
                          
						
                              <div class="panel panel-primary">
                                        
      						<div class="panel-heading">Top 5 sales by Customer</div>
      
    
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
                                  <td>Mohammad Bounga</td>
                                   <td>55900 Rs</td>
                                  
                              </tr>
                               <tr>
                               <td>2</td>
                                  <td>Julia Rivero</td>
                                   <td>16809 Rs</td>
                                  
                              </tr> <tr>
                              <td>3</td>
                                  <td>Albert Simpsons</td>
                                   <td>34520 Rs</td>
                                  
                              </tr> <tr>
                                  <td>4</td>
                                  <td>john  M.Brown</td>
                                   <td>33946 Rs</td>
                                                               </tr> <tr>
                                  <td>5</td>
                                  <td>Algorito</td>
                                   <td>31766 Rs</td>
                                  
                              </tr>
                          </tbody>
                          </table>
                            
                              </div>
                          </div>
								                  </div>
                  <div class="row mt">
                      
                                             <div class="col-lg-6">
                          
						
                              <div class="panel panel-primary">
                                        
      					<div class="panel-heading">Top 5 purchases by product</div>
      
    
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
                                  <td>printer ,All-in-one</td>
                                   <td>1000000 Rs</td>
                                  
                              </tr>
                               <tr>
                               <td>2</td>
                                  <td>HDD SH-2</td>
                                   <td>800000 Rs</td>
                                  
                              </tr> <tr>
                              <td>3</td>
                                  <td>Laptop E5023</td>
                                   <td>600000 Rs</td>
                                  
                              </tr> <tr>
                                  <td>4</td>
                                  <td>MotherBoard A202Z</td>
                                   <td>400000 Rs</td>
                                                               </tr> <tr>
                                  <td>5</td>
                                  <td>Processer AMD 8-Core</td>
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
             
          </div>
      </footer>
      <!--footer end-->
  </section>



  </body>
</html>
