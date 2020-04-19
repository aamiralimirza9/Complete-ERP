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
import com.model.Account;
import com.model.AccountSubtype;

/**
 * Servlet implementation class BankVoucherServlet
 */
@WebServlet("/BankVoucherServlet")
public class BankVoucherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BankVoucherServlet() {
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
		System.out.println("hello");
		String n=request.getParameter("values");
		String voucher=request.getParameter("jv");
		if(n!=null){
			
			ArrayList<Account> list=DBManager.getAccountname(n);
			Gson gson1=new Gson();
			response.setContentType("application/json");
			response.getWriter().write((gson1.toJson(list)));
		}
		if(voucher!=null){
			ArrayList<Account> list1=DBManager.getJournalno();
			Gson gson1=new Gson();
			response.setContentType("application/json");
			response.getWriter().write((gson1.toJson(list1)));
			
			
		}
		if(request.getParameter("cvrecieved")!=null){
			ArrayList<Account> list2=DBManager.getMaxCashVoucherno();
			Gson gson2=new Gson();
			response.setContentType("application/json");
			response.getWriter().write((gson2.toJson(list2)));
			
			
		}
		if(request.getParameter("cvpayment")!=null){
			ArrayList<Account> list3=DBManager.getMaxCashVoucherno();
			Gson gson3=new Gson();
			response.setContentType("application/json");
			response.getWriter().write((gson3.toJson(list3)));
			
			
		}
		
		if(request.getParameter("bankreciepts")!=null){
			ArrayList<Account> list3=DBManager.getMaxbankRecieptVoucherno();
			Gson gson4=new Gson();
			response.setContentType("application/json");
			response.getWriter().write((gson4.toJson(list3)));
			
			
		}
		if(request.getParameter("bankpayment")!=null){
			ArrayList<Account> list5=DBManager.getMaxbankPaymentVoucherno();
			Gson gson5=new Gson();
			response.setContentType("application/json");
			response.getWriter().write((gson5.toJson(list5)));
			
			
		}
		if(request.getParameter("enddate")!=null){
			String start=request.getParameter("startdate");
			String end=request.getParameter("enddate");
			DBManager.addDate(start,end);
		}
		
		
	}

}
