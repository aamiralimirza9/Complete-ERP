<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Inventory Table</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
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
    
    <script src="js/jquery.js"></script>
    <script src="js/todorecipt.js"></script>
<!--      <script src="js/ShowGoodsReciptsIds.js"></script>   -->
  
    <script>
        
        $(document).ready(function(){
        $("#modalOpen").click(function(event){
        
        $('#edit2').modal('toggle');
        var mt_no= $("#prId").val();
       
         
    
    	 $.ajax({
 			type:"Post",
 			url:"TryTodo",
 			data:{
 				poID:mt_no,
 				 
 			},
 			datatype:"json",
 			success:function(data){
 				
 				$(' #data1 tr:not(:first)').remove();
 				
 				for(var a=0 ; a<data.length; a++)
 	    		{					var bb=	data[a];
 	    		
 	   		$('#data1 tr').eq(0).after(' <tr><td>'+bb.mno+'</td><td>'+bb.name+'</td><td>'+bb.mtQuantity+'</td><td>'+bb.price+'</td><td><Button type="button" class="removebutton" title="remove this row">X</Button></td></tr>data-toggle="modal" data-target="#edit"');	
 	    		}
 				
 			}
 			
 				
 			
 			
 			
 		});
        
       
        
        });
        
        
        
        $("#aciveoff").click(function(event){ 
        	
        	var PoId= $("#prId").val();
        	
    
        	
        	$.ajax({
     			type:"Post",
     			url:"TryTodo",
     			data:{
     				pridOff:PoId,
     				 
     			},
     			datatype:"json",
     			success:function(data){
     				
     				
     				
     				
     				
     			}
     			
     				
     			
     			
     			
     		});
        	
        
        });
        });
        
        </script>
  
   
    <script >
    
    $(document).ready(function(){
    	
    	var orderID=$("#oderId").val();
    	var productionID=$("#PorderId").val();
    	var prid=$("#prId").val();
    	var grId=$("#GrId").val();
    	
    	
    	
    	$.ajax({
    		type:"Post",
    		url:"tryinventoryShow",
    		data:{
    			OrderId:orderID,
    			Porductionid:productionID,
    			PrId:prid,
    			Grid:grId,

    		
    			
    		},
    		datatype:"json",
    		success:function(data){
    			for(var a=0 ; a<data.length; a++)
        		{					var bb=	data[a];
        		
        	
        		   //  alert(bb.OrderId);
        			$("#oderId").val(bb.OrderId).text(bb.OrderId).appendTo("#oderId");
        			
        			$("#PorderId").val(bb.ProductionOrder).text(bb.ProductionOrder).appendTo("#PorderId");
        			
        			$("#GrId").val(bb.GrNo).text(bb.GrNo).appendTo("#GrId");
        			$("#prId").val(bb.PrId).text(bb.PrId).appendTo("#PrID");		
        		}
    		}
    	});

    });
    </script>
    <script>
    $(document).on("click", ".Add", function () {
        var mt_no= $(this).data('id');
        var mt_Quantity= $(this).data('nam');
        var mt_price= $(this).data('type');
        
        $(".modal-body #MtNo").val(mt_no);
        $(".modal-body #MtQuantity").val(mt_Quantity);
        $(".modal-body #Mtprice").val(mt_price);
        
   });

   $(document).ready(function(){
   	
   	 $("#prId").keydown(function(e){
   		if(e.which == 16) {
   		 
   		 $('#edit').modal('toggle');
   	
   	
   		 
   		 
   	
   	 var prId=$("#prId").val();
              
   	           
   		$.ajax({
   			type:"Post",
   			url:"ModalServlet",
   			data:{
   				prid:prId,
   				
   				
   			},
   			datatype:"json",
   			success:function(data){
   				
   				
   				$(' #data tr:not(:first)').remove();
   				for(var a=0 ; a<data.length; a++)
   	    		{					var bb=	data[a];
   	    		
   	    	
   	    		$(' #data tr').eq(0).after(' <tr><td>'+bb.PrId+'</td><td>'+bb.MaterialNo+'</td><td>'+bb.PrQuantity+'</td><td>'+bb.Mprice+'</td><td><Button type="button" data-id='+bb.MaterialNo+' data-nam='+bb.PrQuantity+' data-type='+bb.Mprice+' data-toggle="modal" data-target="#edit1" class="Add" title="Add  this row">Add</Button></td></tr>data-toggle="modal" data-target="#edit"');
   	    		
   	    		/*	$(".modal-body #MaterialId").val(bb.MaterialNo).text(bb.MaterialNo).appendTo(".modal-body #MaterialId");
   	    			$(".modal-body #prQuantity").val(bb.PrQuantity).text(bb.PrQuantity).appendTo(".modal-body #prQuantity");
   	    			$(".modal-body #Price").val(bb.Mprice).text(bb.Mprice).appendTo(".modal-body #Price");
   	    			
   	    			*/
   	    	    
   	    		}
   			}
   		});
   		}
   	 });
   	 
   	 
   		$("#mod").click(function(event){
   	//	$('#edit').modal('toggle');
   		var MaterailNo=$(".modal-body #MtNo").val();
   		var MaterialQuantity=$(".modal-body #MtQuantity").val();
   		var MaterialPrice=$(".modal-body #Mtprice").val();
   		var binId=$(".modal-body #binId").val();
   		var Batchid=$(".modal-body #BatchId").val();
   		
   		$('#Materialshow tr').eq(0).after('<tr><td colspan="1" id="materialId" class="1price">'+MaterailNo+'</td><td colspan="1" id="prQuantity" class="prquantity">'+MaterialQuantity+'</td><td colspan="1" id="MPrice" class="price">'+MaterialPrice+'</td><td colspan="1" id="BinId" class="Bid">'+binId+'</td><td colspan="1" id="BatchId" class="Batchid">'+Batchid+'</td><td><Button type="button" class="removebutton" title="remove this row">X</Button></td></tr>');
   			
   			
   			
   			
   		});
   		

   		 $(document).on('click', 'button.removebutton', function () {
   		 
   		     $(this).closest('tr').remove();
   		     return false;
   		 });
   		 
   		 
   		 

   		 $("#total").click(function(event){
   			var prid=$("#prId").val();  
   					    var grid=$("#GrId").val();
   	     	 var mtqt=$(".modal-body #MtQuantity").val();
   			var  tabledata=Array();
   			var  tablePrice=Array();
   			var  tabletotal=Array();
   			var  tablePrQuantity=Array();
   			var tableBin=Array();
   			var tableBatch=Array();
   		   			var totaltax=0;
   			var sum=0;
   			var total=0;
   			
   			$(".price").each(function(){
   				var value=$("this").text();
   				//adding the value in only numbers 
   				if(!isNaN(value)&& value.length !=0){
   					sum+=parseFloat(value);
   				}
   				
   				
   			});
   			$("<td colspan='2' class='price' id='sum'>"+sum+"</td>")//.insertAfter('#Materialshow tr td:last')
   			$(".price").each(function() {

   				var value = $(this).text();
    		    // add only if the value is number
    		    if(!isNaN(value) && value.length != 0) {
    		        total += parseFloat(value)*mtqt;
    		       totaltax=total*0.145+total;
    		       
    		      
    		    }
    		  
    		});
    		$('#Materialshow tr td').eq(-2).after("<td colspan='2' >"+total+"</td>");
    
    		$('#Materialshow tr td').eq(-1).after("<td colspan='2' >"+totaltax+"</td>");
   				
   		
   				var header=Array();
   				$("table tr th").each(function(i, v){
   				        header[i] = $(this).text();
   				})
   				               
   				
   				//var a="s";
   				$("#Materialshow tr").each(function(i,v){
   					
   					tabledata[i]=Array();
   					$(this).children('#materialId').each(function(ii,vv){
   						tabledata[i][ii]=$(this).text();
   						
   					});  
   					
   				});   
   				$("#Materialshow tr").each(function(i,v){
   					
   					tablePrice[i]=Array();
   					$(this).children('#MPrice').each(function(ii,vv){
   						tablePrice[i][ii]=$(this).text();
   					});
   				});
   				
   	             $("#Materialshow tr").each(function(i,v){
   					
   				    tablePrQuantity[i]=Array();
   					$(this).children('#prQuantity').each(function(ii,vv){
   						tablePrQuantity[i][ii]=$(this).text();
   					});
   				});
   	             
   	             $("#Materialshow tr").each(function(i,v){
   						
   	            	 tableBin[i]=Array();
   						$(this).children('#BinId').each(function(ii,vv){
   							tableBin[i][ii]=$(this).text();
   						});
   					});
   	             
   	             $("#Materialshow tr").each(function(i,v){
   						
   	            	 tableBatch[i]=Array();
   						$(this).children('#BatchId').each(function(ii,vv){
   							tableBatch[i][ii]=$(this).text();
   						});
   					});
   				
   	             
   	             
   				
   				
   				
   				$.ajax({
   					type:"POST",
   					url:"ModalServlet",
   					data:{
   						
   						"tableName[]":tabledata,
   						
   						"tableprice[]":tablePrice,
   						"tableprQuantity[]":tablePrQuantity,
   						"tablebinid[]":tableBin,
   						"tablebatchid[]":tableBatch,
   						PRID:prid,
   						Amount:totaltax,
   					
   						 GRID:grid,
   						
   				
   				
   					},
   					datatype:"json",
   	  	    		success:function(data){
   	  	    		
   	  	    		window.open("demo?name=GOOD");
   	  	   	window.location.href='showAccountTodolist.jsp';
   	  		
   	  	    		}
   				});
   				

   			
   		});
   		
   		
   		
   	});    


    
    
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
          	<h3><i class="fa fa-angle-right"></i>Partial Inventory data</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          		<div class="panel panel-primary">
          	<div class="panel-heading">Entry Form</div>
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i> Form Elements</h4>
                      <form class="form-horizontal style-form" >
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Order id</label>
                              <div class="col-sm-6">
                                  <input type="text" id="oderId" class="form-control round-form" disabled>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Production order id</label>
                              <div class="col-sm-6">
                                  <input type="text" id="PorderId" class="form-control round-form" disabled>
                                  
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Purchasing Req ID</label>
                              <div class="col-sm-6">
                                  <input type="text" id="prId" class="form-control round-form" >
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Gr Id</label>
                              <div class="col-sm-6">
                                  <input type="text" id="GrId" class="form-control round-form" disabled  >
                              </div>
                          </div>
                          
                          
                           
                         
                      </form>
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
          	
          	<br>
          	<br>
          	
            <div class="content-panel">
                      <div class="row mt">
                      	<div class="col-lg-6">
                      	
            		  <table id="Materialshow" class="table table-bordered table-striped table-condensed">
                              <tbody>
                              <thead>
                              <tr>
                                  <th>Material no</th>
                                  <th>pr Quantity</th>
                                  <th>Material Price</th>
                                  <th> Bin Id </th>
                                  <th> Batch Id</th>
                                  <th>Remove</th>
                                  
                                            
                                                    </tr>
                              </thead>
                                           <thead>                 
            
            </thead>
                                           <thead>    
                                                     
            <tr>
            <td colspan="5">Total Without tax</td>
           
            </tr>
             
            </thead>
             <thead>    
                                                     
            <tr>
            <td colspan="5">Total with Tax (G.S.T)</td>
           
            </tr>
             
            </thead>
                             </tbody>
                              
                          </table>
                         
                                             
                  
          </div>
                    	<div class="col-lg-6">
     
          <button type="submit"  id="total"   class="btn btn-theme">Complete</button>                                  
                    <button type="button"  id="modalOpen" style="float:right"   class="btn btn-theme">open to do list</button>                                  
          </div>
                
          </div></div>
         </div>
          	
          	
		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
     
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
	
	
	
	  
	<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
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
                                  <th>pr id</th>
                                  <th>Material no</th>
                                  <th>Material Quantity</th>
                                  <th>Material Price</th>
                                  
                                   <th>Edit</th>
                                  
                                            
                                                    </tr>
                              </thead>
                                           <thead>                 
            
            </thead>
                                          
                             </tbody>
                              
                          </table>
                         
                                             
                  
          </div>
                    	
                
          </div></div>
        
      </div>
       <!--    <div class="modal-footer ">
        <button type="button" id="mod" class="btn btn-warning btn-lg" data-dismiss="modal" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Add to Cart</button>
      </div>    -->
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
        <button type="button" id="del" class="btn btn-success"  ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        <button type="button"  class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>  
  
  <div class="modal fade" id="edit1" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
      </div>
          <div class="modal-body">
          <div class="form-group">
          Material no:
    <input type="text" class="form-control " name="materialNo" id="MtNo" value=""/>
        </div>
        <div class="form-group">
          material Quantity:
        <input type="text" class="form-control " name="mtQuantity" id="MtQuantity" value=""/>
        </div>
        
         <div class="form-group">
         Material Price 
        <input type="text" class="form-control " name="MtPrice" id="Mtprice" value=""/>
        </div>
        
         <div class="form-group">
        add Bin Id 
        <input type="text" class="form-control " name="bId" id="binId" value=""/>
        </div>
         <div class="form-group">
        add Batch Id 
        <input type="text" class="form-control " name="batchId" id="BatchId" value=""/>
        </div>
        
      </div>
          <div class="modal-footer ">
        <button type="button" id="mod" class="btn btn-warning btn-lg" data-dismiss="modal" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Add to Cart</button>
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
        <button type="button" id="del" class="btn btn-success"  ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
        <button type="button"  class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
      </div>
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
    
    
     <div class="modal fade" id="edit2" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
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
                      	
            		  <table id="data1" class="table table-bordered table-striped table-condensed">
                              <tbody>
                              <thead>
                              <tr>
                                  <th>material Id</th>
                                  <th>Material Name</th>
                                  <th>Material Quantity</th>
                                  <th>Material Price </th>
                                  <th>Remove</th>
                                  
                                  
                                  
                                            
                                                    </tr>
                              </thead>
                                                      
            
            
                                          
                             </tbody>
                              
                          </table>
                         
                                             
                  
          </div>
                    	<div class="col-lg-6">
        <button type="submit"  id="aciveoff"   class="btn btn-theme">remove to do list</button>                                 
                   
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
