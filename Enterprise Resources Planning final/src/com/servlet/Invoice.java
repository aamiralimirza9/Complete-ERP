package com.servlet;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
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
import com.dao.DeliveryDAO;
import com.dao.SubOrderDAO;

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
 * Servlet implementation class Invoice
 */
@WebServlet("/Invoice")
public class Invoice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Invoice() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.print("ok"+request.getParameter("d1"));

		int maxorder=SubOrderDAO.getMaxorder();
		int maxdelivery=SubOrderDAO.getMaxDelivery();
		SubOrderDAO.addInvoice(maxorder,maxdelivery);
		int invoice=SubOrderDAO.getMaxInvoice();
		SubOrderDAO.updateMtsInvoice(invoice,maxorder);
        //Sell Invoice arrays
		/*String[]quantity=request.getParameterValues("quantity[]");
		//System.out.println("lenght is"+quantity[1]);
		String[] productName=request.getParameterValues("productName[]");
		String[] price=request.getParameterValues("price[]");
		//Sell Invoice Lists
		ArrayList<String> quanList=new ArrayList<String>();
		ArrayList<String> pnList=new ArrayList<String>();
		ArrayList<String> prcList=new ArrayList<String>();
	     int dId=DeliveryDAO.getDeliveryId();

				for(int i = 1; i<=productName.length-1;i++)
				{
					pnList.add(productName[i]);
					System.out.println(productName[i]);
					quanList.add(quantity[i]);
					System.out.print(quantity[i]);
					prcList.add(price[i]);
					System.out.print(price[i]);
					
				}
				DeliveryDAO.SaveSellInvoice(dId, pnList,quanList, prcList);
        //Order Invoice Invoice arrays

		String[] description=request.getParameterValues("description[]");
		System.out.println("lenght is oks"+description[1]);
		String[] dDate=request.getParameterValues("dDate[]");
		String[] dFrom=request.getParameterValues("dFrom[]");
		String[] dTo=request.getParameterValues("dTo[]");
		String[] w=request.getParameterValues("weight[]");
		Integer[] weight = new Integer[w.length];
		for (int i=0; i < w.length; i++) 
			try{
				{
			        weight[i] = Integer.parseInt(w[i]);
					System.out.println("w issssss"+weight[i]);

			    }
			}
		catch (NumberFormatException nfe) {
			
	        //NOTE: write something here if you need to recover from formatting errors
	    };

		String[] rId1=request.getParameterValues("rId[]");
		int[] rId = new int[rId1.length];
		for (int i=0; i < rId1.length; i++) 
		try{
			{
		        rId[i] = Integer.parseInt(rId1[i]);
 

		    }
		}
	catch (NumberFormatException nfe) {
		
        //NOTE: write something here if you need to recover from formatting errors
    };
		String[] cNo1=request.getParameterValues("cNo[]");
		int[] cNo = new int[cNo1.length];
		for (int i=0; i < cNo1.length; i++) 
		try{
			{
		       
		        cNo[i] = Integer.parseInt(cNo1[i]);
                         }
		}
	catch (NumberFormatException nfe) {
		
        //NOTE: write something here if you need to recover from formatting errors
    };
		String[] vId1=request.getParameterValues("vId[]");
		int[] vId = new int[vId1.length];
		for (int i=0; i < vId1.length; i++) try{
			{
		        vId[i] = Integer.parseInt(vId1[i]);
                         }
		}
	catch (NumberFormatException nfe) {
		
        //NOTE: write something here if you need to recover from formatting errors
    };
	    
		String[] cNum1=request.getParameterValues("cNum[]");
		int[] cNum= new int[cNum1.length];
			for (int i1=0; i1 < vId1.length; i1++)
				try{
				{
			        cNum[i1] = Integer.parseInt(cNum1[i1]);
				}
			}
		catch (NumberFormatException nfe) {
			
	        //NOTE: write something here if you need to recover from formatting errors
	    };
		    
	    
		String[] prices=request.getParameterValues("price1[]");
	

		Integer[] price12 = new Integer[prices.length];
		for (int i=0; i < prices.length; i++) {
			try{
				
			        price12[i] = Integer.parseInt(prices[i]);
				
			}
		catch (NumberFormatException nfe) {
			
	        //NOTE: write something here if you need to recover from formatting errors
	    };
		    
		}
	    
		String[] vechileNo1=request.getParameterValues("vechileNo[]");
		int[] vechileNo = new int[vechileNo1.length];
		for (int i=0; i < vechileNo1.length; i++) try{
			
				vechileNo[i] = Integer.parseInt(vechileNo1 [i]);

			
		}
	catch (NumberFormatException nfe) {
		
        //NOTE: write something here if you need to recover from formatting errors
    };
	    
	
    
	    
		String[] drvrName=request.getParameterValues("drvrName[]");


        //Order Invoice Lists
	    ArrayList<String> descriptionList=new ArrayList<String>();
	    ArrayList<String> dDateList=new ArrayList<String>();
	    ArrayList<String> dFromList=new ArrayList<String>();
	    ArrayList<String> dToList=new ArrayList<String>();
	    ArrayList<Integer> weightList=new ArrayList<Integer>();
	    ArrayList<Integer> rIdList=new ArrayList<Integer>();
	    ArrayList<Integer> cNoList=new ArrayList<Integer>();
	    ArrayList<Integer> vIdList=new ArrayList<Integer>();
	    ArrayList<Integer> cNumList=new ArrayList<Integer>();
	    ArrayList<Integer> price1List=new ArrayList<Integer>();
	    ArrayList<Integer> vechileNoList=new ArrayList<Integer>();
		ArrayList<String> drvrNameList=new ArrayList<String>();
		
		
		for(int i = 1; i<=description.length-1;i++){
			descriptionList.add(description[i]);
			dDateList.add(dDate[i]);
			dFromList.add(dFrom[i]);
			dToList.add(dTo[i]);
			weightList.add(weight[i]);
			rIdList.add(rId[i]);
			cNoList.add(cNo[i]);
			vIdList.add(vId[i]);
			cNumList.add(cNum[i]);
			price1List.add(price12[i]);
			vechileNoList.add(vechileNo[i]);
			drvrNameList.add(drvrName[i]);
		}	
		DeliveryDAO.SaveOrderInvoice(descriptionList, dDateList, dFromList, dToList, weightList, rIdList, cNoList, vIdList, cNumList, price1List, drvrNameList);
		*/	
	}
	
	}

