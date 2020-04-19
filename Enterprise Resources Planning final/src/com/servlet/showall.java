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
import com.model.CashVoucher;
import com.model.Journal;
import com.model.Ledger;
import com.model.TrailBalance;
import com.model.bank;

/**
 * Servlet implementation class showall
 */
@WebServlet("/showall")
public class showall extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public showall() {
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
				String nam=request.getParameter("keyno");
				System.out.println(nam);
				if(nam!=null){
	
				ArrayList<Account>ac= DBManager.showRecoord(nam);
				Gson gson=new Gson();
				response.setContentType("application/json");
				response.getWriter().write((gson.toJson(ac)));}
				if(request.getParameter("editno")!=null){
					String no=	request.getParameter("editno");
					String name=request.getParameter("editname");
					String type=request.getParameter("edittype");
					String subtype=	request.getParameter("editsubtype");
					DBManager.editGl(no,name,type,subtype);	
					response.sendRedirect("show.jsp");
			}
			if(request.getParameter("delno")!=null)
			{
				String no=request.getParameter("delno");
				DBManager.delGel(no);
				response.sendRedirect("show.jsp");
				
				
			}
			if(request.getParameter("ledger")!=null)
			{
				String no=request.getParameter("ledger");
				System.out.println(no);
				
				ArrayList<Ledger> l=DBManager.getLedger(no);
				Gson gson1=new Gson();
				response.setContentType("application/json");
				response.getWriter().write((gson1.toJson(l)));
				
				
			}
			if(request.getParameter("trail")!=null)
			{
				String no=request.getParameter("trail");
				ArrayList<TrailBalance> trail=DBManager.getTrailBlanace();
				Gson gson2=new Gson();
				response.setContentType("application/json");
				response.getWriter().write((gson2.toJson(trail)));
				
				
				
			}
			
			if(request.getParameter("recieve")!=null)
			{	String no=request.getParameter("recieve");
				ArrayList<Ledger> l=DBManager.getLedger(no);
				Gson gson3=new Gson();
				response.setContentType("application/json");
				response.getWriter().write((gson3.toJson(l)));
				
				
				
			}
			if(request.getParameter("payable")!=null)
			{	String no=request.getParameter("payable");
				ArrayList<Ledger> l=DBManager.getLedger(no);
				Gson gson4=new Gson();
				response.setContentType("application/json");
				response.getWriter().write((gson4.toJson(l)));
				
				
				
			}
		
			if(request.getParameter("cash")!=null)
			{	String no=request.getParameter("cash");
				ArrayList<Ledger> l=DBManager.getLedger(no);
				Gson gson5=new Gson();
				response.setContentType("application/json");
				response.getWriter().write((gson5.toJson(l)));
				
				
				
			}
		
			if(request.getParameter("jvlist")!=null)
			{	
				ArrayList<Journal> j=DBManager.showJournalVoucher();
				Gson gson6=new Gson();
				response.setContentType("application/json");
				response.getWriter().write((gson6.toJson(j)));
				
				
				
			}
			
			if(request.getParameter("cvlist")!=null)
			{	
				ArrayList<CashVoucher> cv=DBManager.showCashVoucher();
				Gson gson7=new Gson();
				response.setContentType("application/json");
				response.getWriter().write((gson7.toJson(cv)));
				
				
				
			}
			if(request.getParameter("getbankac")!=null){
				String key=request.getParameter("values");
				ArrayList<bank> ba=DBManager.getbankdetail(key);
				Gson gson1=new Gson();
				response.setContentType("application/json");
				response.getWriter().write((gson1.toJson(ba)));
				
			}
			
			if(request.getParameter("bankrecieptshow")!=null){
				String key=request.getParameter("bankrecieptshow");
				ArrayList<bank> ba=DBManager.showbankreciept();
				Gson gson1=new Gson();
				response.setContentType("application/json");
				response.getWriter().write((gson1.toJson(ba)));
				
			}
			
			if(request.getParameter("bankpaymentshow")!=null){
				String key=request.getParameter("bankpaymentshow");
				ArrayList<bank> ba=DBManager.showbankpayment();
				Gson gson1=new Gson();
				response.setContentType("application/json");
				response.getWriter().write((gson1.toJson(ba)));
				
			}
	}

}
