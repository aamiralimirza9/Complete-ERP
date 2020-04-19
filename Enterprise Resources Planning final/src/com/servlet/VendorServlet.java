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
import com.model.Vendor;

/**
 * Servlet implementation class VendorServlet
 */
@WebServlet("/VendorServlet")
public class VendorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VendorServlet() {
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
	 if(request.getParameter("Vname")!=null){
		   PrintWriter print=response.getWriter();
			String VName=request.getParameter("Vname");
			String VCompanyTitle=request.getParameter("VcompanyTitle");
			String VCompanyAddress=request.getParameter("VcompanyAddress");
			String VCcontact=request.getParameter("VContact");
			String VCmobile=request.getParameter("VMobile");
			String VCntn1=request.getParameter("VNtn");
			String BankName=request.getParameter("Bankname");
			String ac=request.getParameter("Bankaccount");
			
			
			int VcContact=Integer.parseInt(VCcontact);
			int VcMobile=Integer.parseInt(VCmobile);
			int VCNtn1=Integer.parseInt(VCntn1);
			int Ba=Integer.parseInt(ac);
			System.out.print(ac);
			Vendor v=new Vendor();
			MPDBManager.VendorInsert(VName, VCompanyTitle, VCompanyAddress, VcContact, VcMobile, VCNtn1,BankName,Ba);
			
	  
	}
	 
	 ArrayList<Vendor> v=MPDBManager.VendorCurd();
	 
	 Gson gson1=new Gson();
		response.setContentType("application/json");
		response.getWriter().write(gson1.toJson(v));
		
		
		if(request.getParameter("mno")!=null){
       	 
       	 String Mno=request.getParameter("mno");
            int mno=Integer.parseInt(Mno);
       	 
            String Mname=request.getParameter("mname");
       	 
       	 String Mweight=request.getParameter("mweight");
       
       	 
       	 String Mprice=request.getParameter("Mprice");
       	 
       	 
       	 String Mmprie=request.getParameter("Mmprice");
       	 int mmprice1=Integer.parseInt(Mmprie);
       	 
       	 String Mdesc=request.getParameter("Mdesc");
       	 int md=Integer.parseInt(Mdesc);
       	 
       	 String Mtno=request.getParameter("Mtno");
      	 int mtno1=Integer.parseInt(Mtno);
      	 
      	 String bankname=request.getParameter("bankn");
      	 String bac=request.getParameter("bankac");
      	 int baccount1=Integer.parseInt(bac);
       	 MPDBManager.updateVendor(mno, Mname,Mweight,Mprice, mmprice1, md, mtno1, bankname, baccount1);
       	
       	 
        }
		
		if(request.getParameter("delno")!=null){
       	 String delno=request.getParameter("delno");
       	 int del=Integer.parseInt(delno);
       	 
       	 MPDBManager.DeleteVendor(del);
       	 
       	 
        }
       
	
	}

}
