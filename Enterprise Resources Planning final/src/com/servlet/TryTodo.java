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
import com.model.inventorymodal;
import com.model.todomodel;

/**
 * Servlet implementation class TryTodo
 */
@WebServlet("/TryTodo")
public class TryTodo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TryTodo() {
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
		
		if(request.getParameter("pono")!=null){
		
			String Pono=request.getParameter("pono");
			System.out.println("Here is PoID NO "+Pono);
			int i=Integer.parseInt(Pono);
		
			ArrayList<todomodel> td1=MPDBManager.ShowTodoList(i);
			Gson gson=new Gson();
			response.setContentType("application/json");
			response.getWriter().write(gson.toJson(td1));
		}
		if(request.getParameter("productID")!=null){
			
			String poid=request.getParameter("productID");
			int pid=Integer.parseInt(poid);
			MPDBManager.ActiveOff(pid);
			
			
			
		}
		if(request.getParameter("poID")!=null){
			
			String PoId=request.getParameter("poID");
			System.out.println("Here is PoID NO "+PoId);
			int i=Integer.parseInt(PoId);
			ArrayList<inventorymodal> invm=MPDBManager.TodolistInventoryShow(i);
			Gson gson=new Gson();
			response.setContentType("application/json");
			response.getWriter().write(gson.toJson(invm));
		}
		
            if(request.getParameter("pridOff")!=null){
			
			String poid=request.getParameter("pridOff");
			int pid=Integer.parseInt(poid);
			MPDBManager.ActiveOffforInventory(pid);
			
			
			
		}
		
		
		
		
	}

}
