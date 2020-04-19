package com.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.model.Delivery;
import com.model.OrderInvoice;
import com.model.PaymentReciept;
import com.model.Route;
import com.model.SalesVendor;
import com.model.SellInvoice;
import com.model.SubOrder;
import com.model.Vendor;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class DeliveryDAO {
	
	static Connection con=null;
	public static ArrayList<Route> getRouteId(){
		ArrayList<Route> list=new ArrayList<Route>();
		con=(Connection) DBConnection.getConnection();
		Route route=null;
		try {
			
			String sql="select route_id from route";
			Statement stmt=(Statement) con.createStatement();
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
            while(rs.next()){
            	route=new Route();
			route.setRouteId(rs.getInt("route_id"));
			list.add(route);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		}
	public static ArrayList<SalesVendor> getVendorId(){
		ArrayList<SalesVendor> list=new ArrayList<SalesVendor>();
		con=(Connection) DBConnection.getConnection();
		SalesVendor sales=null;
		try {
			
			String sql="select vendor_id from vendor";
			Statement stmt=(Statement) con.createStatement();
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
            while(rs.next()){
             sales=new SalesVendor();
sales.setVendorId(rs.getInt("vendor_id"));
			list.add(sales);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		}
	
	public  static void Save(String description,String deleveryDate,String dFrom,String dTo,int routeId,int weight,String contactNo,int vendorId,int customerNo,int price,int vechileNo,String driverName,String order){
		con=(Connection) DBConnection.getConnection();
		try {
			 Statement stmt=(Statement) con.createStatement();
			 String sql="insert into delevery(d_description,d_delevery_date,d_from,d_to,d_weight,route_id,d_contact_no,vendor_id,d_customer_no,d_price,d_vechile_no,d_driver_name,order_id)"
			 		+ "VALUES('"+description+"','"+deleveryDate+"','"+dFrom+"','"+dTo+"',"+weight+","+routeId+",'"+contactNo+"',"+vendorId+","+customerNo+","+price+","+vechileNo+",'"+driverName+"',"+order+")";
			 System.out.println(sql);
			 stmt.executeUpdate(sql);
			 
}
		catch(Exception e){
			e.printStackTrace();
		}
	
	}
	public static ArrayList<SubOrder> searchProductDetail(int id1){
		con=(Connection) DBConnection.getConnection();
		SubOrder product;
		ArrayList<SubOrder>   list=new ArrayList<SubOrder>();
		SubOrder a=null;
		try {
			Statement stmt=(Statement) con.createStatement();
			String sql="select product_name,quantity,price from suborder  where order_id="+id1+"";
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				product=new SubOrder();
				System.out.println(rs.getString("product_name"));
				product.setProductName(rs.getString("product_name"));
				product.setQuantity(rs.getInt("quantity"));
				product.setPrice(rs.getInt("price"));
				list.add(product);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	
	public static ArrayList<SubOrder> searchProductInventory(int id1){
		con=(Connection) DBConnection.getConnection();
		SubOrder product;
		ArrayList<SubOrder>   list=new ArrayList<SubOrder>();
		SubOrder a=null;
		try {
			Statement stmt=(Statement) con.createStatement();
			String sql="select product_name,product_qty,price from productioninventory  where order_no="+id1+"";
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				product=new SubOrder();
				System.out.println(rs.getString("product_name"));
				product.setProductName(rs.getString("product_name"));
				product.setQuantity(rs.getInt("product_qty"));
				product.setPrice(rs.getInt("price"));
				list.add(product);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
		
	}
	public static int getDeliveryId(){
		con=(Connection) DBConnection.getConnection();
		int i=0;
		try {
			
			String sql="select oInviceId from orderinvoice";
			Statement stmt=(Statement) con.createStatement();
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
            while(rs.next()){
            	
            	i=rs.getInt("oInviceId");
			    
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return i;
		}

	public  static void SaveSellInvoice(int id,ArrayList<String> pname,ArrayList<String> quan,ArrayList<String> prc){
		con=(Connection) DBConnection.getConnection();
		try {
			 Statement stmt=(Statement) con.createStatement();
			 for(int i=0;i<quan.size();i++){
			String q=quan.get(i); 
			String name=	pname.get(i);
			String pr=prc.get(i);
			String sql="INSERT INTO sellinvoice (dId,productName,quantity,price)VALUES("+id+",'"+name+"','"+q+"','"+pr+"')";
			 System.out.println(sql);
			 stmt.executeUpdate(sql);
			 }
		}

		catch(Exception e){
			e.printStackTrace();
		}
	}
	public  static void SaveOrderInvoice(ArrayList<String> description1,ArrayList<String> dDate1,
			ArrayList<String> dFrom1,ArrayList<String> dTo1,ArrayList<Integer> weight1,
			ArrayList<Integer> routeId1,ArrayList<Integer> contactNo1,ArrayList<Integer> vId1,
			ArrayList<Integer>customerNo1,ArrayList<Integer> price1,ArrayList<String> driverName1){
		con=(Connection) DBConnection.getConnection();
		try {
			 Statement stmt=(Statement) con.createStatement();
			 for(int i=0;i<description1.size();i++){
			String	description=description1.get(i);
			String	 dDate=dDate1.get(i);
			String	 dFrom=dFrom1.get(i);
			String	 dTo=dTo1.get(i);
			int	 weight=weight1.get(i);
			int	 routeId=routeId1.get(i);
			int	  contactNo=contactNo1.get(i);
			int	 vId=vId1.get(i);
			int	 customerNo=customerNo1.get(i);
			int	 price=price1.get(i);
			String	 driverName=driverName1.get(i);
			
			String sql="INSERT INTO orderinvoice(description,dDate,dFrom,dTo,weight,routeId,contactNo,vId,customerNo,price,driverName)VALUES('"+description+"','"+dDate+"','"+dFrom+"','"+dTo+"',"+weight+","+routeId+","+contactNo+","+vId+","+customerNo+","+price+",'"+driverName+"')";
			 System.out.println(sql);
			 stmt.executeUpdate(sql);
			 } 
			 
}
		catch(Exception e){
			e.printStackTrace();
		
	
}
}
		public static ArrayList<SellInvoice> searchInvoiceDetail(){
			con=(Connection) DBConnection.getConnection();
			ArrayList<SellInvoice>   list=new ArrayList<SellInvoice>();
			SellInvoice invoice;
			try {
				Statement stmt=(Statement) con.createStatement();
				String sql="select sInvoiceId,productName,quantity,price from Sellinvoice ";
				System.out.println(sql);
				ResultSet rs=stmt.executeQuery(sql);
				while(rs.next()){
					invoice=new SellInvoice();
					System.out.println(rs.getString("productName"));
					invoice.setSellInvoiceId(rs.getInt("sInvoiceId"));
					invoice.setProductName(rs.getString("productName"));
					invoice.setQuantity(rs.getInt("quantity"));
					invoice.setPrice(rs.getInt("price"));
					list.add(invoice);
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			return list;
			
		}	

		public static ArrayList<OrderInvoice> searchOrderInvoiceDetail(){
			con=(Connection) DBConnection.getConnection();
			ArrayList<OrderInvoice>   list=new ArrayList<OrderInvoice>();
			OrderInvoice invoice;
			try {
				Statement stmt=(Statement) con.createStatement();
				String sql="select* from orderinvoice ";
				System.out.println(sql);
				ResultSet rs=stmt.executeQuery(sql);
				while(rs.next()){
					invoice=new OrderInvoice();
					invoice.setoInviceId(rs.getInt("oInviceId"));
					System.out.println(rs.getString("description"));
					invoice.setdDescription(rs.getString("description"));
					invoice.setdDate(rs.getString("dDate"));
					invoice.setdFrom(rs.getString("dFrom"));
					invoice.setdTo(rs.getString("dTo"));
					invoice.setWeight(rs.getInt("weight"));
                    invoice.setRoutId(rs.getInt("routeId"));
					System.out.println(rs.getString("contactNo"));

                    invoice.setContactNo(rs.getInt("contactNo"));
                    invoice.setVenderId(rs.getInt("vId"));
                    invoice.setCustomerNo(rs.getInt("customerNo"));
                    invoice.setPrice(rs.getInt("price"));
                    invoice.setVechileNo(rs.getInt("vechileNo"));
                    invoice.setDriverName(rs.getString("driverName"));
					list.add(invoice);
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			return list;
			
		}	
		public static ArrayList<OrderInvoice> getDataForPaymentReciep( int id){
			con=(Connection) DBConnection.getConnection();
			ArrayList<OrderInvoice>   list=new ArrayList<OrderInvoice>();
			OrderInvoice invoice;
			try {
				Statement stmt=(Statement) con.createStatement();
				String sql="SELECT c.customer_name AS namesa,m.total FROM mtsmain m,customer c WHERE invoice_id="+id+" AND c.customer_id=m.customer_id";
				System.out.println(sql);
				ResultSet rs=stmt.executeQuery(sql);
				while(rs.next()){
					invoice=new OrderInvoice();
					invoice.setdDescription(rs.getString("namesa"));
			     invoice.setPaymentAmount(rs.getInt("total"));
				  
					list.add(invoice);
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			return list;
			
		}	

		public  static void SavePaymentReciept(int id,String date,int amount,String cNo){
			con=(Connection) DBConnection.getConnection();
			try {
				 Statement stmt=(Statement) con.createStatement();
				
				String sql="INSERT INTO paymentrecipt (invoiceNo,paymentAmount,date,customerName)VALUES("+id+","+amount+",'"+date+"','"+cNo+"')";
				 System.out.println(sql);
				 stmt.executeUpdate(sql);
				 String sql1="INSERT INTO todolist(vendor,amount,active,pr_id,type)values('"+cNo+"','"+amount+"',1,"+id+",'sale')";
				 System.out.println(sql1);
				 stmt.executeUpdate(sql1); 
			}

			catch(Exception e){
				e.printStackTrace();
			}
		}
	}
