package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.MPDBManager;
import com.google.gson.Gson;
import com.model.InventoryGoodsRecipts;
import com.model.ShowAccountTodolist;
import com.model.partialInventory;


/**
 * Servlet implementation class showPartialInventory
 */
@WebServlet("/showPartialInventory")
public class showPartialInventory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showPartialInventory() {
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
		
		

		
		if(request.getParameter("OrderID")!=null){
		
			
		String orderid=request.getParameter("OrderID");
	
		
		
	    int oId=Integer.parseInt(orderid );
	
	    System.out.println(oId);
		
		if(request.getParameter("OrderID")!=null){
			InventoryGoodsRecipts pi=new InventoryGoodsRecipts();
		ArrayList<InventoryGoodsRecipts> p=MPDBManager.showOrderId(oId);
		Gson gson=new Gson();
		response.setContentType("application/json");
		response.getWriter().write(gson.toJson(p));
		}  
		}  
	// HERE IS FOR Production Order 
		
		 if(request.getParameter("productionid")!=null){
		String PrdId=request.getParameter("productionid");
		int pId=Integer.parseInt(PrdId);
		System.out.print(pId);
		InventoryGoodsRecipts pi=new InventoryGoodsRecipts();
		ArrayList<InventoryGoodsRecipts> pr=MPDBManager.showProductionId(pId);
		Gson gson=new Gson();
		response.setContentType("application/json");
		response.getWriter().write(gson.toJson(pr));
			
		}
		
		//HERE for Batch SHOW Ids
		if(request.getParameter("PRID")!=null){
	    String prid=request.getParameter("PRID");
	    int Prid=Integer.parseInt(prid);
	    System.out.print(Prid);
	   InventoryGoodsRecipts pi=new InventoryGoodsRecipts();
	    ArrayList<InventoryGoodsRecipts> p1=MPDBManager.showPrId(Prid);
	    Gson gson=new Gson();
	    response.setContentType("application/json");
		response.getWriter().write(gson.toJson(p1));
			
		}  
		
		
		
	}

}
