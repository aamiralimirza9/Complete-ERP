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
import com.model.OrderTable;
import com.model.mainProduction;
import com.model.productionOrder;

import sun.security.pkcs11.Secmod.DbMode;

/**
 * Servlet implementation class orderInsertServlet
 */
@WebServlet("/orderInsertServlet")
public class orderInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public orderInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		
		 if(request.getParameter("CustomerId")!=null){
		    	
		    	String productionOrder=request.getParameter("CustomerId");
		    	String OrderId=request.getParameter("productId");
		    	
		    	int pOid=Integer.parseInt(productionOrder);
		    	int orderId=Integer.parseInt(OrderId);
		    	
		    	
		    	
		    	MPDBManager.InsertINtoMainProduction(pOid,orderId);
		 }
		    if(request.getParameter("OrderId")!=null){
		    	mainProduction or=new mainProduction();
		    	ArrayList<mainProduction> ot=MPDBManager.showOrderIds();
		    	Gson gson=new Gson();
				response.setContentType("application/json");
				response.getWriter().write(gson.toJson(ot));
		    	}
		    /*
		    if(request.getParameter("PRID")!=null){
		    	String mainproductionId=request.getParameter("PRID");
		    	int mpId=Integer.parseInt(mainproductionId);
		    
		    	System.out.println("hhhhhhhhhhhh"+mpId);
		    	
		    	ArrayList<String> prMaterialno=new ArrayList<String>();
		    	ArrayList<String> prQuantity=new ArrayList<String>();
		    	
		    	productionOrder pr=new productionOrder();
		    	String [] MyJdata=request.getParameterValues("tableName[]");
		    	String [] MyprQuantity=request.getParameterValues("tableprQuantity[]");
		    	System.out.println(MyJdata);
		    	
		    	for(int b=1;b<MyJdata.length-1;b++){
					prMaterialno.add(MyJdata[b]);
				
					prQuantity.add(MyprQuantity[b]);
					
					
				System.out.println(prMaterialno);
			
				System.out.println(prQuantity);
				
				}
		    
		    	DBManager.AddProductionOrder(prMaterialno, prQuantity, mpId);
		    	
		    	
		    	
		    }  */
	}

}
