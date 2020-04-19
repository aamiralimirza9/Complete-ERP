

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
 * Servlet implementation class TextShow
 */
@WebServlet("/TextShow")
public class TextShow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TextShow() {
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
		PrintWriter print=response.getWriter();
		
		

		
	/*	if(request.getParameter("PorderId")!=null){
		
			
		String pOrder=request.getParameter("PorderId");
	
		
		
	    int Porder=Integer.parseInt(pOrder);
	//	int pId=Integer.parseInt(productId);
		//System.out.println(Vendor);
	    System.out.println(Porder);
		//System.out.println(pId);
		if(request.getParameter("PorderId")!=null){
		ArrayList<prdata> pr=DBManager.ptTextShow(Porder);
		Gson gson=new Gson();
		response.setContentType("application/json");
		response.getWriter().write(gson.toJson(pr));
		}  
		}          */
	// HERE IS FOR VENDOR ID 
		
		if(request.getParameter("venderID")!=null){
		String Vendor=request.getParameter("venderID");
		int Vid=Integer.parseInt(Vendor);
		System.out.print(Vid);
		ArrayList<prdata> pr=MPDBManager.PrVendorText(Vid);
		Gson gson=new Gson();
		response.setContentType("application/json");
		response.getWriter().write(gson.toJson(pr));
			
		}
		/*
		//HERE for production order
		if(request.getParameter("productId")!=null){
	    String productId=request.getParameter("productId");
	    int PId=Integer.parseInt(productId);
	    System.out.print(PId);
	    ArrayList<prdata> pr=DBManager.ShowProductId(PId);
	    Gson gson=new Gson();
	    response.setContentType("application/json");
		response.getWriter().write(gson.toJson(pr));
			
		}   */
		
		

		

		
	}

}

	
