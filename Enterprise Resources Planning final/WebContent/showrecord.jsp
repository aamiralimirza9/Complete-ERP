<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
  <link href="assets/css/bootstrap.css" rel="stylesheet">
 <script src="js/jquery.js"></script>
 <script>
 $(document).on("click", ".open-AddBookDialog", function () {
     var myBookId = $(this).data('id');
     var he = $(this).data('nam');
     var actype = $(this).data('type');
     var acSubtype = $(this).data('subtype');
     $(".modal-body #bookId").val( myBookId );
     $(".modal-body #book").val( he );
     $(".modal-body #bookdata").val( actype );
     $(".modal-body #booktype").val( acSubtype );
});

 $(document).on("click", ".open-delBookDialog", function () {
     var myBookId = $(this).data('id');
  alert(myBookId);
     $(".modal-body #dal").val( myBookId );
  
});
 
 
 </script>
          <script >
         $(document).ready(function(){

     
              $.ajax({
         		type:"POST",
         		url:"showall",
         		datatype:"json",
         		success:function(data){
			
				for(var a=0 ; a<data.length; a++)
				{					var bb=	data[a];
			
	      		$('#mytable tr').eq(0).after(' <tr><td><input type="checkbox" class="checkthis" /></td><td>'+bb.acno+'</td><td>'+bb.acTitle+'</td><td>'+bb.acType+'</td><td>'+bb.acSubtype+'</td><td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="open-AddBookDialog btn btn-primary"  data-id='+bb.acno+' data-nam='+bb.acTitle+'  data-type='+bb.acType+' data-subtype='+bb.acSubtype+' data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td><td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="open-delBookDialog btn btn-primary" data-title="Delete" data-id='+bb.acno+' data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td></tr>');  					
							}
	
}
         			
        });

         
          	$('#mod').click(function(event) {
           		var acno = $("#bookId").val();
         		var acname = $("#book").val();
         		var actype = $("#bookdata").val();
         		var acsubtype = $("#booktype").val();
           	
           		$.ajax({
           			type:"POST",
           			url:"showall",
           			data:{
           				editno:acno,
           				editname:acname,
           				edittype:actype,
           				editsubtype:acsubtype,
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
           			url:"showall",
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
 
 
 
<div class="container">

	<div class="row">
		
        
        <div class="col-md-12">
        <h4>Datatable</h4>
        <div class="table-responsive">

                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   
                   <th><input type="checkbox" id="checkall" /></th>
                   <th>Account No</th>
                    <th>Account Name</th>
                     <th>Account Type</th>
                     <th>Account SubType</th>
                      <th>Edit</th>
                      
                       <th>Delete</th>
                   </thead>
    <tbody>
    
    <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td>Mohsin</td>
    <td>Irshad</td>
    <td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
    <td>isometric.mohsin@gmail.com</td>
    <td>+923335586757</td>
    <td><button class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
    </tr>
    
 <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td>Mohsin</td>
    <td>Irshad</td>
    <td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
    <td>isometric.mohsin@gmail.com</td>
    <td>+923335586757</td>
    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button class="open-AddBookDialog btn btn-primary"  data-id="pakistan" data-nam="india" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
    <td><p data-placement="top" data-toggle="tooltip"  title="Delete"><button class="open-delBookDialog btn btn-primary" data-id="pakistan"  data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
    </tr>
    
    

   
    
   
    
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


<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
      <div class="modal-dialog">
    <div class="modal-content">
          <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
        <h4 class="modal-title custom_align" id="Heading">Edit Your Detail</h4>
      </div>
          <div class="modal-body">
          <div class="form-group">
    <input type="text" class="form-control " name="bookId" id="bookId" value=""/>
        </div>
        <div class="form-group">
        
        <input type="text" class="form-control " name="book" id="book" value=""/>
        </div>
        
         <div class="form-group">
        
        <input type="text" class="form-control " name="book" id="bookdata" value=""/>
        </div>
         <div class="form-group">
        
        <input type="text" class="form-control " name="book" id="booktype" value=""/>
        </div>
        <div class="form-group">
        <textarea rows="2" class="form-control" placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>
    
        
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