package validation;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.MPDBManager;

/**
 * Servlet implementation class goodReciptValidation
 */
@WebServlet("/goodReciptValidation")
public class goodReciptValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public goodReciptValidation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
		
		
		if(request.getParameter("Mid")!=null){
			 
			 String mid=request.getParameter("Mid"); 
			 int midcheck=Integer.parseInt(mid);
			 
			 System.out.print("id checking"+midcheck);
			 
			 if(MPDBManager.OrderId(midcheck)){
				 System.out.println("true");

			        response.setContentType("text/html;charset=UTF-8");
			        response.getWriter().write("success");
				 
			 }
			 else{
				 
				 System.out.println("false");
				 response.setContentType("text/html;charset=UTF-8");
				    response.getWriter().write("unsuccess");
			 }
		 }
		
		if(request.getParameter("Mid1")!=null){
			 
			 String mid=request.getParameter("Mid1"); 
			 int midcheck=Integer.parseInt(mid);
			 
			 System.out.print("id checking"+midcheck);
			 
			 if(MPDBManager.ProductionId(midcheck)){
				 System.out.println("true");

			        response.setContentType("text/html;charset=UTF-8");
			        response.getWriter().write("success");
				 
			 }
			 else{
				 
				 System.out.println("false");
				 response.setContentType("text/html;charset=UTF-8");
				    response.getWriter().write("unsuccess");
			 }
		 }
		
		
		
		
		if(request.getParameter("Mid2")!=null){
			 
			 String mid=request.getParameter("Mid2"); 
			 int midcheck=Integer.parseInt(mid);
			 
			 System.out.print("id checking"+midcheck);
			 
			 if(MPDBManager.PruchasingReqID(midcheck)){
				 System.out.println("true");

			        response.setContentType("text/html;charset=UTF-8");
			        response.getWriter().write("success");
				 
			 }
			 else{
				 
				 System.out.println("false");
				 response.setContentType("text/html;charset=UTF-8");
				    response.getWriter().write("unsuccess");
			 }
		 }
		
		
		if(request.getParameter("Mid3")!=null){
			 
			 String mid=request.getParameter("Mid3"); 
			 int midcheck=Integer.parseInt(mid);
			 
			 System.out.print("id checking"+midcheck);
			 
			 if(MPDBManager.purchasingreqmainId(midcheck)){
				 System.out.println("true");

			        response.setContentType("text/html;charset=UTF-8");
			        response.getWriter().write("success");
				 
			 }
			 else{
				 
				 System.out.println("false");
				 response.setContentType("text/html;charset=UTF-8");
				    response.getWriter().write("unsuccess");
			 }
		 }
		
		
		if(request.getParameter("Mid4")!=null){
			 
			 String mid=request.getParameter("Mid4"); 
			 int midcheck=Integer.parseInt(mid);
			 
			 System.out.print("id checking"+midcheck);
			 
			 if(MPDBManager.PartialInventoryID(midcheck)){
				 System.out.println("true");

			        response.setContentType("text/html;charset=UTF-8");
			        response.getWriter().write("success");
				 
			 }
			 else{
				 
				 System.out.println("false");
				 response.setContentType("text/html;charset=UTF-8");
				    response.getWriter().write("unsuccess");
			 }
		 }
		
		
		if(request.getParameter("Mid6")!=null){
			 
			 String mid=request.getParameter("Mid6"); 
			 int midcheck=Integer.parseInt(mid);
			 
			 System.out.print("id checking"+midcheck);
			 
			 if(MPDBManager.PurchsdingReqId1(midcheck)){
				 System.out.println("true");

			        response.setContentType("text/html;charset=UTF-8");
			        response.getWriter().write("success");
				 
			 }
			 else{
				 
				 System.out.println("false");
				 response.setContentType("text/html;charset=UTF-8");
				    response.getWriter().write("unsuccess");
			 }
		 }


		
		
		
		
	}

}
