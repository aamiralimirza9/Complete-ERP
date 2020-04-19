package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DBManager;

import Util.convert;

/**
 * Servlet implementation class BankOpenServlet
 */
@WebServlet("/BankOpenServlet")
public class BankOpenServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BankOpenServlet() {
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

		
		
			String acNo=request.getParameter("a");
			String acTitle=request.getParameter("b");
			String acType=request.getParameter("c");
			String acSubtype=request.getParameter("d");
			String acAmount=request.getParameter("e");
			int acNoInt=convert.conversionInt(acNo);
			int acAmountInt=convert.conversionInt(acAmount);
			String name=request.getParameter("f");
		
			String code=request.getParameter("h");
			String location=request.getParameter("j");
	

			DBManager.createBankAccount(acNoInt, acTitle, acType, acSubtype, acAmountInt,name,location,code);
			int no=DBManager.getAccountId(acNo);
			DBManager.createTrailBalance(acNoInt,acTitle,acType,acAmountInt,no);
			
		
		
	}

}
