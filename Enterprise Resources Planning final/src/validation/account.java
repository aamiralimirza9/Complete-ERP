package validation;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DBManager;
import com.google.gson.Gson;
import com.model.roleuser;

/**
 * Servlet implementation class account
 */
@WebServlet("/account")
public class account extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public account() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	 if(request.getParameter("a")!=null){
		 
		 String no=request.getParameter("a"); 
		 if(DBManager.accountCheck(no)){
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
 if(request.getParameter("title")!=null){
		 
		 String title=request.getParameter("title"); 
		 if(DBManager.accountTitle(title)){
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
 
 if(request.getParameter("getbankac")!=null){
	 
	 String title=request.getParameter("values"); 
	 if(DBManager.bankaccountTitle(title)){
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
 if(request.getParameter("permission")!=null){
	 String role=request.getParameter("permission");
	 ArrayList<roleuser> r=DBManager.getaccountPermission(role);
	 Gson gson=new Gson();
		response.setContentType("application/json");
		response.getWriter().write((gson.toJson(r)));
	
 }
	}
	
	

}
