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
import com.model.bank;

/**
 * Servlet implementation class BankBook
 */
@WebServlet("/BankBook")
public class BankBook extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BankBook() {
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
		String ac="cashaccount";
		String cv=request.getParameter("cvrecieved");
		String mode=request.getParameter("acmode");
		if(request.getParameter("acmode").equals("reciept")){
		String acdate=request.getParameter("acdate");
		String acno=request.getParameter("acno");
		String bankname=request.getParameter("branchname");
		String bankactitle=request.getParameter("actitle");
		
		System.out.println(acdate);
		String acname=request.getParameter("acname");
		int acamount=Integer.parseInt(request.getParameter("acamount"));
		String actype=request.getParameter("actype");
		String acmemo=request.getParameter("acmemo");
		DBManager.addbank(acdate,acname,acamount,acmemo,mode,bankname,acno,bankactitle);
		DBManager.addbankreciept(acdate,acname,acamount,acmemo,mode,bankname,acno,bankactitle);
		sNo=DBManager.getSno(bankactitle);
		 balance=DBManager.getBalance(bankactitle, sNo);
		 System.out.println("balance is"+balance);
		 credit=DBManager.getCredit(bankactitle);
		 debit=DBManager.getDebit(bankactitle);
		 total=balance+debit-credit;
		 System.out.println("total is "+total);
		
		 DBManager.updateAccount(bankactitle, total, sNo);
		 DBManager.updateTrail(bankactitle,total);
		 DBManager.addcrCash(acname, acamount);
		sNo=DBManager.getSno(acname);
		 balance=DBManager.getBalance(acname, sNo);
		 System.out.println("balance is"+balance);
		 credit=DBManager.getCredit(acname);
		 debit=DBManager.getDebit(acname);
		 total=balance+debit-credit;
		 System.out.println("total is "+total);
		
		 DBManager.updateAccount(acname, total, sNo);
		 DBManager.updateTrail(acname,total);
			}
		
		if(request.getParameter("acmode").equals("payment")){
			String acdate=request.getParameter("acdate");
			String acno=request.getParameter("acno");
			String bankname=request.getParameter("branchname");
			String bankactitle=request.getParameter("actitle");
			
			System.out.println(acdate);
			String acname=request.getParameter("acname");
			int acamount=Integer.parseInt(request.getParameter("acamount"));
			String actype=request.getParameter("actype");
			String acmemo=request.getParameter("acmemo");
			DBManager.addbank(acdate,acname,acamount,acmemo,mode,bankname,acno,bankactitle);
			DBManager.addbankreciept(acdate,acname,acamount,acmemo,mode,bankname,acno,bankactitle);
			sNo=DBManager.getSno(bankactitle);
			 balance=DBManager.getBalance(bankactitle, sNo);
			 System.out.println("balance is"+balance);
			 credit=DBManager.getCredit(bankactitle);
			 debit=DBManager.getDebit(bankactitle);
			 total=balance+debit-credit;
			 System.out.println("total is "+total);
			
			 DBManager.updateAccount(bankactitle, total, sNo);
			 DBManager.updateTrail(bankactitle,total);
			 DBManager.addDbCash(acname, acamount);
			sNo=DBManager.getSno(acname);
			 balance=DBManager.getBalance(acname, sNo);
			 System.out.println("balance is"+balance);
			 credit=DBManager.getCredit(acname);
			 debit=DBManager.getDebit(acname);
			 total=balance+debit-credit;
			 System.out.println("total is "+total);
			
			 DBManager.updateAccount(acname, total, sNo);
			 DBManager.updateTrail(acname,total);
		
			 
			}
		
}
		
	}


