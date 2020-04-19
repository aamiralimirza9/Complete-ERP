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
import com.model.purchasingRequsition;

/**
 * Servlet implementation class tableshowServlet
 */
@WebServlet("/tableshowServlet")
public class tableshowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tableshowServlet() {
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
		PrintWriter p=response.getWriter();
		String PrID=request.getParameter("PRID");
		
		
		int prid=Integer.parseInt(PrID);
		ArrayList<Integer> prMaterialno=new ArrayList<Integer>();
		ArrayList<String> prPrice=new ArrayList<String>();
		ArrayList<String> prQuantity=new ArrayList<String>();
		ArrayList<String> prStatus=new ArrayList<String>();
		
		purchasingRequsition pr=new purchasingRequsition();
		String [] MyJdata=request.getParameterValues("tableName[]");
		String [] MyMPrice=request.getParameterValues("tableprice[]");
		String [] MyprQuantity=request.getParameterValues("tableprQuantity[]");
		String [] MyprStatus=request.getParameterValues("tableprStatus[]");
		 //for  Material data 
		int i;
		for(int b=1;b<MyJdata.length-1;b++){
			i=MPDBManager.materialId(MyJdata[b]);
			prMaterialno.add(i);
			prPrice.add(MyMPrice[b]);
			prQuantity.add(MyprQuantity[b]);
			prStatus.add(MyprStatus[b]);
		
		System.out.println(prMaterialno);
		System.out.println(prPrice);
		System.out.println(prQuantity);
		System.out.println(prStatus);
		}
		System.out.println(PrID);
		MPDBManager.AddArray(prMaterialno, prPrice,prQuantity,prStatus,prid);
		response.getWriter().write("success");
	   //DBManager.PrIDINSERT(prid);
	}

}
