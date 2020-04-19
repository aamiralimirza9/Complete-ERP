package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DeliveryDAO;
import com.dao.SubOrderDAO;
import com.google.gson.Gson;
import com.model.SubOrder;


@WebServlet("/checkOrder")
public class checkOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public checkOrder() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
if(request.getParameter("orderId1")!=null){
	int id=Integer.parseInt(request.getParameter("orderId1"));
	System.out.print(id);
	ArrayList<SubOrder> list=DeliveryDAO.searchProductDetail(id);
    Gson gson=new Gson();
	response.setContentType("application/json");
	response.getWriter().write((gson.toJson(list)));

	}

if(request.getParameter("status")!=null){
	int id=Integer.parseInt(request.getParameter("status"));
	System.out.print(id);
	ArrayList<SubOrder> list=DeliveryDAO.searchProductInventory(id);
    Gson gson=new Gson();
	response.setContentType("application/json");
	response.getWriter().write((gson.toJson(list)));

	}
	
	
	
	
	
	
	
	
	
	}

}
