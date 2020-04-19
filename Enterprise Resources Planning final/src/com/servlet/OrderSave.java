package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.OrderDAO;

/**
 * Servlet implementation class ordercheck
 */
@WebServlet("/ordercheck")
public class OrderSave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderSave() {
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
    
		  
	
			String orderid=request.getParameter("cId2");
			System.out.println(orderid);
			int oid=OrderDAO.getId(orderid);
			String nam=null;
			String Orderstatus=request.getParameter("OStatus1");
			String mtb=request.getParameter("mtb");
			String mto=request.getParameter("mto");
			System.out.println(mtb+mto);
			if(mtb!=null){
				nam=mtb;
			}
			if(mto!=null){
				
				nam=mto;
			}
 
			System.out.println(Orderstatus);
			int ostate=Integer.parseInt(Orderstatus);
			
			String date=request.getParameter("dDate1");
			System.out.println(date);
			
			OrderDAO.save(nam,date,ostate);
			
			
		
	
	}
}
