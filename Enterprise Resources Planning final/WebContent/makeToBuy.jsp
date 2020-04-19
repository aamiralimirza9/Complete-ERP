<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">



    <title>Enterprise Resource Planning</title>
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
        <SCRIPT src="js/orderpage.js"></SCRIPT>
        <script type="text/javascript" src="js/bootstrap-datetimepicker.j"></script>

          <% String s=(String)session.getAttribute("uname");%>
          <script>
          $(document).ready(function() {
          	

        	  $("#masterData").hide();
              $("#MainMenu").hide();
              $("#toDoList").hide();
              $("#charts").hide();
              $("#f").hide();
              $("#c").hide();
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
        
        
        <script>
        $(document).on("click",".open-AddBookDialog",function(){
  	    	var pname=$(this).data('name');
  	    	var quan=$(this).data('quan');
  	    	var prc=$(this).data('prc');
  	    	$(".modal-body #productName").val(pname);
  	    	$(".modal-body #quantity").val(quan);
  	    	$(".modal-body #price").val(prc);

  	      });
        </script>
          <script >   
          $(document).ready(function() {
      	    
      		$("#search").keyup(function(){

      			var search=$("#search").val();
     		
      	      $.ajax({
      	    	  type:"POST",
      	  		url:"MakeToBuy", 
      	  		data:{
      	  			search1:search,
      	  		},
      	  		datatype:"json",
      			success:function(data){
      		
      			for(var a=0 ; a<data.length; a++)
      			{					var bb=	data[a];
      				
      		      		$('#Materialshow tr').eq(0).after(' <tr><td>'+bb.productName+'</td><td>'+bb.quantity+'</td><td>'+bb.price+'</td><td><p data-placement="top" data-toggle="tooltip" title="Edit"><button  data-name='+bb.productName+' data-quan='+bb.quantity+' data-prc='+bb.price+' class="open-AddBookDialog btn btn-primary"   data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td></tr>');  					

      						}
      			}
      	      });
      	      
      	});

  		$("#productName12").keyup(function(){

  			var pId=$("#productName12").val();
  	      $.ajax({
  	    	  type:"POST",
  	  		url:"MakeToBuy", 
  	  		data:{
  	  		    pId1:pId,
  	  		},
  	  		datatype:"json",
  			success:function(data){
  		
  			for(var a=0 ; a<data.length; a++)
  			{					var bb=	data[a];
  				

                    $("#productName12").val(bb.productName).text(bb.productName).appendTo("##productName12");

  						}
  			}
  	      });
  	      
  	});
  		
      	     $('#add').click(function(){
      	    	
      	    	
      	    	var quantity13 =$("#quantity").val();
         		var productName13 =$("#productName").val();
         		var price13=$("#price").val();
           		$('#dbtable tr').eq(0).after('<tr><td colspan="1" id="name">'+productName13+'</td><td colspan="1" id="quan" >'+quantity13+'</td><td colspan="1" class="price" id="prc">'+price13+'</td><td id="type">inventory</td><td><button type="button" class="removebutton" title="Remove this row">X</button></tr>');  
           		 $.ajax({
        	    	  type:"POST",
        	  		url:"MakeToBuy", 
        	  		data:{
        	  			
        	  		    pname1:productName13,
        	  		    q1:quantity13,
        	  		},
        	  		datatype:"json",
        			success:function(data){
        		
        			for(var a=0 ; a<data.length; a++)
        			{					var bb=	data[a];
                    $("#quantity").val(bb.quantity).text(bb.quantity).appendTo("#quantity");

        			
        				}
        			}
        	      });
      	    	 
      	     });
      	   $(document).on('click', 'button.removebutton', function () {
             	 
         	     $(this).closest('tr').remove();
         	     return false;
         	 });
      	 $('#addtoOrderList2').click(function(event) {
      		var productName1=$("#productName12").val();
      		
      		var quantity1=$("#quantity12").val();
     		var price1=$("#price12").val();
     		$('#dbtable  tr').eq(0).after('<tr><td colspan="1" id="name">'+productName1+'</td><td colspan="1" id="quan" >'+quantity1+'</td><td colspan="1" class="price" id="prc">'+price1+'</td><td id="type">Production</td><td><button type="button" class="removebutton" title="Remove this row">X</button></tr>');  
     	        });
      $(document).on('click', 'button.removebutton', function () {
      
          $(this).closest('tr').remove();
          return false;
      });
      $('#placeOrder').click(function(){
  	    var d="place";
  	  var cust=$("#customer").val();
  		var productName= Array(); 
  	 	 var quantity=Array();
  	 	 var price=Array();
  	 	 var ordertype=Array();
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
		$("<tr><td colspan='2' class='price' id='sum'>"+sum+"</td></td>").insertAfter('#dbtable tr td:last');
  	 	 $("#dbtable tr").each(function(i,v){
  	 			productName[i] = Array();
  			    $(this).children('#name').each(function(ii,vv){
  			    	productName[i][ii] = $(this).text();
  			    		    }); 
  			});
  	 	 $("#dbtable tr").each(function(i,v){
	 			ordertype[i] = Array();
			    $(this).children('#type').each(function(ii,vv){
			    	ordertype[i][ii] = $(this).text();
			 
			    		    }); 
			});
  	 	 $("#dbtable tr").each(function(i, v){
  				quantity[i] = Array();
  		    $(this).children('#quan').each(function(ii, vv){
  		    	quantity[i][ii] = $(this).text();
  		    }); 
  		});
  	 	 $("#dbtable tr").each(function(i, v){
			price[i] = Array();
		    $(this).children('#prc').each(function(ii, vv){
		    	price[i][ii] = $(this).text();
		    
		    }); 
		});
  	 	$.ajax({
  	   		type:"POST",
  	 		url:"MakeToBuy",
  	 		data:{
  	 			"nam":d,
  	 			"productName[]":productName,
  	 	  		 "quantity[]":quantity,
  	 	  		 "price[]":price,
  	 	  		 "types[]":ordertype,
  	 	  		 customer:cust,
  	 		},
  	 		datatype:"json",
  	 		success:function(data){
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
            <a  class="logo"><b>GALAXY ERP</b></a>
            <!--logo end-->
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="login.jsp">Logout</a></li>
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
                      <a href="index.html">
                          <i class="fa fa-dashboard"></i>
                          <span>Dashboard</span>
                      </a>
                  </li>
                  <li class="sub-menu" id="todolist">
                      <a href="salesTodoList.jsp">
                          <i class="fa fa-desktop"></i>
                          <span>To Do List</span>
                      </a>
                      </li>
                      
                  <li class="sub-menu" id="masterdata">
                      <a href="javascript:;" >
                          <i class=" fa fa-tasks"></i>
                          <span>Master Data</span>
                      </a>
                      <ul class="sub">
                      
                          <li><a  href="customer.jsp">Customer</a></li>
                          <li><a  href="channel.jsp">channel</a></li>
                          <li><a  href="company.jsp">Company</a></li>
                          <li><a  href="product.jsp">Product</a></li>
                          <li><a  href="productType.jsp">Product Type</a></li>
                          <li><a  href="route.jsp">Route</a></li>
                      
                   
                      </ul>
                  </li>
                  <li class="sub-menu" id="menu">
                      <a href="javascript:;" >
                          <i class="fa fa-book"></i>
                          <span>Main Menu</span>
                      </a>
                      <ul class="sub">
                        <li><a  href="order.jsp"> Sales Order</a></li>
                          <li><a  href="CheckOrder.jsp">Check Order</a></li>
                          <li><a  href="paymentRecipt.jsp">Payment Recipet</a></li>
                          
                          <li><a  href="makeToBuy.jsp">Make to Buy</a></li>
                          <li><a  href="makToStock.jsp">Make to stock</a></li>
                         <li><a  href="delivery.jsp">Sale Delivery</a></li>
                         
                      </ul>
                  </li>                  
           <!--         <li class="sub-menu"  id="report">
                      <a href="javascript:;" >
                          <i class=" fa fa-bar-chart-o"></i>
                          <span>Reporting</span>
                      </a>
                      <ul class="sub">
                       <li><a  href="OrderInvoice.jsp">Order Invoice</a></li>
                       <li><a  href="SellInvoice.jsp">Sale Invoice</a></li>
                       
                      </ul>
                       -->
                  </li>
                 
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i>Sales and Distribution</h3>
          	      </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
          	        	 <div class="panel panel-primary">
          	        	 <div class="panel-heading">Customer</div>
          	        	   	  <h4 class="mb"><i class="fa fa-angle-right"></i> Make to Buy</h4>
          	          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  
                  	  <!-- FORM -->
                      <form class="form-horizontal style-form" >
                      
                          <div class="form-group">
                              <label class="col-sm-1 col-sm-1 control-label">Customer Name</label>
                              <div class="col-sm-8">
                                  <input type="text" class="form-control" id="customer" required>
                              </div>
                          </div>
          	</form></div></div></div></div></div>
          	<!-- INLINE FORM ELELEMNTS -->
          	 <div class="panel panel-primary">
          	 		<div class="panel-heading">Entry Form</div>
          	<div class="row mt">
          		<div class="col-lg-12">
          			<div class="form-panel">
                
                      	<div class="row">
		             <form class="form-horizontal style-form" >
                       <div class="form-group">
                              <label class="col-sm-1 col-sm-1 control-label">Search</label>
                              <div class="col-sm-8">
                                  <input type="search" class="form-control" id="search" >
                              </div>
                          </div>
                          
                         
                      </form>
         
		
        
        <div class="col-md-12">
        <div class="table-responsive">

                
              <table id="Materialshow" class="table table-bordered table-striped table-condensed cf">
                   
                   <thead>
                   <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Price</th>
                      <th>Add</th>
                       
                       
                   </thead>
    <tbody></tbody>
        
</table>
<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Make To Stock</h4>
                  	  <!-- FORM -->
                      <form class="form-horizontal style-form" id="form1" >
                       
                           <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Product Name</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" id="productName12" required>
                              </div>
                          </div>
                         <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Enter Quantity</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" id="quantity12"  required>
                              </div>
                          </div>
                           <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Enter Price</label>
                              <div class="col-sm-10">
                                  <input type="text" class="form-control" id="price12" required>
                              </div>
                          </div>
                       <input type="button"  value="add" class="btn btn-theme" id="addtoOrderList2">
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div>

<div class="panel panel-primary">
          	 		<div class="panel-heading">Order List</div>
          	<div class="row mt">
          	<div class="col-lg-12">
                      	<div class="col-lg-6">
            		  <table id="dbtable" class="table table-bordered table-striped table-condensed">
                              <thead>
                              <tr>
                              
                              <th>Product Name</th>
                              <th>Quantity</th>
                              <th>Price</th>
                              <th>Order For</th>
                              <th>Delete</th>
                                 
                                                    </tr>
                              </thead>
                                           <thead>                 
            
            </thead>
                                           <thead>                 
            
            </thead>
                              </tbody>
                          </table>
                          
          <button type="submit" id="placeOrder" class="btn btn-theme">Place Order</button>           
          </div>

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
                
            </div>
            
        </div>
	</div>
</div>


<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
      </div>
          <div class="modal-body">
          <div class="form-group">
    <input type="text" class="form-control " name="productName1" id="productName" required />
        </div>
        <div class="form-group">
        
        <input type="text" class="form-control " name="quantity1" id="quantity" required />
        </div>
        
         <div class="form-group">
        
        <input type="text" class="form-control " name="quantity1" id="price" required/>
        </div>
    
      </div>
          <div class="modal-footer ">
        <button type="button" id="add" data-dismiss="modal" aria-hidden="true" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Add to Order</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    
    
    
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
      </div>
          <div class="modal-body">
       <input type="hidden" id="dal">
       <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>
       
      </div>
        <div class="modal-footer ">
        <button type="button" id="del" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        <button type="button"  class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
          	
          </div>	
          	
          			</div><!-- /form-panel -->
          		</div><!-- /col-lg-12 -->
          	</div><!-- /row -->
          	
          	


          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
          </div>
          </div>
         	
		</section>
      </section><!-- /MAIN CONTENT -->
      <section class="wraper">
      
      
      </section>

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
