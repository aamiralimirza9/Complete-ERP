<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>TO DO LIST</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
         <script src="js/jquery.js"></script>
         <script>
         
         $(document).on("click", ".Add", function () {
             var mt_no= $(this).data('id');
            // var mtId= $(this).data('nam');
            //  var mtQuantity= $(this).data('type');
         //     var mtOrder=$(this).data('nam');
           
              
           //  $(".modal-body #POrderNo").val(mt_no);
       //     $(".modal-body #MtNo").val(mtId);
      //       $(".modal-body #MtQuantity").val(mtQuantity);
          //   $(".modal-body #OrderId").val(mtOrder);
             
        
        	 $.ajax({
     			type:"Post",
     			url:"TryTodo",
     			data:{
     				pono:mt_no,
     				 
     			},
     			datatype:"json",
     			success:function(data){
     				
     				
     				
     				for(var a=0 ; a<data.length; a++)
     	    		{					var bb=	data[a];
     	    		
     	    		
     	    		
     	    		$('#data tr').eq(0).after(' <tr><td>'+bb.poNo+'</td><td>'+bb.MtNo+'</td><td>'+bb.MtQuantity+'</td><td>'+bb.OrderNo+'</td><td><Button type="button" class="removebutton" title="remove this row">X</Button></td></tr>data-toggle="modal" data-target="#edit"');			
     	    			
     	    		}
     				
     			}
     			
     				
     			
     			
     			
     		});
        	 
        	 
        
   
         
       //  $(document).on('click', 'button.print', function () {
    	   
    	   
    	   
      $(document).on('click', 'button.removebutton', function () {
          	 
      	     $(this).closest('tr').remove();
      	     return false;
      	 });

      $("#total").click(function(event){
     	 window.open("pdfServlet?name=GOODissue&id="+mt_no+"");
 	
     	 
 	 });
 	 
 	 

         });
       
       
       

         $(document).ready(function(){
        	 
        	  

         	var value="hello";        
 		   	     
        	var v=$(this).val()	
     		$.ajax({
     		type:"POST",
     		url:"todoServlet",
     		data:{
     			jvlist:value,
     			
     	
     		},
     		datatype:"json",
     		success:function(data){
     		
     			
     	           
     			for(var a=0 ; a<data.length; a++)
     			{	var bb=	data[a]
     			
     			var v=data[bb.ponOId];
     			
     				abc="<div class='col-lg-4 col-md-4 col-sm-4 mb'><div style='background:#white' class='product-panel-2 pn'><h5>Production Order</h5><div class='badge  badge-hot' style='background:#1ACAC0'>"+bb.mptdId+"</div><h5 class='mt'>"+bb.ponOId+"</h5><h6>"+bb.OrderId+"</h6><button data-id="+bb.ponOId+" data-nam="+bb.OrderNo+"   data-toggle='modal' class='Add'  data-target='#edit1' >show view</button></br></br><a href='purchasingReq.jsp?name="+bb.ponOId+"&val="+bb.OrderId+"'  class='btn btn-info'  role='button'>Purchasing Requisition</a></div></div>";
 	
     				$("#yahoo").append(abc);
     				
     				
     			}
     	    	
     		}

     			
     			
     		});	});
                  
         </script>
         
          <% String s=(String)session.getAttribute("uname");%>
          <script>
          $(document).ready(function() {
          	

        	  $("#dashboard").hide();
              $("#inventory").hide();
              $("#masterdata").hide();
              $("#menu").hide();
              $("#todolist").hide();
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
     
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
          <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	
              	  <h5 class="centered"><%=s%></h5>
              	  	
                  <li class="mt" id="dashboard">
                      <a href="dashboard2.jsp">
                          <i class="fa fa-dashboard"></i>
                          <span>Dashboard</span>
                      </a>
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
                               
                          <li><a  href="Mpdashboard.jsp">MP Menu</a></li>
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
            <a  class="logo"><b>GALAXY ERP</b></a>
            <!--logo end-->
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="login.jsp">Logout</a></li>
            	</ul>
            </div>
        </header>      
      
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> Material and Planing</h3>
          	
          	<!-- CHART PANEL -->
          	
          	  <div id="yahoo" class="row">
                      
						
				
                


                     
              </div><!-- /END CHART - 4TH ROW OF PANELS -->
          	
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->
      </section>

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
             
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
	
	 <div class="modal fade" id="edit1" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
      </div>
                   <div class="modal-body">
           <div class="content-panel">
                      <div class="row mt">
                      	<div class="col-lg-6">
                      	
            		  <table id="data" class="table table-bordered table-striped table-condensed">
                              <tbody>
                              <thead>
                              <tr>
                                  <th>production Order Id</th>
                                  <th>Material Id</th>
                                  <th>Material Quantity</th>
                                  <th>Order Id </th>
                                  <th>Remove</th>
                                  
                                  
                                  
                                            
                                                    </tr>
                              </thead>
                                                      
            
            
                                          
                             </tbody>
                              
                          </table>
                         
                                             
                  
          </div>
                   	<div class="col-lg-6">
     
          <button type="submit"  id="total"   class="btn btn-theme">Print</button>                                  
                   
          </div>
                    	
                
          </div></div>
        
      </div>
         
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });

  </script>

  </body>
</html>
