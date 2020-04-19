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

/**
 * Servlet implementation class aymentReciept
 */
@WebServlet("/aymentReciept")
public class PaymentReciept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public PaymentReciept() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.print(request.getParameter("cId"));

		if(request.getParameter("cId")!=null){
			int id=Integer.parseInt(request.getParameter("cId"));
			System.out.print(request.getParameter("cId"));
			ArrayList<OrderInvoice> list=DeliveryDAO.getDataForPaymentReciep(id);
			Gson gson=new Gson();
		    response.setContentType("application/json");
		    response.getWriter().write((gson.toJson(list)));
		}
		if(request.getParameter("id")!=null){
			System.out.print(request.getParameter("id"));
			 int id=Integer.parseInt(request.getParameter("id"));
			 String cNo=request.getParameter("customerNumber1");
			 int amount=Integer.parseInt(request.getParameter("payAmount1"));
			 String date=request.getParameter("date1");
             DeliveryDAO.SavePaymentReciept(id, date, amount, cNo);

		}
		
	}

}
