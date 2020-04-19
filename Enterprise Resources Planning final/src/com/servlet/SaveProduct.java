package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.CustomerDAO;
import com.dao.ProductDAO;
import com.dao.ProductTypeDAO;
import com.google.gson.Gson;
import com.model.Customer;
import com.model.Product;
import com.model.ProductType;

@WebServlet("/SaveProduct")
public class SaveProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SaveProduct() {
        super();
        
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(   request.getParameter("pName1")!=null  ){
		    String pName = request.getParameter("pName1");  
	        System.out.println(pName);
	        int productPrice = Integer.parseInt(request.getParameter("pPrice1"));
	        String pPlant=request.getParameter("pPlant1");  
	        String sLoc=request.getParameter("sLoc1");
	        String  matGroup=request.getParameter("matGroup1");
	        int weight=Integer.parseInt(request.getParameter("weight1"));
	        int unit=Integer.parseInt(request.getParameter("unit1"));
	        int a=ProductDAO.getId(request.getParameter("productTypeName1"));
	        ProductDAO.Save(pName, productPrice, pPlant, sLoc, matGroup, weight, unit, a);
		}
	    ArrayList<ProductType> list=ProductDAO.getProductTypeName();
        Gson gson=new Gson();
	    response.setContentType("application/json");
	    response.getWriter().write((gson.toJson(list)));
	    
       

	}
		
	}



