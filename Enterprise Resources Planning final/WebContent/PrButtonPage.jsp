<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Inventory Data</title>
     
    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
    <script src="js/jquery.js"></script>
        <script>
        
        $(document).ready(function(){
        $("#modalOpen").click(function(event){
        
        $('#edit1').modal('toggle');
        var mt_no= $("#PId").val();
       
         
    
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
        
       
        
        });
        
        
        
        $("#activeoff").click(function(event){ 
        	
        	var PoId= $("#PId").val();
        	
        	
        	
        	$.ajax({
     			type:"Post",
     			url:"TryTodo",
     			data:{
     				productID:PoId,
     				 
     			},
     			datatype:"json",
     			success:function(data){
     				
     				
     				
     				
     				
     			}
     			
     				
     			
     			
     			
     		});
        	
        
        });
        });
        
        </script>  
        <script src="js/purchasingRequesition.js" ></script>
        <script>
        $(document).ready(function(){
        	
        	
               	$.ajax({
        		type:"Post",
        		url:"PrtableIdshowing",
        		data:{
        			
        		},
        		datatype:"json",
        		success:function(data){
        			for(var a=0 ; a<data.length; a++)
            		{					var bb=	data[a];
            	
            			$("#Vid").val(bb.VendorId).text(bb.VendorId).appendTo("#Vid");
            			
            			$("#POId").val(bb.ProOrderId).text(bb.ProOrderId).appendTo("#POId");
            			
            			$("#PId").val(bb.ProductId).text(bb.ProductId).appendTo("#PId");
            			$("#PrID").val(bb.PrId).text(bb.PrId).appendTo("#PrID");		
            		}
        		}
        	});

        });
        
        
        
        
        
        </script>
        
        
        
        
        
        <script>
        $(document).keyup(function(){
        	$("#MaterialId").keydown(function(e){
        		if(e.which == 16) {
          		var VendorId=$("#MaterialId").val();
          		
          		$.ajax({
          			type:"Post",
          			url:"materialIdReterivingServlet",
          			data:{
          				Mid:VendorId,
          				
          		
          			},
          			datatype:"json",
          			success:function(data){
          				for(var a=0 ; a<data.length; a++)
          	    		{					var bb=	data[a];
          	    
          	    			$("#MaterialId").val(bb.Mt_name).text(bb.Mt_name).appendTo("#MaterialId");
          	    			$("#MtPrice").val(bb.Mt_price).text(bb.Mt_price).appendTo("#MtPrice");
          	    					
          	    					
          	    		}
          				
        				

          			}
          			
          				
          			
          			
          			
          		});
        	
        		}		
        });
        	
        });
        
        
        </script>
          <script>
        $(document).ready(function(){
          	 $("#MaterialId").keyup(function(e){
          	
          		var VendorId=$("#MaterialId").val();
          
          		
          		$.ajax({
          			type:"Post",
          			url:"PrValidation",
          			data:{
          				Mid:VendorId,
          				
          		
          			},
          			datatype:"json",
          			success:function(data){
          				
          				if(data=="success"){
      					
          					$("#check").html(" <span class='glyphicon glyphicon-ok' style='font-size:30px;color:green'></span>");
      	        		   
      				}         		
      				else{
      				  $("#check").html("<span class='fa fa-warning' style='font-size:30px;color:red'></span>");
      	           		
      				}

          				
        				

          			}
          			
          				
          			
          			
          			
          		});
          		
          		});
          });
        
        
        </script>
        <script>
        $(document).ready(function(){
        	
        	$("#btn2").click(function(event){
        		
        		var materialNo=$("#MaterialId").val();
        		
        		var MPrice=$("#MtPrice").val();
        		var prQuantity=$("#PrQuantity").val();
        //		var prStatus=$("#PrStatus").val();
        //		
        		var sum=prQuantity*MPrice;
        		
        		
        		
        		
        		$('#Materialshow tr').eq(0).after('<tr><td colspan="1" id="display" class="1price">'+materialNo+'</td><td colspan="1" id="MPrice" class="price">'+MPrice+'</td><td colspan="1" id="prQuantity" class="prquantity">'+prQuantity+'</td><td colspan="1" id="prStatus" class="prstu">'+sum+'</td><td><Button type="button" class="removebutton" title="remove this row">X</Button></td></tr>');
        		
        		
        		
        	});

        	 $(document).on('click', 'button.removebutton', function () {
        	 
        	     $(this).closest('tr').remove();
        	     return false;
        	 });

        	

        	

        	
        	 $("#total").click(function(event){
        	    var prId=$("#PrID").val();
        		var  tabledata=Array();
        		var  tablePrice=Array();
        		var  tabletotal=Array();
        		var  tablePrQuantity=Array();
        		var  tablePrStatus=Array();
              	var totaltax=0;
        		var sum=0;
        		var total=0;
        		$(".prstu").each(function(){
        			var value=$("this").text();
        			//adding the value in only numbers 
        			if(!isNaN(value)&& value.length !=0){
        				sum+=parseFloat(value);
        			}
        			
        			
        		});
        		$("<td colspan='2' class='price' id='sum'>"+sum+"</td>")//.insertAfter('#Materialshow tr td:last')
        		$(".prstu").each(function() {

        		    var value = $(this).text();
        		    // add only if the value is number
        		    if(!isNaN(value) && value.length != 0) {
        		        total += parseFloat(value);
        		       totaltax=total*0.145+total;
        		   
        		        
        		    }
        		  
        		});
        		$('#Materialshow tr td').eq(-2).after("<td colspan='2' >"+total+"</td>");
        
        		$('#Materialshow tr td').eq(-1).after("<td colspan='2' >"+totaltax+"</td>");
        		//$("<td colspan='2'>"+total+"</td>").eq(0).insertAfter('#Materialshow tr td:last');
        	  
        			
        			var header=Array();
        			$("table tr th").each(function(i, v){
        			        header[i] = $(this).text();
        			})
        			               
        		
        			//var a="s";
        			$("#Materialshow tr").each(function(i,v){
        				
        				tabledata[i]=Array();
        				$(this).children('#display').each(function(ii,vv){
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
         				
         			    tablePrStatus[i]=Array();
         				$(this).children('#prStatus').each(function(ii,vv){
         					tablePrStatus[i][ii]=$(this).text();
         				});
         			});
        			
        			
        			
        				$.ajax({
        				type:"POST",
        				url:"tableshowServlet",
        				data:{
        					
        					"tableName[]":tabledata,
        					
        					"tableprice[]":tablePrice,
        					"tableprQuantity[]":tablePrQuantity,
        					"tableprStatus[]":tablePrStatus,
        					 PRID:prId,
        					
        				//	b:a,
        			
        			
        				},
        				datatype:"json",
          	    		success:function(data){
          	    			
          	    			
                            window.open("demo?name=report9");
               		
          	    			      
          	    			
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
          	<h3><i class="fa fa-angle-right"></i> Material and Planing</h3>
          	
          	<!-- BASIC FORM ELELEMNTS -->
          		<div class="panel panel-primary">
          	<div class="panel-heading">Entry Form</div>
          	<div class="row mt">
          		<div class="col-lg-12">
                  <div class="form-panel">
                  	  <h4 class="mb"><i class="fa fa-angle-right"></i>PR DATA RETERIVING</h4>
                      <form class="form-horizontal style-form" >
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">show Vendor ID</label>
                              <div class="col-sm-6">
                                  <input type="text" id="Vid" class="form-control round-form" disabled>
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label"> Order no</label>
                              <div class="col-sm-6">
                                  <input type="text" id="POId" class="form-control round-form" disabled>
                                 
                              </div>
                          </div>
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Production Id</label>
                              <div class="col-sm-6">
                                  <input type="text" id="PId" class="form-control round-form" disabled>
                              </div>
                          </div>
                            <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Pr Id</label>
                              <div class="col-sm-6">
                                  <input type="text" id="PrID" class="form-control round-form " disabled >
                              </div>
                              
                             </div>
                          
                         </form>
                             
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
                         
                         
                         <br>
                         
                         	
                         	<div class="row mt">
          	             	<div class="col-lg-12">
                            <div class="form-panel">
                            <form  class="form-horizontal style-form" >
                            
                                                          
                             
                           <div id="checkform" class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">material no</label>
                              <div class="col-sm-6">
                                  <input type="text" id="MaterialId" class="form-control  ">
                              </div>
                               <div id="check" class="col-sm-1"> </div>
                          </div>
                          
                            <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">material price</label>
                              <div class="col-sm-6">
                                  <input type="number" id="MtPrice" class="form-control ">
                              </div>
                              
                             </div>
                             
                             
          	
              
                                                  
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">pr quantity</label>
                              <div class="col-sm-6">
                                  <input type="number" id="PrQuantity" class="form-control ">
                              </div>
                          </div>
                      <!--      <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">Pr Delivery date</label>
                              <div class="col-sm-10">
                                  <input type="text" id="PrDdate" class="form-control ">
                              </div>
                          </div>
                          -->
                          <!--
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">pr status</label>
                              <div class="col-sm-10">
                                  <input type="text" id="PrStatus" class="form-control ">
                              </div>
                          </div>
                           
                          <div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">pr current date</label>
                              <div class="col-sm-10">
                                  <input type="text" id="PrCurrentdate" class="form-control ">
                              </div>
                          </div>
                          -->
                       
                          <div class="form-group">
                             <center>
                              <div class="col-sm-10">
                                  <input type="button" id="btn2" class="btn btn-theme" value="add row">
                              </div>
                              </center>
                             </div>
                          
                           </form>
                             
                  </div>
          		</div><!-- col-lg-12-->      	
          	</div><!-- /row -->
          	<br>
                 
                 
                 
                 
          	 <div class="content-panel">
                      <div class="row mt">
                      	<div class="col-lg-6">
                      	
            		  <table id="Materialshow" class="table table-bordered table-striped table-condensed">
                              <tbody>
                              <thead>
                              <tr>
                                  <th>Material no</th>
                                  <th>Material Price</th>
                                  <th>pr Quantity</th>
                                  <th>max sum</th>
                                  <th>Remove</th>
                                  
                                            
                                                    </tr>
                              </thead>
                                           <thead>                 
            
            </thead>
                                           <thead>    
                                                     
            <tr>
            <td  colspan="3">Total without tax</td>
           
            </tr>
             
            </thead>
             <thead>    
                                                     
            <tr>
            <td  colspan="3">Total With tax</td>
           
            </tr>
             
            </thead>
             
                             </tbody>
                              
                          </table>
                         
                                             
                  
          </div>
                    	<div class="col-lg-6">
     
          <button type="button"  id="total"   class="btn btn-theme">Complete</button>                                  
                   
          </div> 
          
          <div class="col-lg-12">
     
          <button type="button"  id="modalOpen" style="float:right"   class="btn btn-theme">open to do list</button>                                  
                   
          </div>
                
          </div></div>
          	</div>
          	
          	
          	
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
     
          <button type="submit"  id="activeoff"   class="btn btn-theme">active off</button>                                  
                   
          </div>
                    	
                
          </div></div>
        
      </div>
         
        </div>
    <!-- /.modal-content --> 
  </div>
      <!-- /.modal-dialog --> 
    </div>
          	
          	
		</section>
      </section><!-- /MAIN CONTENT -->
      </section>

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
             
              
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
