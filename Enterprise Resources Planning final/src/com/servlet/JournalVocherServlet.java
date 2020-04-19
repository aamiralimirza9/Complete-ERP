package com.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DBConnection;
import com.dao.DBManager;
import com.model.Account;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.util.JRLoader;

/**
 * Servlet implementation class JournalVocherServlet
 */
@WebServlet("/JournalVocherServlet")
public class JournalVocherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String v=request.getParameter("j");
		String d=request.getParameter("v");
		String t=request.getParameter("t");
		String comment=request.getParameter("comment");
		String jvname=request.getParameter("nam");
		System.out.println(v+d+t);
			if(request.getParameter("j")!=null && request.getParameter("v")!=null ){
				DBManager.addJournalVoucher(d,v,t,comment,jvname);
				
				
				
			}
			int getMax=DBManager.getMaxVoucher();
			
		ArrayList<String> acList=new ArrayList<String>();
		ArrayList<String> acList2=new ArrayList<String>();

		ArrayList<String> acList3=new ArrayList<String>();
		ArrayList<String> acList4=new ArrayList<String>();
		Account ac=new Account();
		Account ac2=new Account();
			String[] myJsonData = request.getParameterValues("tablename[]");
			String[] JsonDataamount = request.getParameterValues("tableamount[]");	
			String[] crName = request.getParameterValues("tableCrName[]");
			String[] crAmount = request.getParameterValues("tabletCramount[]");	
	
			
	//debit			
			for(int b=1;b<myJsonData.length-1;b++){
						acList.add(myJsonData[b]);
						acList2.add(JsonDataamount[b]);
						
						}
				DBManager.addDbJournal(acList,acList2,v,d,getMax);
				DBManager.updateTrail(acList,acList2);
				//credit
				for(int a=1;a<crName.length-1;a++){
							acList3.add(crName[a]);
							acList4.add( crAmount[a]);
							}
				DBManager.addCrJournal(acList3,acList4,v,d,getMax);
				DBManager.updateTrail(acList3,acList4);
			
				
		
					
 

				
	}
			
}	

	

						
	


