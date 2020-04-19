package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DBManager;
import com.google.gson.Gson;
import com.model.AccountOpen;
import com.model.AccountSubtype;

import Util.convert;


/**
 * Servlet implementation class AccountOpenServlet
 */
@WebServlet("/AccountOpenServlet")
public class AccountOpenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountOpenServlet() {
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
	
		if(request.getParameter("empname")!=null){
		ArrayList<AccountOpen> a=DBManager.getAccount();
		Gson gson=new Gson();
		response.setContentType("application/json");
		response.getWriter().write((gson.toJson(a)));}
		System.out.println("second para is"+request.getParameter("i"));
		if(request.getParameter("name")!=null){
		String data=request.getParameter("name");
		int getId=DBManager.getsubtype(data);
		ArrayList<AccountSubtype> list=DBManager.getAccounttype(getId);
		Gson gson1=new Gson();
		response.setContentType("application/json");
		response.getWriter().write((gson1.toJson(list)));
		}
		if(request.getParameter("a")!=null){
			String acNo=request.getParameter("a");
			String acTitle=request.getParameter("b");
			String acType=request.getParameter("c");
			String acSubtype=request.getParameter("d");
			String acAmount=request.getParameter("e");
			int acNoInt=convert.conversionInt(acNo);
			int acAmountInt=convert.conversionInt(acAmount);
			DBManager.createAccount(acNoInt,acTitle,acType,acSubtype,acAmountInt);
			int no=DBManager.getAccountId(acNo);
		
			DBManager.createTrailBalance(acNoInt,acTitle,acType,acAmountInt,no);
			
		}
		
		
		
		
		
	
		
	
	}

}
