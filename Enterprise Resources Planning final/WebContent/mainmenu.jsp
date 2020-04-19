<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Dashboard">
    <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">

    <title>Main Menu</title>

    <!-- Bootstrap core CSS -->
    <link href="assets/css/bootstrap.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/js/fancybox/jquery.fancybox.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">
<% String s=(String)session.getAttribute("uname");%>
<% String d=(String)session.getAttribute("dept");%>
    <script src="assets/js/jquery.js"></script>
    <script>
	  
    $(document).ready(function(){
    	
    	  

	    var testvalue= "<%=s%>";
	    var dept= "<%=d%>";

	        if(testvalue=="null"){
	      
	        	window.location.href = "login.jsp";
               
        	    }	
				if(dept=="Finanace And Accounting"){
	
				 	   $("#masterdata").hide();
				 	   $("#usersetting").hide();
				
					$("#sale").hide();
					$("#material").hide();
					$("#production").hide();
}	
				if(dept=="Sales And Distribution"){
				 	   $("#masterdata").hide();
				 	   $("#usersetting").hide();
					
					$("#finance").hide();
					$("#material").hide();
					$("#production").hide();
}	
			if(dept=="Production Planning"){
					$("#sale").hide();
					$("#finance").hide();
					$("#material").hide();
				 	   $("#masterdata").hide();
				 	   $("#usersetting").hide();
				
}	
			if(dept=="Material Planning"){
				$("#sale").hide();
				$("#finance").hide();
				$("#production").hide();
			 	   $("#masterdata").hide();
			 	   $("#usersetting").hide();
			
}	
			if(dept=="all"){
				$("#sale").show();
				$("#material").show();
				$("#production").show();
				$("#finance").show();
				
}	

    });
    </script>


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
      
       <aside id="sides">        
          <div id="sidebar"  class="nav-collapse " >
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
                            	  <h5 class="centered"><%=s %></h5>
                  
                   
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
    <li><a  href="company.jsp">Company detail</a></li>
                          <li><a  href="fiscalmonths.jsp">Financial Year</a></li>
                        
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
          <section class="wrapper site-min-height">
          	<h3><i class="fa fa-angle-right"></i> Main Menu</h3>
          	<hr>
				<div class="row mt">
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-4 desc" id="finance">
						<div class="project-wrapper">
		                    <div class="project">
		                        <div class="photo-wrapper">
		                        
		                            	<a class="fancybox" href="vouchers.jsp"><img class="img-responsive" src="resources/a.jpg" alt=""></a>
		                            
		                            <div class="overlay"></div>
		                        </div>
		                    </div>
		                </div>
					</div><!-- col-lg-4 -->
					
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-4 desc" id="sale">
						<div class="project-wrapper">
		                    <div class="project">
		                        <div class="photo-wrapper">
		                            
		                            	<a class="fancybox" href="order.jsp"><img class="img-responsive" src="resources/s.jpg" alt=""></a>
		                            
		                            <div class="overlay"></div>
		                        </div>
		                    </div>
		                </div>
					</div><!-- col-lg-4 -->
					
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-4 desc" id="material">
						<div class="project-wrapper">
		                    <div class="project">
		                        <div class="photo-wrapper">
		                           
		                            	<a class="fancybox" href="Mpdashboard.jsp"><img class="img-responsive" src="resources/m.jpg" alt=""></a>
		                           
		                            <div class="overlay"></div>
		                        </div>
		                    </div>
		                </div>
					</div>
					
				</div>
					<div class="row mt">
					<div class="col-lg-4 col-md-4 col-sm-6 col-xs-4 desc" id="production">
						<div class="project-wrapper">
		                    <div class="project">
		                        <div class="photo-wrapper">
		                           
		                            	<a class="fancybox" href="OrderTable.jsp"><img class="img-responsive" src="resources/p.jpg" alt=""></a>
		                           
		                            <div class="overlay"></div>
		                        </div>
		                    </div>
		                </div>
					</div>
					<!-- col-lg-4 -->
				</div><!-- /row -->


					<!-- col-lg-4 -->
				</div><!-- /row -->

		</section><! --/wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
      <!--footer start-->
      <footer class="site-footer">
          <div class="text-center">
              Easily Monitor the heartbeat of your business
              <a href="gallery.html#" class="go-top">
                  <i class="fa fa-angle-up"></i>
              </a>
          </div>
      </footer>
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
	<script src="assets/js/fancybox/jquery.fancybox.js"></script>    
    <script src="assets/js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="assets/js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="assets/js/jquery.scrollTo.min.js"></script>
    <script src="assets/js/jquery.nicescroll.js" type="text/javascript"></script>


    <!--common script for all pages-->
    <script src="assets/js/common-scripts.js"></script>

    <!--script for this page-->
  
  <script type="text/javascript">
      $(function() {
        //    fancybox
          jQuery(".fancybox").fancybox();
      });

  </script>
  
  <script>
      //custom select box

      $(function(){
          $("select.styled").customSelect();
      });

  </script>
<script type="text/javascript" src="assets/js/jquery.backstretch.min.js"></script>
    <script>
    $.backstretch("resources/business2.jpg", {speed: 500});

    </script>
  </body>
</html>
