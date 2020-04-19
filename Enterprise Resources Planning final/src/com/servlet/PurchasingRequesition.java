package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.MPDBManager;

/**
 * Servlet implementation class PurchasingRequesition
 */
@WebServlet("/PurchasingRequesition")
public class PurchasingRequesition extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchasingRequesition() {
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
	
		
		
		PrintWriter p=response.getWriter();
	
		String materialId=request.getParameter("Materialno");
		String PrQuantity=request.getParameter("Prquantity");
	//	String prDeliveryDate=request.getParameter("prDeliverydate");
		String PRStatus=request.getParameter("prStatus");
	//	String PrCurrentdate=request.getParameter("prCurrentdate");
		String PrID=request.getParameter("prId");
		
		int mtId=Integer.parseInt(materialId);
		int PrQuan=Integer.parseInt(PrQuantity);
		int PrStatus=Integer.parseInt(PRStatus);
		int Prid=Integer.parseInt(PrID);
		MPDBManager.PurchasingRequesition(mtId, PrQuan, PrStatus, Prid);
		
	}

}
