package com.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.model.Company;
import com.model.ProductType;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class ProductTypeDAO {
	

		
	static Connection conn=null;
	public static void save(String pName,String pCatName,String allNo ){
		conn=(Connection) DBConnection.getConnection();
		 try {
			 
			 Statement stmt=(Statement) conn.createStatement();
             String sql="insert into producttype(product_category_name,allocation_no,product_name)VALUES('"+pName+"','"+pCatName+"','"+allNo+"')";
             System.out.println(sql);
			 stmt.executeUpdate(sql);
			
		} catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
		}
		 
	 }

}
