package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DBManager;
import com.dao.MPDBManager;
import com.model.productionOrder;

/**
 * Servlet implementation class tryServlet
 */
@WebServlet("/tryServlet")
public class tryServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String mainproductionId=request.getParameter("PRID");
    	int mpId=Integer.parseInt(mainproductionId);
    	String PoId=request.getParameter("poid");
    	String OderId=request.getParameter("orderid");
    	int pid=Integer.parseInt(PoId);
    	int odrid=Integer.parseInt(OderId);
    	
        int i;
        
        System.out.println("production orderId"+pid);
        System.out.println("Order ID"+odrid);
        
    	System.out.println("hhhhhhhhhhhh"+mpId);
    	
    	ArrayList<Integer> prMaterialno=new ArrayList<Integer>();
    	ArrayList<String> prQuantity=new ArrayList<String>();
    	
    	productionOrder pr=new productionOrder();
    	String [] MyJdata=request.getParameterValues("tableName[]");
    	String [] MyprQuantity=request.getParameterValues("tableprQuantity[]");
    	
   
    	for(String a:MyJdata){
    	   
    		i=MPDBManager.billMaterialID(a);
    		prMaterialno.add(i);
    		System.out.println(a);
    		
    	
    	}
    	for(String b:MyprQuantity){
    		prQuantity.add(b);
    		System.out.println(b);
    	}
    	
    
    	MPDBManager.AddProductionOrder(prMaterialno, prQuantity, mpId);
    	MPDBManager.InsertIntoTOdolist(pid,odrid);
    	DBManager.removeSalesTask(odrid);
    	//DBManager.addMptodolist(odrid,pid);
    	response.getWriter().write("success");
    	
    }
	
	
	}


