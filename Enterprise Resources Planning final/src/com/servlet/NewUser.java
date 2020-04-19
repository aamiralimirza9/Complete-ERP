package com.servlet;

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

import Util.GeneratePassword;

/**
 * Servlet implementation class NewUser
 */
@WebServlet("/NewUser")
public class NewUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewUser() {
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
		String name=request.getParameter("fullname");
		String action=request.getParameter("action");	
		if(action!=null)
		{
			GeneratePassword generatePassword=new GeneratePassword();
			String password=generatePassword.getPassword();
		
			response.setContentType("text/plain");  
			response.setCharacterEncoding("UTF-8"); 
			response.getWriter().write(password);
		}
		if(request.getParameter("empname")!=null){
			ArrayList<roleuser> r=DBManager.getrole();
			Gson gson1=new Gson();
			response.setContentType("application/json");
			response.getWriter().write((gson1.toJson(r)));
			
		}
		
			if(name!=null){		
		String fullName=request.getParameter("fullname");
		String userName=request.getParameter("username");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String nic=request.getParameter("nic");
		String gender=request.getParameter("tutorRadios");
		String dateOfBirth=request.getParameter("dateofbirth");
		String phoneNumber=request.getParameter("phone");
		String roles=request.getParameter("roles");
		String dept=request.getParameter("dept");
		System.out.println("the role"+request.getParameter("roles"));
		System.out.println("the role"+request.getParameter("dept"));
		response.sendRedirect("EmployeeRegistration.jsp");

        DBManager.addUser(fullName, userName, password, email, nic, gender, dateOfBirth, phoneNumber,roles,dept);
			}
			if(request.getParameter("user")!=null){
			String username=request.getParameter("user");
				if(DBManager.checkuser(username)){
					response.getWriter().write("success");	
				}
				else{
					response.getWriter().write("unsuccess");
					
				}
				
			}
			if(request.getParameter("rolecheck")!=null){
				String rolename=request.getParameter("rolecheck");
					if(DBManager.checkRole(rolename)){
						response.getWriter().write("success");	
					}
					else{
						response.getWriter().write("unsuccess");
						
					}
					
				}
		
	}

}
