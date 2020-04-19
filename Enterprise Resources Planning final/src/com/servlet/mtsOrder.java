package com.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.OrderDAO;
import com.dao.SubOrderDAO;
import com.google.gson.Gson;
import com.model.Customer;
import com.model.Product;
import com.model.SubOrder;

/**
 * Servlet implementation class mtsOrder
 */
@WebServlet("/mtsOrder")
public class mtsOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mtsOrder() {
        super();
        // TODO Auto-generated constructor stub
    }

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
		   if(request.getParameter("search1")!=null)	{
	        	
				String search = request.getParameter("search1");
		        System.out.println("Data from ajax call " + search);
		        ArrayList<SubOrder> list=SubOrderDAO.searchProductName(search);
		        Gson gson=new Gson();
				response.setContentType("application/json");
				response.getWriter().write((gson.toJson(list)));
		        }
		        if(request.getParameter("par")!=null){
	                ArrayList<Product> list=SubOrderDAO.getmts();
	                Gson gson=new Gson();
	        	    response.setContentType("application/json");
	        	    response.getWriter().write((gson.toJson(list)));
		        }
		        if(request.getParameter("cust")!=null){
		        	int cust=Integer.parseInt(request.getParameter("cust"));
		            ArrayList<Customer> list=OrderDAO.getcust(cust);
	                Gson gson=new Gson();
	        	    response.setContentType("application/json");
	        	    response.getWriter().write((gson.toJson(list)));
		        	
		        	
		        	
		        }
		        if(request.getParameter("pname1")!=null){
		        	int netQunatity=0;
		        	String pname= request.getParameter("pname1");
		    		System.out.println(request.getParameter("pname1"));
		    		int q=Integer.parseInt(request.getParameter("q1"));
		    		System.out.println(request.getParameter("q1"));
					int i=SubOrderDAO.getProductId(pname);
					System.out.println(i);
				    netQunatity=i-q;
					SubOrderDAO.updateProductQuan(pname,netQunatity);
					

		        }
				if(request.getParameter("pinv")!=null){
		            ArrayList<Product> list=SubOrderDAO.getpi();
	                Gson gson=new Gson();
	        	    response.setContentType("application/json");
	        	    response.getWriter().write((gson.toJson(list)));
		
				
				}
		
		        
		        if(request.getParameter("nam")!=null){
		        	int orderid=Integer.parseInt(request.getParameter("order"));
		        	String total=request.getParameter("total");
		        	String cust=request.getParameter("customer");
		        	String podate=request.getParameter("podate");
		        	int customer=OrderDAO.getId(cust);
		        	SubOrderDAO.insertMainCustomer(orderid,customer,podate);
		        	int order=SubOrderDAO.getMaxMtsOrder();
				String[]quantity=request.getParameterValues("quantity[]");
				System.out.println("lenght is"+quantity[1]);
				String[] productName=request.getParameterValues("productName[]");
				System.out.println("lenght is"+productName[1]);
				String[] price=request.getParameterValues("price[]");
				String[] ordertype=request.getParameterValues("types[]");

				ArrayList<String> pn=new ArrayList<String>();
				ArrayList<String> quan=new ArrayList<String>();
				ArrayList<String> prc=new  ArrayList<String>();
				ArrayList<String> types=new  ArrayList<String>();
				for(int i = 1; i<=productName.length-1;i++)
				{
					pn.add(productName[i]);
					System.out.print(productName[i]);

					quan.add(quantity[i]);
					System.out.print(quantity[i]);
					prc.add(price[i]);
					System.out.print(price[i]);
					types.add(ordertype[i]);
					System.out.print(ordertype[i]);
				}
				SubOrderDAO.SaveMtsOrder(quan, pn, prc,order);
				SubOrderDAO.updatemainMtsOrder(total,order);
				response.getWriter().write("success");
		        }
				
		        

	}

}
