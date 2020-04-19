package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.MPDBManager;
import com.google.gson.Gson;
import com.model.InventoryGoodsRecipts;

/**
 * Servlet implementation class GoodRecipts
 */
@WebServlet("/GoodRecipts")
public class GoodRecipts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoodRecipts() {
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
		
		 String orderID=request.getParameter("OrderId");
		  String ProductionId=request.getParameter("Porductionid");
		  String PRid=request.getParameter("PrId");
		  String DeliveryDate=request.getParameter("deliveryDate");
		 
		 
		  
		  int productid=Integer.parseInt(ProductionId);
		  
				  
		  int order=Integer.parseInt(orderID);
		 // int prid=DBManager.SelectorPrId(PRid);
		  int prid=Integer.parseInt(PRid);
		  
		  MPDBManager.InventoryGoodRecipetInsert(order,productid,prid,DeliveryDate);
		 System.out.println(orderID);
		 System.out.println(ProductionId);
		 System.out.println(PRid);
		 
	
		 
		 InventoryGoodsRecipts i=new InventoryGoodsRecipts();
		 
		 ArrayList<InventoryGoodsRecipts> igr=MPDBManager.ShowGoodReciptIDs();
		 Gson gson=new Gson();
			response.setContentType("application/json");
			response.getWriter().write(gson.toJson(igr));
		 
		 
		 
	
	}

}
