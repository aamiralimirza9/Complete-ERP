package com.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.Channel;
import com.model.Customer;
import com.model.Delivery;
import com.model.Product;
import com.model.SubOrder;
import com.model.prdata;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.servlet.productInventory;

public class SubOrderDAO {

	static Connection con=null;
	public  static void Save1(ArrayList<String> quan,ArrayList<String> pn,ArrayList<String> prc){
		con=(Connection) DBConnection.getConnection();
		int maxOrderno=0;
		try {
			 Statement stmt=(Statement) con.createStatement();
			 for(int i=0;i<quan.size();i++){
			String q=quan.get(i); 
			String p=	pn.get(i);
			int pro=SubOrderDAO.getproNo(p);
			String pr=	prc.get(i);
			 maxOrderno=getMaxOrder();
			String sql="INSERT INTO suborder(quantity,product_name,price,order_id)VALUES('"+q+"','"+p+"','"+pr+"',"+maxOrderno+")";
			 System.out.println(sql);
			 stmt.executeUpdate(sql);
			 }
			 
}
		catch(Exception e){
			e.printStackTrace();
		}
	
	}
	public  static void Save2(ArrayList<String> quan,ArrayList<String> pn,ArrayList<String> prc,ArrayList<String> otype){
		con=(Connection) DBConnection.getConnection();
		int maxOrderno=0;
		try {
			 Statement stmt=(Statement) con.createStatement();
			 for(int i=0;i<quan.size()-1;i++){
			String q=quan.get(i); 
			String p=	pn.get(i);
			String pr=prc.get(i);
			String o=otype.get(i);
			 maxOrderno=getMaxOrder();
			String sql="INSERT INTO suborder(product_name,quantity,price,type,order_id)VALUES('"+p+"','"+q+"','"+pr+"','"+o+"',"+maxOrderno+")";
			 System.out.println(sql);
			 stmt.executeUpdate(sql);
			 }
			 
}
		catch(Exception e){
			e.printStackTrace();
		}
	
	}
	public  static void SaveMtsOrder(ArrayList<String> quan,ArrayList<String> pn,ArrayList<String> prc,int order){
		con=(Connection) DBConnection.getConnection();
		int maxOrderno=0;
		try {
			 Statement stmt=(Statement) con.createStatement();
			 for(int i=0;i<quan.size()-1;i++){
			String q=quan.get(i); 
			String p=	pn.get(i);
			String pr=prc.get(i);
			
			 
			String sql="INSERT INTO submts(product_name,quantity,price,mtbId)VALUES('"+p+"','"+q+"','"+pr+"',"+order+")";
			 System.out.println(sql);
			 stmt.executeUpdate(sql);
			 }
			 
}
		catch(Exception e){
			e.printStackTrace();
		}
	
	}
	
	public static void updatemainMtsOrder(String total,int order){
		con=(Connection) DBConnection.getConnection();
		int maxOrderno=0;
		try {
			 Statement stmt=(Statement) con.createStatement();
			 
			String sql="update mtsmain set total="+total+" where id="+order+"";
			 System.out.println(sql);
			 stmt.executeUpdate(sql);
			 }
			 

		catch(Exception e){
			e.printStackTrace();
		}

		
		
	}
	public static void updatemainMtsdelivey(String orderId,String delivery){
		con=(Connection) DBConnection.getConnection();
		int maxOrderno=0;
		try {
			 Statement stmt=(Statement) con.createStatement();
			 
			String sql="update mtsmain set delivery_id="+delivery+" where id="+orderId+"";
			 System.out.println(sql);
			 stmt.executeUpdate(sql);
			 }
			 

		catch(Exception e){
			e.printStackTrace();
		}

		
		
	}
	public static ArrayList<SubOrder> searchProductName(String productName){
		con=(Connection) DBConnection.getConnection();
		SubOrder product;
		ArrayList<SubOrder> list=new ArrayList<SubOrder>();
		try {
			Statement stmt=(Statement) con.createStatement();
			String sql="select * from productioninventory  where product_name ='"+productName+"'";
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				product=new SubOrder();
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
	public static ArrayList<Product> getProductName(int id){
		ArrayList<Product> list=new ArrayList<Product>();
		con=(Connection) DBConnection.getConnection();
        Product p=null;
		try {
			String sql="select product_name from product where product_id="+id+"";
			Statement stmt=(Statement)con.createStatement();
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			
			while (rs.next()) {
				p=new Product();
                p.setProductName(rs.getString("product_name"));	
                list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public static ArrayList<Product> getmts(){
		ArrayList<Product> list=new ArrayList<Product>();
		con=(Connection) DBConnection.getConnection();
        Product p=null;
		try {
			String sql="select Max(id) from mtsmain";
			Statement stmt=(Statement)con.createStatement();
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			
			while (rs.next()) {
				p=new Product();
                p.setProductTypeId(rs.getInt("Max(id)"));	
                list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	public static ArrayList<Product> getDeliveryId(){
		ArrayList<Product> list=new ArrayList<Product>();
		con=(Connection) DBConnection.getConnection();
        Product p=null;
		try {
			String sql="select Max(d_id) from delevery";
			Statement stmt=(Statement)con.createStatement();
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			
			while (rs.next()) {
				p=new Product();
                p.setProductTypeId(rs.getInt("Max(d_id)"));	
                list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	public static int getProductId(String pName){
		con=(Connection) DBConnection.getConnection();
		int a=0;
		try {
			String sql="select product_qty from productioninventory where product_name='"+pName+"'";
			Statement stmt=(Statement)con.createStatement();
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				a=rs.getInt("product_qty");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}
	public static void updateProductQuan(String pName, int q){
		con=(Connection) DBConnection.getConnection();
		
		try {
			String sql="update productioninventory set product_qty="+q+" where product_name='"+pName+"'";
			Statement stmt=(Statement)con.createStatement();
			System.out.println(sql);
			stmt.executeUpdate(sql);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}
	public static ArrayList<SubOrder> showData(){
		con=(Connection) DBConnection.getConnection();
		SubOrder product;
		ArrayList<SubOrder> list=new ArrayList<SubOrder>();
		try {
			Statement stmt=(Statement) con.createStatement();
			String sql="SELECT product_name,quantity,price FROM submts WHERE mtbId=(SELECT MAX(id) FROM mtsmain)   ";
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				product=new SubOrder();
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
	public static ArrayList<Delivery> showDeliveryData(){
		con=(Connection) DBConnection.getConnection();
		Delivery delivery;
		ArrayList<Delivery> list=new ArrayList<Delivery>();
		try {
			Statement stmt=(Statement) con.createStatement();
			String sql="select * from delevery where d_id=(select MAX(d_id) from delevery )";
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
				delivery=new Delivery();
				delivery.setdId(rs.getInt("d_id"));
				delivery.setdDescription(rs.getString("d_description"));
				delivery.setdDate(rs.getString("d_delevery_date"));
				delivery.setdFrom(rs.getString("d_from"));
				delivery.setdTo(rs.getString("d_to"));
				delivery.setWeight(rs.getInt("d_weight"));
				delivery.setRoutId(rs.getInt("route_id"));
				delivery.setContactNo(rs.getInt("d_contact_no"));
				delivery.setVenderId(rs.getInt("vendor_id"));
				delivery.setCustomerNo(rs.getInt("d_customer_no"));
				delivery.setPrice(rs.getInt("d_price"));
				delivery.setVechileNo(rs.getInt("d_vechile_no"));
				delivery.setDriverName(rs.getString("d_driver_name"));
				list.add(delivery);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
		
	}
	public static int  getMaxOrder(){

		int id=0;
		con=(Connection) DBConnection.getConnection();
    
		try {
			String sql="SELECT MAX(order_id) FROM ordertable";
			Statement stmt=(Statement)con.createStatement();
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			
			while (rs.next()) {
			
    id=rs.getInt("MAX(order_id)");	
   		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
		
	}
	public static int  getMaxorder(){

		int id=0;
		con=(Connection) DBConnection.getConnection();
    
		try {
			String sql="SELECT order_id FROM mtsmain WHERE id=(SELECT MAX(id) FROM mtsmain)";
			Statement stmt=(Statement)con.createStatement();
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			
			while (rs.next()) {
			
    id=rs.getInt("order_id");	
   		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
		
	}
	public static int getMaxDelivery(){
		int id=0;
		con=(Connection) DBConnection.getConnection();
    
		try {
			String sql="SELECT delivery_id FROM mtsmain WHERE id=(SELECT MAX(id) FROM mtsmain)";
			Statement stmt=(Statement)con.createStatement();
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			
			while (rs.next()) {
			
    id=rs.getInt("delivery_id");	
   		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
		
		
		
		
		
	}
	 public static int getMaxInvoice(){
			int id=0;
			con=(Connection) DBConnection.getConnection();
	    
			try {
				String sql="SELECT MAX(id) FROM mtsinvoice";
				Statement stmt=(Statement)con.createStatement();
				System.out.println(sql);
				ResultSet rs=stmt.executeQuery(sql);
				
				while (rs.next()) {
				
	    id=rs.getInt("MAX(id)");	
	   		}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return id;
			
			
			
			 
		 
		 
	 }
	 public static void updateMtsInvoice(int invoice,int maxorder){
		 
			con=(Connection) DBConnection.getConnection();
			int maxOrderno=0;
			try {
				 Statement stmt=(Statement) con.createStatement();
				 
				String sql="update mtsmain set invoice_id="+invoice+" where order_id="+maxorder+"";
				 System.out.println(sql);
				 stmt.executeUpdate(sql);
				 }
				 

			catch(Exception e){
				e.printStackTrace();
			}

		 
	 }
	public static int  getMaxMtsOrder(){

		int id=0;
		con=(Connection) DBConnection.getConnection();
    
		try {
			String sql="SELECT MAX(id) FROM mtsmain";
			Statement stmt=(Statement)con.createStatement();
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
			
			while (rs.next()) {
			
    id=rs.getInt("MAX(id)");	
   		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return id;
		
	}
	 public static void addInvoice(int maxorder,int maxdelivery){
		 con=(Connection) DBConnection.getConnection();
			int maxOrderno=0;
			try {
				 Statement stmt=(Statement) con.createStatement();
				String sql="insert into mtsinvoice(order_id,d_id)values("+maxorder+","+maxdelivery+")";
				 System.out.println(sql);
				 stmt.executeUpdate(sql);
				 }
				 
	
			catch(Exception e){
				e.printStackTrace();
			}
		

		 
		 
	 }
			public static void	addTodoList(int order){
	
				con=(Connection) DBConnection.getConnection();
				try {
					 Statement stmt=(Statement) con.createStatement();
		
					String sql="INSERT INTO salestodolist (order_id,active)VALUES("+order+",1)";
					 System.out.println(sql);
					 stmt.executeUpdate(sql);
					 
					 
		}
				catch(Exception e){
					e.printStackTrace();
				}

					
	
	
	
	
}
			
		public static void	insertCustomer(int order, String customer){
			con=(Connection) DBConnection.getConnection();
			try {
				 Statement stmt=(Statement) con.createStatement();
	
				String sql="update ordertable set customer_id="+customer+" where order_id="+order+"";
				 System.out.println(sql);
				 stmt.executeUpdate(sql);
				 
				 
	}
			catch(Exception e){
				e.printStackTrace();
			}

				

			
			
		}
			
			
			
			
		public static void	insertMainCustomer(int order, int customer,String podate){
			con=(Connection) DBConnection.getConnection();
			try {
				 Statement stmt=(Statement) con.createStatement();
	
				String sql="insert into mtsmain(order_id,customer_id,po_date)values ("+order+","+customer+",'"+podate+"')";
				 System.out.println(sql);
				 stmt.executeUpdate(sql);
				 
				 
	}
			catch(Exception e){
				e.printStackTrace();
			}

				

			
			
		}
		
		public static ArrayList<Product> PrVendorText(int VandorId){
			  
			  ArrayList<Product> empty=new ArrayList<Product>();
			 Product  pr=null;
			  con=(Connection)DBConnection.getConnection();
			  try{
				  Statement st=(Statement) con.createStatement();
				  String sql="select product_name from product where product_id="+VandorId+"";
				  System.out.println(sql);
				  st.executeQuery(sql);
				  
				  ResultSet rs=st.executeQuery(sql);
				  while(rs.next()){
					  pr=new Product();
					  
					  System.out.println(rs.getString("product_name"));
					  pr.setProductName(rs.getString("product_name"));
					  
					  empty.add(pr);
					  
				  }
				  
			  }
			  catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			return empty;
			  
		  }  
		public static int getproNo(String id){
	      	  con=(Connection)DBConnection.getConnection();
	      	 int id1=0;
	      	 ResultSet rs=null;
	      

	    
	    try{
	  	  Statement st=(Statement) con.createStatement();
	  	  String sql="SELECT product_id FROM product WHERE product_name='"+id+"'";
	  	  System.out.println(sql);
	  	   rs=st.executeQuery(sql);
	  	  while(rs.next()){

	  		  id1=rs.getInt("product_id");
	  		 
	  		  
	  	  
	  	
	  	  }
	    }
	    catch (SQLException e) {
	  		// TODO Auto-generated catch block
	  		e.printStackTrace();
	  	}
	    
	  return id1;
	    
	  }
			
		public static ArrayList<Product> getpi(){
			ArrayList<Product> list=new ArrayList<Product>();
			con=(Connection) DBConnection.getConnection();
	        Product p=null;
			try {
				String sql="SELECT MAX(id) FROM mainproductinventory";
				Statement stmt=(Statement)con.createStatement();
				System.out.println(sql);
				ResultSet rs=stmt.executeQuery(sql);
				
				while (rs.next()) {
					p=new Product();
	                p.setProductTypeId(rs.getInt("Max(id)"));	
	                list.add(p);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return list;
			
		}			
			
}
