package validation;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DBManager;
import com.dao.MPDBManager;
import com.google.gson.Gson;
import com.model.Account;
import com.model.OrderTable;

/**
 * Servlet implementation class PrValidation
 */
@WebServlet("/PrValidation")
public class PrValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrValidation() {
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
			 
			 System.out.print("id checking         "+midcheck);
			 
			 if(MPDBManager.purchasingIdvalidation(midcheck)){
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
		
		if(request.getParameter("vender")!=null){
			 
			 String mid=request.getParameter("vender"); 
			 int midcheck=Integer.parseInt(mid);
			 
			 System.out.print("id checking         "+midcheck);
			 
			 if(MPDBManager.VendorIdVal(midcheck)){
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
		
		
		
	
		
	
			 if(request.getParameter("po")!=null){
				 String po=request.getParameter("po");
					ArrayList<OrderTable> list5=DBManager.getMaxPoNo();
					Gson gson5=new Gson();
					response.setContentType("application/json");
					response.getWriter().write((gson5.toJson(list5)));
				
				 
			 }
			
		
		

	
	}

}
