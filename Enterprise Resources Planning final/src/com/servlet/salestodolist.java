package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import com.dao.OrderDAO;
import com.model.SubOrder;
import com.model.salesTodoList;

/**
 * Servlet implementation class salestodolist
 */
@WebServlet("/salestodolist")
public class salestodolist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public salestodolist() {
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
		if(request.getParameter("jvlist")!=null){
		salesTodoList toDoList1= new salesTodoList();
		ArrayList<salesTodoList> list=OrderDAO.InsertTodoList();
		Gson gson=new Gson();
		response.setContentType("application/json");
		response.getWriter().write(gson.toJson(list));
		
		
		}
		if(request.getParameter("pono")!=null){
			
			String pno=request.getParameter("pono");
			int pid=Integer.parseInt(pno);
			System.out.print(pid);
			
			ArrayList<SubOrder> tdlist=OrderDAO.todolistSearch(pid);
			
			Gson gson=new Gson();
			response.setContentType("application/json");
			response.getWriter().write(gson.toJson(tdlist));
		}
		
		
	}

}
