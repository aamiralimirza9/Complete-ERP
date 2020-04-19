package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CompanyDAO;
import com.google.gson.Gson;
import com.model.Company;

/**
 * Servlet implementation class Save
 */
@WebServlet("/Save")
public class SaveCompany extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveCompany() {
        super();
      
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		    PrintWriter out=response.getWriter();
		    System.out.println("the name is "+request.getParameter("companyName1"));  
		    String  companyName=request.getParameter("companyName1");  
	        String companyNumber=request.getParameter("companyNumber1");  
	        String companyAddress=request.getParameter("companyAddress1");  
	        String companyPhone=request.getParameter("companyPhone1");
	        String companyOwner=request.getParameter("companyOwner1");
	        CompanyDAO.save(companyName,companyNumber,companyAddress,companyPhone,companyOwner);
	     
	       response.sendRedirect("fiscalmonths.jsp");
	}

}
