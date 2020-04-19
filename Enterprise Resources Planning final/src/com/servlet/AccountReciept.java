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

/**
 * Servlet implementation class AccountReciept
 */
@WebServlet("/AccountReciept")
public class AccountReciept extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountReciept() {
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
		int sNo,balance,credit,debit,total=0;
		String ac="cash";
		String cv=request.getParameter("cvrecieved");
		String mode=request.getParameter("acmode");
		if(request.getParameter("acmode").equals("reciept")){
		String acdate=request.getParameter("acdate");
		System.out.println(acdate);
		String acname=request.getParameter("acname");
		int acamount=Integer.parseInt(request.getParameter("acamount"));
		String actype=request.getParameter("actype");
		String acmemo=request.getParameter("acmemo");
		String paidname=request.getParameter("paidto");
		DBManager.addcash(acdate,acname,acamount,acmemo,mode,acdate);
		
		sNo=DBManager.getSno(ac);
		 balance=DBManager.getBalance(ac, sNo);
		 System.out.println("balance is"+balance);
		 credit=DBManager.getCredit(ac);
		 debit=DBManager.getDebit(ac);
		 total=balance+debit-credit;
		 System.out.println("total is "+total);
		 DBManager.updateAccount(ac, total, sNo);
		 DBManager.addcrCash(acname, acamount);
      	 sNo=DBManager.getSno(acname);
					 balance=DBManager.getBalance(acname, sNo);
					 System.out.println("balance is"+balance);
					 credit=DBManager.getCredit(acname);
					 debit=DBManager.getDebit(acname);
					 total=balance+credit-debit;
					 System.out.println("total is "+total);
					 DBManager.updateAccount(acname, total, sNo);
					 DBManager.updateCrTrail(acname,total);     
		
		 DBManager.updateTrail(ac,total);
		 DBManager.	addcashVoucher(acdate,acname, acamount,  acmemo, mode, acdate, cv,paidname);
		 response.setContentType("text/html;charset=UTF-8");
		    response.getWriter().write("success");

		}
		if(request.getParameter("acmode").equals("payment")){
		
			String cv1=request.getParameter("cvpayment");
			System.out.println(cv1);
			String acdate=request.getParameter("acdate");
			String acname=request.getParameter("acname");
			int acamount=Integer.parseInt(request.getParameter("acamount"));
			String actype=request.getParameter("actype");
			String acmemo=request.getParameter("acmemo");
			String paidname=request.getParameter("paidto");
			DBManager.addcash(acdate,acname,acamount,acmemo,mode,acdate);
			sNo=DBManager.getSno(ac);
			 balance=DBManager.getBalance(ac, sNo);
			 System.out.println("balance is"+balance);
			 credit=DBManager.getCredit(ac);
			 debit=DBManager.getDebit(ac);
			 total=balance+debit-credit;
			 System.out.println("total is "+total);
			 DBManager.updateAccount(ac, total, sNo);
			 DBManager.addDbCash(acname, acamount);
			 sNo=DBManager.getSno(acname);
			 balance=DBManager.getBalance(acname, sNo);
			 System.out.println("balance is"+balance);
			 credit=DBManager.getCredit(acname);
			 debit=DBManager.getDebit(acname);
			 total=balance+debit+credit;
			 System.out.println("total is "+total);
			 DBManager.updateAccount(acname, total, sNo);
			 DBManager.updateDbTrail(acname,total);     
			 DBManager.updateTrail(ac,total);
			 DBManager.	addcashVoucher(acdate,acname, acamount,  acmemo, mode, acdate, cv1,paidname);
			    response.getWriter().write("success");


			}
		
	
		
		
}
}