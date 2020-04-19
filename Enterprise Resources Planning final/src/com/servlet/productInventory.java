package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DBManager;
import com.dao.MPDBManager;
import com.google.gson.Gson;
import com.model.mainProduction;
import com.model.productionOrder;

/**
 * Servlet implementation class productInventory
 */
@WebServlet("/productInventory")
public class productInventory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productInventory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
	    String proId=request.getParameter("proID");
		if(proId!=null){
	    int BmId1=Integer.parseInt(proId);
	    System.out.println(BmId1);
	
	
	    ArrayList<mainProduction> order=MPDBManager.proName(BmId1);
	 
	    Gson gson=new Gson();
		response.setContentType("application/json");
		response.getWriter().write(gson.toJson(order));
	
		}
		else{
			String mainproductionId=request.getParameter("PRID");
	    	int mpId=Integer.parseInt(mainproductionId);
	    	int orderId=Integer.parseInt(request.getParameter("order"));
	    	int lot=Integer.parseInt(request.getParameter("lot"));
	    	String podate=request.getParameter("podate");
	    	int oId=Integer.parseInt(mainproductionId);
	        MPDBManager.AddProductionInventoryMain(mpId, orderId, lot, podate);
	    	int i;
	        int id=MPDBManager.getmaxPi();
	    	System.out.println("hhhhhhhhhhhh"+mpId);
	    	
	    	ArrayList<String> prMaterialno=new ArrayList<String>();
	    	ArrayList<String> prQuantity=new ArrayList<String>();
	    	
	    	productionOrder pr=new productionOrder();
	    	String [] MyJdata=request.getParameterValues("tableName[]");
	    	String [] MyprQuantity=request.getParameterValues("tableprQuantity[]");
	    	
	   
	    	for(String a:MyJdata){
	    	   
	   
	    		prMaterialno.add(a);
	    		System.out.println(a);
	    		
	    	
	    	}
	    	for(String b:MyprQuantity){
	    		prQuantity.add(b);
	    		System.out.println(b);
	    	}
	    	
	    
	    	MPDBManager.AddProductionInventory(prMaterialno, prQuantity,id,orderId);
	    	
	    	
	    	
	    }
				
				
			}
			
			
		}
	


