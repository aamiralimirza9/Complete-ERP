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
import com.model.materialData;
import com.model.materialType;

/**
 * Servlet implementation class MpServlet
 */
@WebServlet("/MpServlet")
public class MpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MpServlet() {
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
		if(request.getParameter("Mtname")!=null){
		PrintWriter print=response.getWriter();
		String MtName=request.getParameter("Mtname");
		String MtDesc=request.getParameter("Mtdesc");
		//System.out.println(MtName);
		//System.out.println(MtDesc);
		MPDBManager.insertion(MtName, MtDesc);}
				if(request.getParameter("name")!=null){
					System.out.println("typeis"+request.getParameter("name"));

		materialType i=new materialType();
		ArrayList<materialType> lo=MPDBManager.show();
		Gson gson=new Gson();
		response.setContentType("application/json");
		response.getWriter().write(gson.toJson(lo));
	}
				
	}
	
    

}
