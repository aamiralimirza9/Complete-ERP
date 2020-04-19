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
import com.model.Product;
import com.model.Route;
import com.model.SalesVendor;
import com.model.SubOrder;
import com.model.Vendor;

/**
 * Servlet implementation class Delivery
 */
@WebServlet("/Delivery")
public class Delivery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Delivery() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("name2")!=null){
		ArrayList<Route> list=DeliveryDAO.getRouteId();
		Gson gson=new Gson();
	    response.setContentType("application/json");
	    response.getWriter().write((gson.toJson(list)));
	    }
	    if(request.getParameter("name1")!=null){
	    	ArrayList<SalesVendor> vlist=DeliveryDAO.getVendorId();
			Gson gson1=new Gson();
		    response.setContentType("application/json");
		    response.getWriter().write((gson1.toJson(vlist)));
		   }
	    
	    System.out.print("the val issss"+request.getParameter("deliveryDescription1"));

	    if(request.getParameter("deliveryDescription1")!=null)
	    {
		    System.out.print("the val issss"+request.getParameter("deliveryDescription1"));
		
	    String	deliveryDescription=request.getParameter("deliveryDescription1");
	    String orderId=request.getParameter("orderid");
	    String delivery=request.getParameter("dlvid");
	    String deliveryDate=request.getParameter("deliveryDate1");
	    String dfrom=request.getParameter("dfrom1");
	    String dTo=request.getParameter("dTo1");
	    String cNo=request.getParameter("cNo1");
	    int dCustomerNo=Integer.parseInt(request.getParameter("dCustomerNo1"));
	    String driverName=request.getParameter("driverName1");
	    int vNo=Integer.parseInt(request.getParameter("vNo1"));
	    int routeId=Integer.parseInt(request.getParameter("routeId1"));
	    int vendorId=Integer.parseInt(request.getParameter("vendorId1"));
	    int weight=Integer.parseInt(request.getParameter("weight1"));
	    int price=Integer.parseInt(request.getParameter("dPrice1"));
	    String order=request.getParameter("orderid");
	    DeliveryDAO.Save(deliveryDescription,deliveryDate,dfrom, dTo, routeId, weight,cNo, vendorId, dCustomerNo, price, vNo, driverName,order);
	    SubOrderDAO.updatemainMtsdelivey(orderId,delivery);
	    }
	    if(request.getParameter("delivery")!=null){
	        ArrayList<Product> list=SubOrderDAO.getDeliveryId();
            Gson gson=new Gson();
    	    response.setContentType("application/json");
    	    response.getWriter().write((gson.toJson(list)));
        
	    	
	    }
	    if(request.getParameter("temp1")!=null){
	    	System.out.print(request.getParameter("temp1"));
	    	ArrayList<SubOrder> list=SubOrderDAO.showData();
	    	Gson gson=new Gson();
			response.setContentType("application/json");
			response.getWriter().write((gson.toJson(list)));
	    }
	    if(request.getParameter("temp2")!=null){
	    	ArrayList<com.model.Delivery> list=SubOrderDAO.showDeliveryData();
		    System.out.print(request.getParameter("temp2s"));
		    Gson gson2=new Gson();
			response.setContentType("application/json");
			response.getWriter().write((gson2.toJson(list)));
	    }

	    

	}

}
