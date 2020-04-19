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
 * Servlet implementation class PartialInventory
 */
@WebServlet("/PartialInventory")
public class PartialInventory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PartialInventory() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter p=response.getWriter();
		String MaterialId=request.getParameter("materialNo");
		String MaterialQuantity=request.getParameter("materialquantity");
		String BinId=request.getParameter("binid");
		String BatchId=request.getParameter("batchid");
	/*	
		int mid=DBManager.MaterialSelector(MaterialId);
		int binid=DBManager.BinSelector(BinId);
		int batchid=DBManager.BatchSelector(BatchId);
		int mtQuantity=Integer.parseInt(MaterialQuantity);
		DBManager.PartialInventoryInsert(mid, mtQuantity, binid, batchid);
		System.out.println(MaterialId);
		System.out.println(MaterialQuantity);
		System.out.println(BinId);
		System.out.println(BatchId);
		
		*/
		
		
		
	}

}
