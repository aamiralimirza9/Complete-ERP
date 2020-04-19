package com.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.model.Customer;
import com.model.SubOrder;
import com.model.salesTodoList;
import com.mysql.jdbc.Connection;


public class OrderDAO {

	static Connection con=null;
	public static ArrayList<Customer> getCustomerName(){
		ArrayList<Customer> list=new ArrayList<Customer>();
		con=(Connection) DBConnection.getConnection();
        Customer c=null;
		try {
			String sql="SELECT MAX(order_id) FROM ordertable";
			Statement stmt=(Statement)con.createStatement();
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			
			while (rs.next()) {
				c=new Customer();
                c.setId(rs.getInt("MAX(order_id)"));	
                System.out.println(rs.getInt("MAX(order_id)"));
                list.add(c);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	public static int getId(String name){
		con=(Connection) DBConnection.getConnection();
		int id=0;
		
		try {
			String sql="select customer_id from customer where customer_name='"+name+"'";
			Statement stmt=(Statement) con.createStatement();
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
            	
			id=rs.getInt("customer_id");
						}
			} catch (Exception e) {
		         e.printStackTrace();
		}
		return id;
		}
	public static void save(String nam,String date,int status){
		con=(Connection) DBConnection.getConnection();
		try {
            
			 String sql="insert into ordertable (order_type,delivery_date,order_status) VALUES('"+nam+"','"+date+"',"+status+")";
			 System.out.println(sql);
			 Statement stmt=(Statement) con.createStatement();
			 stmt.executeUpdate(sql);
			 
}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	 public static ArrayList<salesTodoList> InsertTodoList(){
			ArrayList<salesTodoList> aclist=new ArrayList<salesTodoList>();
			int i=1;
			 Connection con = (Connection) DBConnection.getConnection();
			salesTodoList a=null;
		        try{    
		           Statement stm = (Statement) con.createStatement();
				   String query="SELECT std_id,order_id FROM salesTodoList WHERE active="+i+" ";
				   		
				   		
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		            	System.out.println("order Id"+rs.getInt("order_id"));
		            	System.out.println("To do list id"+rs.getInt("std_id"));
		             a=new salesTodoList();
		             a.setOrderId(rs.getInt("order_id"));
		             a.setTdId(rs.getInt("std_id"));
		               
		                aclist.add(a);
		             
		            }
		            return aclist;
		        }
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           return aclist;
		            
		     
	
			
		}
	 
	 
	 public static ArrayList<SubOrder> todolistSearch(int id1){
			con=(Connection) DBConnection.getConnection();
			SubOrder product;
			ArrayList<SubOrder>   list=new ArrayList<SubOrder>();
			SubOrder a=null;
			try {
				Statement stmt=(Statement) con.createStatement();
				String sql="select product_id, product_name,quantity,price from suborder  where order_id="+id1+"";
				System.out.println(sql);
				ResultSet rs=stmt.executeQuery(sql);
				while(rs.next()){
					product=new SubOrder();
					System.out.println(rs.getString("product_name"));
					System.out.println(rs.getInt("quantity"));
					product.setProductName(rs.getString("product_name"));
					product.setQuantity(rs.getInt("quantity"));
					product.setPrice(rs.getInt("price"));
					product.setProduct_id(rs.getInt("product_id"));
					list.add(product);
				}
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
			return list;
			
		}
	 
	 
	 public static ArrayList<Customer> getcust(int cust){
			ArrayList<Customer> list=new ArrayList<Customer>();
			con=(Connection) DBConnection.getConnection();
	        Customer c=null;
			try {
				String sql="select  customer_name from customer where customer_id="+cust+" ";
				Statement stmt=(Statement)con.createStatement();
				System.out.println(sql);
				ResultSet rs=stmt.executeQuery(sql);
				
				while (rs.next()) {
					c=new Customer();
	                c.setCustomerName(rs.getString("customer_name"));	
	                
	                list.add(c);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
			
		}
	 
	
	
	}
