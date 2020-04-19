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
 * Servlet implementation class MaterialServlet
 */
@WebServlet("/MaterialServlet")
public class MaterialServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MaterialServlet() {
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
		if(request.getParameter("mmName")!=null){
			PrintWriter print=response.getWriter();
			String MTName=request.getParameter("mmName");
			String MTWeight=request.getParameter("mmWeight");
			String MTPrice=request.getParameter("mmPrice");
		//	String MMMovig=request.getParameter("mmMoving");
			String MMDESC=request.getParameter("mmDesc");
			String MMcombo=request.getParameter("mmcombo");
			
			int MMweight=Integer.parseInt(MTWeight);
			int MMprice=Integer.parseInt(MTPrice);
			//int MMmoving=Integer.parseInt(MMMovig);
			materialData md=new  materialData();
			System.out.println(MTName);
			System.out.print(MMweight);
			
		int a=MPDBManager.Idseleting(MMcombo);
		System.out.println(a);
		MPDBManager.MTinsertion(MTName, MMweight, MMprice, MMDESC,a);
		
		}
		 ArrayList<materialType> mtp=MPDBManager.MaterialTypeCurd();
    	 Gson gson1=new Gson();
			response.setContentType("application/json");
			response.getWriter().write(gson1.toJson(mtp));
    	 
			if(request.getParameter("mno")!=null){
				String mt=request.getParameter("mno");
				int mtype=Integer.parseInt(mt);
				String mtname=request.getParameter("mname");
				String mtdesc=request.getParameter("mweight");
				
				MPDBManager.updateMaterialType(mtype, mtname, mtdesc);
			}
			
			
			if(request.getParameter("delno")!=null){
				 String delno=request.getParameter("delno");
            	 int del=Integer.parseInt(delno);
            	 
            	 MPDBManager.DeleteMaterialType(del);
				
			}
		
	}

		
		
	}


