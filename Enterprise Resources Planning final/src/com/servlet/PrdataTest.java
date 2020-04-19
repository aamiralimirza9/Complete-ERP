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
import com.model.prdata;


/**
 * Servlet implementation class test
 */
@WebServlet("/test")
public class PrdataTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrdataTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter p=response.getWriter();
		
		  String VId=request.getParameter("venderID");
		  String POrderID=request.getParameter("PorderId");
		  String ProuctId=request.getParameter("productId");
		 //String prid=request.getParameter("Prid");
		  String DeliveryDate=request.getParameter("deliveryDate");
		 String currentDate=request.getParameter("currentDate");
		  
		  
		  int a=MPDBManager.PrVendorId(VId);
		  //int b=DBManager.PrOrderId(POrderID);
		  //int c=DBManager.ProductId(ProuctId);
		// int a=Integer.parseInt(VId);
		  int b=Integer.parseInt(POrderID);
		  int c=Integer.parseInt(ProuctId);
		  MPDBManager.PrIdInsert(a, b, c,DeliveryDate,currentDate);
		  System.out.println(VId);
		  System.out.println(POrderID);
		  System.out.println(ProuctId);
		  
		  System.out.println(DeliveryDate);
		  System.out.println(currentDate);
		   
		  int rprId=MPDBManager.PrIDReteriving();
		  MPDBManager.InsertIntoInventoryTodlist(VId,rprId);
		  
		  
		 
		 
		  
	}

}
