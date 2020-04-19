package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.RouteDAO;
import com.google.gson.Gson;
import com.model.Channel;

/**
 * Servlet implementation class Route
 */
@WebServlet("/Route")
public class Route extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Route() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(   request.getParameter("descirption1")!=null  ){
			
			String descirption=request.getParameter("descirption1");
			System.out.print(descirption);
			String from=request.getParameter("from1");
			String to=request.getParameter("to1");
			int id=RouteDAO.getChannelId(request.getParameter("route"));
			RouteDAO.Save(descirption, id, from, to);
			
			
		}
		
		ArrayList<Channel> list=RouteDAO.getRoute();
		Gson gson=new Gson();
	    response.setContentType("application/json");
	    response.getWriter().write((gson.toJson(list)));
	    
		
	}

}
