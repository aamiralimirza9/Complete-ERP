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
import com.model.prdata;
import com.model.purchasingRequsition;

import validation.PrValidation;

/**
 * Servlet implementation class ModalServlet
 */
@WebServlet("/ModalServlet")
public class ModalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModalServlet() {
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
		
		
           if(request.getParameter("PRID")!=null){
		
			String prid=request.getParameter("PRID");
			String a=request.getParameter("Amount");
			
			//double ammount1=Integer.valueOf(request.getParameter("Amount")).doubleValue();
			int Prid=Integer.parseInt(prid);
	//		int ammount=1000;
			System.out.println(prid);
			System.out.println("hiiiiiiiiiiiiii            "           +a);
			int vendorId=MPDBManager.SelectingVendor(Prid);
			System.out.println(vendorId);
			
			String vendorName=MPDBManager.SelectingVendorName(vendorId);
			System.out.println(vendorName);
			MPDBManager.AccountTodolist(vendorName,a, Prid);
			
			
			
		}
	
		if(request.getParameter("prid")!=null){
			String prid=request.getParameter("prid");
			int PRID=Integer.parseInt(prid);
			System.out.println("pr Number here "+PRID);
			
			ArrayList<purchasingRequsition> pr=MPDBManager.ModalShow(PRID);
			Gson gson=new Gson();
			response.setContentType("application/json");
			response.getWriter().write(gson.toJson(pr));
		}
		
		if(request.getParameter("GRID")!=null){
			String grid=request.getParameter("GRID");
			
			int Grid=Integer.parseInt(grid);
			System.out.println(grid);
		     
			ArrayList<String> prMaterialno=new ArrayList<String>();
			ArrayList<String> prPrice=new ArrayList<String>();
			ArrayList<String> prQuantity1=new ArrayList<String>();
			ArrayList<String> prBinId=new ArrayList<String>();
			ArrayList<String> prBatchId=new ArrayList<String>();
			
			
			String [] MyJdata=request.getParameterValues("tableName[]");
			String [] MyMPrice=request.getParameterValues("tableprice[]");
			String [] MyprQuantity=request.getParameterValues("tableprQuantity[]");
			String [] myBindId=request.getParameterValues("tablebinid[]");
			String [] MyBatchId=request.getParameterValues("tablebatchid[]");
			for(int b=1;b<MyJdata.length-1;b++){
				prMaterialno.add(MyJdata[b]);
				prPrice.add(MyMPrice[b]);
				prQuantity1.add(MyprQuantity[b]);
				prBinId.add(myBindId[b]);
				prBatchId.add(MyBatchId[b]);
				
			
			System.out.println(prMaterialno);
			System.out.println(prPrice);
			System.out.println(prQuantity1);
			System.out.println("here is bin id"+prBinId);
			System.out.println("here is batch id"+prBatchId);
			
			}
		
			MPDBManager.ModalArray(prMaterialno, prPrice, prQuantity1,prBinId,prBatchId,Grid);
			
				
			response.encodeRedirectUrl("showAccountTodolist.jsp");
			response.getWriter().write("success");
		
		}
		
		
		
	}
	

}
