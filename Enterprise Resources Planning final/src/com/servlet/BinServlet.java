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
import com.model.binModel;

/**
 * Servlet implementation class BinServlet
 */
@WebServlet("/BinServlet")
public class BinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BinServlet() {
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
		String Binname=request.getParameter("BinName");
		String Bindesc=request.getParameter("BinDesc");
		
		System.out.print(Binname);
		MPDBManager.BinInsertion(Binname, Bindesc);
		binModel b=new binModel();
		ArrayList<binModel> lo=MPDBManager.binshow();
		Gson gson=new Gson();
		response.setContentType("application/json");
		response.getWriter().write(gson.toJson(lo));
		
	}

}
