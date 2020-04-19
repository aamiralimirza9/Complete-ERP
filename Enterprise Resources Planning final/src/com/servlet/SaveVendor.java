package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CustomerDAO;
import com.dao.VendorDAO;
import com.google.gson.Gson;
import com.model.Customer;
import com.model.Vendor;

/**
 * Servlet implementation class SaveVendor
 */
@WebServlet("/SaveVendor")
public class SaveVendor extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public SaveVendor() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  		// TODO Auto-generated method stub
  		doPost(request,response);
  	}
    
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		System.out.println("the name is "+request.getParameter("vendorName1")); 
	    String vendorName =request.getParameter("vendorName1");  
        String companyTitle=request.getParameter("companyTitle1");  
        String companyAddress=request.getParameter("companyAddress1");  
        int contactNumber=Integer.parseInt(request.getParameter("contactNumber1"));
        int mobileNumber=Integer.parseInt(request.getParameter("mobileNumber1"));
        int ntnNumber=Integer.parseInt(request.getParameter("ntnNumber1"));
        VendorDAO.save(vendorName,companyTitle,companyAddress,contactNumber,mobileNumber,ntnNumber);
        Gson gson=new Gson();
		response.setContentType("application/json");
        out.close();
		
	}

}
