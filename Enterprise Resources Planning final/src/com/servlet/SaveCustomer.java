package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CompanyDAO;
import com.dao.CustomerDAO;
import com.google.gson.Gson;
import com.model.Company;
import com.model.Customer;

/**
 * Servlet implementation class SaveCustomer
 */
@WebServlet("/SaveCustomer")
public class SaveCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveCustomer() {
        super();
       
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		
		    PrintWriter out=response.getWriter();
		    System.out.println("the name is "+request.getParameter("customerName1"));
		    String customerName =request.getParameter("customerName1");  
	        String customerCompanyName=request.getParameter("customerCompanyName1");  
	        String CustomerAddress=request.getParameter("CustomerAddress1");  
	        String CustomerPhone=request.getParameter("CustomerPhone1");
	        String customerBankAccount=request.getParameter("customerBankAccount1");
	        
	        
	       
	        CustomerDAO.save(customerName,customerCompanyName,CustomerAddress,CustomerPhone,customerBankAccount);
	        Gson gson=new Gson();
			response.setContentType("application/json");
	
	}
}


