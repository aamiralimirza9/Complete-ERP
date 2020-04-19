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
import com.model.dashboardmodel;

/**
 * Servlet implementation class dashboard
 */
@WebServlet("/dashboard")
public class dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dashboard() {
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
	
		String type1="Assests";
		String type2="Liablity";
		String type3="Expenses";
		String type4="Revenue";
		String type5="Capital";
		
		int expensestotal=0;
		ArrayList<String> list= DBManager.getaccountTypeList(type3);
		for(String l:list){
			System.out.println(l);
			expensestotal+=DBManager.getAccountSum(l);
			
		}
		System.out.println("the expensetotal is "+expensestotal);
		
		int salestotal=0;
		ArrayList<String> list2= DBManager.getaccountTypeList(type4);
		for(String l:list2){
			System.out.println(l);
		salestotal+=DBManager.getAccountSum(l);
			
		}
		System.out.println("the salestotal is "+salestotal);
	
		int profit=salestotal-expensestotal;
		ArrayList<dashboardmodel> datalist=new ArrayList<dashboardmodel>();
		System.out.println("profit is "+profit);
		int cash=DBManager.getAccountMax("cash");
		System.out.println("The cash is"+cash);
		int recieveable=DBManager.getAccountMax("AccountRecieveable");
		System.out.println("The recieveable is"+recieveable);
		int payable=DBManager.getAccountMax("AccountPayable");
		System.out.println("The payable is"+payable);
		
		dashboardmodel d=new dashboardmodel();
		d.setProfit(profit);
		d.setExpense(expensestotal);
		d.setSale(salestotal);
		d.setCash(cash);
		d.setRecieveable(recieveable);
		d.setPayable(payable);
		datalist.add(d);
		Gson gson2=new Gson();
		response.setContentType("application/json");
		response.getWriter().write((gson2.toJson(datalist)));
	
		
	}

}
