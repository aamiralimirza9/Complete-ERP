<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Vendor Curd</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/js/bootstrap-daterangepicker/daterangepicker.css" />
        
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

 <script src="js/jquery.js"></script>
 <script>
 $(document).on("click", ".Add", function () {
     var myBookId = $(this).data('id');
     var he = $(this).data('nam');
     var actype = $(this).data('type');
     var acSubtype = $(this).data('subtype');
     var mmPrice=$(this).data('mm');
     var mtdesc=$(this).data('mtdesc');
     var mtno=$(this).data('mt');
     var bankname=$(this).data('bname');
     var bankac=$(this).data('bankac');
     $(".modal-body #MNo").val( myBookId );
     $(".modal-body #Mname").val( he );
     $(".modal-body #mweight").val( actype );
     $(".modal-body #mprice").val( acSubtype );
     $(".modal-body #mmprice").val( mmPrice );
     $(".modal-body #mdesc").val( mtdesc );
     $(".modal-body #mtNo").val(mtno);
     $(".modal-body #bname").val(bankname);
     $(".modal-body #baccount").val(bankac);
    
});
 $(document).on("click", ".open-delBookDialog", function () {
     var mno= $(this).data('id');
 
     $(".modal-body #dal").val(mno);
  
});

 
 </script>
          <script >
         $(document).ready(function(){
			var dat="key";
     
              $.ajax({
         		type:"POST",
         		url:"VendorServlet",
         		data:{
         			keyno:dat,
         		},
         		datatype:"json",
         		success:function(data){
			
				for(var a=0 ; a<data.length; a++)
				{					var bb=	data[a];
			
			
	      		$('#mytable tr').eq(0).after(' <tr><td>'+bb.VId+'</td><td>'+bb.VName+'</td><td>'+bb.companyTile+'</td><td>'+bb.companyAddress+'</td><td>'+bb.Vcontact+'</td><td>'+bb.vmobile+'</td><td>'+bb.VNtn+'</td><td>'+bb.BankName+'</td><td>'+bb.BankAccount+'</td><td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="Add" btn btn-primary"  data-id='+bb.VId+' data-nam='+bb.VName+'  data-type='+bb.companyTile+' data-subtype='+bb.companyAddress+' data-mm='+bb.Vcontact+' data-mtdesc='+bb.vmobile+' data-mt='+bb.VNtn+' data-bname='+bb.BankName+' data-bankac='+bb.BankAccount+'  data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td><td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="open-delBookDialog btn btn-primary" data-title="Delete" data-id='+bb.VId+' data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td></tr>');  					
							}
	
}
         			
        });

         
          	$('#mod').click(function(event) {
           		var mNo= $("#MNo").val();
         		var mName= $("#Mname").val();
         		var Mweight= $("#mweight").val();
         		var mPrice= $("#mprice").val();
         		var mmprice=$("#mmprice").val();
         		var mdesc=$("#mdesc").val();
         		var mtNo=$("#mtNo").val();
         		var bname=$("#bname").val();
         		var bac=$("#baccount").val();
           	
           		$.ajax({
           			type:"POST",
           			url:"VendorServlet",
           			data:{
           				mno:mNo,
           				mname:mName,
           				mweight:Mweight,
           				Mprice:mPrice,
           				Mmprice:mmprice,
           				Mdesc:mdesc,
           				Mtno:mtNo,
           				bankn:bname,
           				bankac:bac
           				
           			},
           			datatype:"json",
           			success:function(data){
           			   location.reload();
           			}

           				
           				
           			});

         
         
            });
          	
          	
          	$('#del').click(function(event) {
           		
          		var acno = $("#dal").val();
          	    
           	  
           		$.ajax({
           			type:"POST",
           			url:"VendorServlet",
           			data:{
           				delno:acno,
           				
           			},
           			datatype:"json",
           			success:function(data){
           			  location.reload();
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
      <!--header start-->
      <header class="header black-bg">
              <div class="sidebar-toggle-box">
                  <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
              </div>
            <!--logo start-->
            <a href="index.html" class="logo"><b>GALAXY ERP</b></a>
            <!--logo end-->
           
                     
                  
                
                <!--  notification end -->
           
            <div class="top-menu">
            	<ul class="nav pull-right top-menu">
                    <li><a class="logout" href="login.jsp">Logout</a></li>
            	</ul>
            </div>
        </header>
      <!--header end-->
      
      <!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
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
      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> Material and Planing</h3>
          	   
          	
          	<!-- INLINE FORM ELELEMNTS -->
          	<div class="row mt">
          	
          		<div class="col-lg-12">
          		<div class="panel panel-primary">
          			<div class="form-panel">
          			<div class="panel panel-primary">
                  	 <div class="panel-heading">SHOW VENDOR </div>
                  	 </div>
                      	<div class="row">
		
        
        <div class="col-md-12">
       
        <div class="table-responsive">

                
              <table id="mytable" class="table table-bordered table-striped table-condensed cf">
                   <tbody>
                   <thead>
                   <tr>
                 
                     <th>Vendor No</th>
                     <th>Vendor Name</th>
                     <th>company Title</th>
                     <th>Company  Address</th>
                     <th>Contact No</th>
                     <th>Mobile No</th>
                     <th>NTN No</th>
                     <th>Bank Name</th>
                     <th>Bank Account</th>
                     <th>Edit</th>
                     <th>Delete</th>
                       <tr>
                       
                   </thead>
   
    
    
    

   
    
   
    
    </tbody>
        
</table>

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
          Vendor no:
    <input type="text" class="form-control " name="bookId" id="MNo" disabled value=""/>
        </div>
          <div class="form-group">
          Vendor name:
    <input type="text" class="form-control " name="bookId" id="Mname" value=""/>
        </div>
        <div class="form-group">
         Company Title :
        <input type="text" class="form-control " name="book" id="mweight" value=""/>
        </div>
        
         <div class="form-group">
        company address :
        <input type="text" class="form-control " name="book" id="mprice" value=""/>
        </div>
         <div class="form-group">
         contact number :
        <input type="text" class="form-control " name="book" id="mmprice" value=""/>
        </div>
        <div class="form-group">
         mobile number :
         <input type="text" class="form-control " name="book" id="mdesc" value=""/>
        </div>
        <div class="form-group">
         NTN Number :
         <input type="text" class="form-control " name="book" id="mtNo" value=""/>
        </div>
        <div class="form-group">
         Bank Name :
         <input type="text" class="form-control " name="book" id="bname" value=""/>
        </div>
        <div class="form-group">
         Bank Account :
         <input type="text" class="form-control " name="book" id="baccount" value=""/>
        </div>
      </div>
          <div class="modal-footer ">
        <button type="button" id="mod" class="btn btn-warning btn-lg" style="width: 100%;"><span class="glyphicon glyphicon-ok-sign"></span> Update</button>
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
          	
          	
<div class="container">


          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
          	
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
