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
import com.model.partialInventory;
import com.model.partialIssues;

/**
 * Servlet implementation class partialIssuesServlet
 */
@WebServlet("/partialIssuesServlet")
public class partialIssuesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public partialIssuesServlet() {
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
		if(request.getParameter("Prid")!=null){
			String PRID=request.getParameter("Prid");
			String OrderId1=request.getParameter("OrderID");
			String Invid=request.getParameter("InventoryId");
			
		//	int prid=DBManager.SelectorPurchasingRId(PRID);
		//	int orderid1=DBManager.SelectorOrderId(OrderId1);
		//	int invid=DBManager.SelectorInventoryId(Invid);
			int prid=Integer.parseInt(PRID) ;
			int orderid1=Integer.parseInt(OrderId1) ;
            int invid=Integer.parseInt(Invid);
			System.out.println(prid);
			System.out.println(orderid1);
			System.out.println("here is Inventory Id"+invid);
			MPDBManager.partailIssuess(prid,orderid1,invid);
			
		} 
		/*
		if(request.getParameter("prid")!=null){
			String Prid=request.getParameter("prid");
			int PRid=Integer.parseInt(Prid);
			System.out.println("here for purchasing id"+PRid);
			ArrayList<partialIssues> pi=DBManager.ShowPurchasingRId(PRid);
			Gson gson=new Gson();
		    response.setContentType("application/json");
			response.getWriter().write(gson.toJson(pi));
		}
		if(request.getParameter("OrderID1")!=null){
			String orderid=request.getParameter("OrderID1");
			int OrderID=Integer.parseInt(orderid);
			System.out.println(OrderID);
			
			ArrayList<partialIssues> piii=DBManager.ShowOrderId(OrderID);
			Gson gson=new Gson();
		    response.setContentType("application/json");
			response.getWriter().write(gson.toJson(piii));
		}
		if(request.getParameter("InvID")!=null){
			String inventoryId=request.getParameter("InvID");
			int InVid=Integer.parseInt(inventoryId);
			System.out.println(InVid);
			
			ArrayList<partialIssues> pii=DBManager.ShowInventoryID(InVid);
			Gson gson=new Gson();
		    response.setContentType("application/json");
			response.getWriter().write(gson.toJson(pii));
		}   
		*/
	
		if(request.getParameter("prequisitionId")!=null){
			ArrayList<partialIssues> pr=MPDBManager.showPartialIssueIds();
			Gson gson=new Gson();
		    response.setContentType("application/json");
			response.getWriter().write(gson.toJson(pr));
		}
		if(request.getParameter("InVenotryId")!=null){
			String InvId=request.getParameter("InVenotryId");
			int INVID=Integer.parseInt(InvId);
			System.out.println(INVID);
			ArrayList<partialInventory> pInventory=MPDBManager.ModalShowforGoodsIssues(INVID);
			Gson gson=new Gson();
			response.setContentType("application/json");
			response.getWriter().write(gson.toJson(pInventory));
		}
		
		if(request.getParameter("GRID")!=null){
			String GoodId=request.getParameter("GRID");
			int Gissues=Integer.parseInt(GoodId);
			System.out.println("here is partial issues id"+Gissues);
			
			
			ArrayList<String> prMaterialno=new ArrayList<String>();
			ArrayList<String> prPrice=new ArrayList<String>();
			ArrayList<String> prQuantity1=new ArrayList<String>();
		//	ArrayList<String> prBinId=new ArrayList<String>();
	//		ArrayList<String> prBatchId=new ArrayList<String>();
	//		ArrayList<String> prdate=new ArrayList<String>();
			ArrayList<String> prStorage=new ArrayList<String>();
			
			String [] MyJdata=request.getParameterValues("tableName[]");
			String [] MyMPrice=request.getParameterValues("tableprice[]");
			String [] MyprQuantity=request.getParameterValues("tableprQuantity[]");
		/*	dbval=7;
			modval=4;
			new=dbval-modval;
			D(mno,new)   */
		//	String [] myBindId=request.getParameterValues("tablebinid[]");
	//		String [] MyBatchId=request.getParameterValues("tablebatchid[]");
//			String [] Mydate=request.getParameterValues("tableDate[]");
			String [] MyStorage=request.getParameterValues("tableStorage[]");
			for(int b=1;b<MyJdata.length-1;b++){
				prMaterialno.add(MyJdata[b]);
				prPrice.add(MyMPrice[b]);
				prQuantity1.add(MyprQuantity[b]);
	//			prBinId.add(myBindId[b]);
		//		prBatchId.add(MyBatchId[b]);
			//	prdate.add(Mydate[b]);
				prStorage.add(MyStorage[b]);
				
				// for subtracting the pr Quantity \\
				int DbValue=MPDBManager.SelectQuantity(MyJdata[b]);
				 
				int Modvalue=Integer.parseInt(MyprQuantity[b]);
				
				int totalVaul=DbValue-Modvalue;
				
				
			MPDBManager.updateQuantity(MyJdata[b],totalVaul);
				
				  
			System.out.println("matrial quantity modal"+Modvalue);
			System.out.println("total quantity"+totalVaul);
			System.out.println(prMaterialno);
			System.out.println(prPrice);
			System.out.println(prQuantity1);
	//		System.out.println("here is bin id"+prBinId);
		//	System.out.println("here is batch id"+prBatchId);
//			System.out.println(prdate);
			System.out.println(prStorage);
			
			}
			
			MPDBManager.GIModalArray(prMaterialno,prPrice,prQuantity1,prStorage,Gissues );
			response.getWriter().write("success");
		}
	}

}
