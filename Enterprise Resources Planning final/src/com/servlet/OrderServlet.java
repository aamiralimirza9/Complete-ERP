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
import com.model.materialData;

import sun.security.pkcs11.Secmod.DbMode;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
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
	

			
			    String CustomerId=request.getParameter("venderID");
			
			    int BmId1=Integer.parseInt(CustomerId);
			    System.out.println(BmId1);
			
			
			    ArrayList<mainProduction> order=MPDBManager.billMaterialId(BmId1);
			 
			    Gson gson=new Gson();
				response.setContentType("application/json");
				response.getWriter().write(gson.toJson(order));
			
			
	    
	}     
		
		

}

