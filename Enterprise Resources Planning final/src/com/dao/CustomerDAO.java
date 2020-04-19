package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.model.Customer;
import com.mysql.jdbc.Statement;

public class CustomerDAO {

		
	static Connection conn=null;
	public static void save(String  cName,String comName,String cAdr,String cMob,String cAcco){
		 
		 conn=(Connection) DBConnection.getConnection();
		 try {
			 
			 Statement stmt=(Statement) conn.createStatement();
			 String sql="insert into customer(customer_name,customer_company_name,customer_postaladdress,customer_Mobile_No,customer_bank_account)VALUES('"+cName+"','"+comName+"','"+cAdr+"','"+cMob+"','"+cAcco+"')";
			 System.out.println(sql);
			stmt.executeUpdate(sql);
			 
			
		} catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
		}
		 
	 }
}
