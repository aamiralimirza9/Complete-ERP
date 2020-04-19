package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.model.Company;
import com.mysql.jdbc.Statement;

public class CompanyDAO {
	
		
		static Connection conn=null;
		

	public static void save(String cName,String cNo,String cAdr,String cPhone,String cOWner){
		conn=(Connection) DBConnection.getConnection();
		 try {
			 Statement stmt=(Statement) conn.createStatement();
			 String sql="insert into company(companyName,companyNo,companyAddress,companyPhone,companyOwner)VALUES('"+cName+"','"+cNo+"','"+cAdr+"','"+cPhone+"','"+cOWner+"')";
			 System.out.println(sql);
			 stmt.executeUpdate(sql);
			 
			
		} catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
		}
		
	 }
}
