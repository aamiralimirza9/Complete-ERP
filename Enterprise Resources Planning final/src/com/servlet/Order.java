package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.OrderDAO;
import com.google.gson.Gson;
import com.model.Customer;

@WebServlet("/Order")
public class Order extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Order() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if(request.getParameter("cId1")!=null){

		System.out.print(request.getParameter("cId1"));
		
		ArrayList<Customer> list=OrderDAO.getCustomerName();
		Gson gson=new Gson();
	    response.setContentType("application/json");
	    response.getWriter().write((gson.toJson(list)));
	}
	}
}
