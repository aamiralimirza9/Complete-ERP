package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.ProductTypeDAO;
import com.google.gson.Gson;
import com.model.ProductType;

@WebServlet("/SaveProductType")
public class SaveProductType extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public SaveProductType() {
        super();
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 System.out.print(request.getParameter("pCatName1"));
		 PrintWriter out=response.getWriter();  
		 String pCatName=request.getParameter("pCatName1");
		 String pName=request.getParameter("pName1");
		 String alloNumber=request.getParameter("alloNumber1");
		 ProductTypeDAO.save(pCatName,pName,alloNumber);
		 Gson gson=new Gson();
		 response.setContentType("application/json");
		 out.close();
	}

}
