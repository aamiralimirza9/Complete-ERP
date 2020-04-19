package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DBConnection;
import com.dao.MPDBManager;
import com.google.gson.Gson;
import com.model.materialData;
import com.model.materialType;
import com.model.productionOrder;
import com.model.todomodel;

/**
 * Servlet implementation class todolisttryservlet
 */
@WebServlet("/todolisttryservlet")
public class todolisttryservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public todolisttryservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		  
	
             ArrayList<materialData> mt=MPDBManager.MaterialCurd();
             Gson gson=new Gson();
 			response.setContentType("application/json");
 			response.getWriter().write(gson.toJson(mt));
             if(request.getParameter("mno")!=null){
            	 
            	 String Mno=request.getParameter("mno");
                 int mno=Integer.parseInt(Mno);
            	 
                 String Mname=request.getParameter("mname");
            	 
            	 String Mweight=request.getParameter("mweight");
            	 int mw=Integer.parseInt(Mweight);
            	 
            	 String Mprice=request.getParameter("Mprice");
            	 int mpric=Integer.parseInt(Mprice);
            	 
            	// String Mmprie=request.getParameter("Mmprice");
            //	 int mmprice1=Integer.parseInt(Mmprie);
            	 
            	 String Mdesc=request.getParameter("Mdesc");
            	 
            	 String Mtno=request.getParameter("Mtno");
            	 int mtno1=Integer.parseInt(Mtno);
            	 MPDBManager.updateMaterialData(mno, Mname, mw, mpric,Mdesc, mtno1);
            	
            	 
             }
             if(request.getParameter("delno")!=null){
            	 String delno=request.getParameter("delno");
            	 int del=Integer.parseInt(delno);
            	 
            	 MPDBManager.DeleteMaterialData(del);
            	 
            	 
             }
            
	}

}
