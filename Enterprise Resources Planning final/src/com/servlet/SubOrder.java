package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.SubOrderDAO;
import com.google.gson.Gson;
import com.model.Product;
import com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array;

/**
 * Servlet implementation class SubOrder
 */
@WebServlet("/SubOrder")
public class SubOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubOrder() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		if(request.getParameter("key")!=null){

		String[]quantity=request.getParameterValues("quantity[]");
		System.out.println("lenght is"+quantity[1]);
		
		String[] productName=request.getParameterValues("productName[]");
		System.out.println("lenght is"+productName[1]);

		String[] price=request.getParameterValues("price[]");
		System.out.println("price lenght is"+price.length);

		ArrayList<String> pn=new ArrayList<String>();
		ArrayList<String> quan=new ArrayList<String>();
		ArrayList<String> prc=new ArrayList<String>();
		for(int i = 1; i<=productName.length-1;i++)
		{
			pn.add(productName[i]);
			System.out.println(productName[i]);
			quan.add(quantity[i]);
			System.out.print(quantity[i]);
			prc.add(price[i]);
			System.out.print(price[i]);
		}

		SubOrderDAO.Save1(quan,pn,prc);
		int order=SubOrderDAO.getMaxOrder();
		SubOrderDAO.addTodoList(order);
		response.getWriter().write("success");
		
		}        
		if(request.getParameter("productId")!=null){
			String ProductId=request.getParameter("productId");
			int i=Integer.parseInt(ProductId);
			ArrayList<Product> p=SubOrderDAO.PrVendorText(i);
			Gson gson=new Gson();
			response.setContentType("application/json");
			response.getWriter().write(gson.toJson(p));
			
			
			
		}
	}

}
