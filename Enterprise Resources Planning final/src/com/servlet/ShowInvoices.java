package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DeliveryDAO;
import com.google.gson.Gson;
import com.model.OrderInvoice;
import com.model.SellInvoice;

@WebServlet("/ShowInvoices")
public class ShowInvoices extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ShowInvoices() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print(request.getParameter("temp2"));

		 //sell Invoice show  
		if(request.getParameter("temp2")!=null){
			System.out.print(request.getParameter("temp2"));
			ArrayList<SellInvoice> list=DeliveryDAO.searchInvoiceDetail();
			Gson gson=new Gson();
		    response.setContentType("application/json");
		    response.getWriter().write((gson.toJson(list)));
		}
		//orderInvoice Show
		if(request.getParameter("temp")!=null){
			System.out.print(request.getParameter("temp"));

			ArrayList<OrderInvoice> olist=DeliveryDAO.searchOrderInvoiceDetail();
			Gson ogson=new Gson();
		    response.setContentType("application/json");
		    response.getWriter().write((ogson.toJson(olist)));
		}
	}

}
