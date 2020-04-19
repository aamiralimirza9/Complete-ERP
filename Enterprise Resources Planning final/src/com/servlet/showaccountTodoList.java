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
import com.model.Inventorydata;
import com.model.ShowAccountTodolist;
import com.model.showProduction;

/**
 * Servlet implementation class showaccountTodoList
 */
@WebServlet("/showaccountTodoList")
public class showaccountTodoList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showaccountTodoList() {
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
		
		
		
		

        if(request.getParameter("keyone")!=null){
		
		
		ArrayList<ShowAccountTodolist> showa=MPDBManager.showAccountTodoList();
		
		Gson gson2=new Gson();
		response.setContentType("application/json");
		response.getWriter().write((gson2.toJson(showa)));
		
	}
        
        if(request.getParameter("ledger")!=null){
        	String MName=request.getParameter("ledger");
        	ArrayList<Inventorydata> inv=MPDBManager.ShowInVentoryData(MName);
        	Gson gson=new Gson();
    		response.setContentType("application/json");
    		response.getWriter().write((gson.toJson(inv)));
        	
        	
        }
        if(request.getParameter("orderID")!=null){
       // 	String order=request.getParameter("orderID");
     //   	int  i=Integer.parseInt(order);
        	ArrayList<showProduction> p=MPDBManager.ShowProductionsData();
        	
        	Gson gson=new Gson();
    		response.setContentType("application/json");
    		response.getWriter().write((gson.toJson(p)));
        }
		
	}

}
