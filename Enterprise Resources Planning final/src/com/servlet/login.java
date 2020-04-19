package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.DBManager;
import com.model.roleuser;

import java.util.*;;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
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
		
	String user=request.getParameter("user");
	String password=request.getParameter("pass");
	System.out.println(user);
	String userrole= DBManager.getEmployeeRole(user);
	String dept=DBManager.getdept(user);
	HttpSession session=request.getSession();
	System.out.print(dept);
	session.setAttribute("uname", userrole);
	session.setAttribute("dept", dept);
	
	if(DBManager.getlogin(user,password)== true){
		if(DBManager.getEmployeeRole(user).equals("ceo")){
			response.sendRedirect("maindashboard.jsp");
			
			
		}else{
		response.sendRedirect("mainmenu.jsp");
		}
		
	}
	else{
		response.sendRedirect("lock_screen.jsp");
		
		
	}
	
		
		
	}

}
