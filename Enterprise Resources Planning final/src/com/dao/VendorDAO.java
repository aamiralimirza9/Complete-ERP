package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.model.Company;
import com.model.Vendor;
import com.mysql.jdbc.Statement;

public class VendorDAO {


	static Connection conn=null;
	public static void save(String vName,String cTitle,String cAddr,int cNum,int cMob,int cNtnt){
		 
		conn=(Connection) DBConnection.getConnection();
		 try {
			 Statement stmt=(Statement) conn.createStatement();
			 String sql="insert into vendor(vendor_name,company_title,company_address,contact_number,mobile_number,ntn_number)VALUES('"+vName+"','"+cTitle+"','"+cAddr+"','"+cNum+"','"+cMob+"','"+cNtnt+"')";
			 System.out.println(sql);
			 stmt.executeUpdate(sql);
			
		} catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
		}
		 
	 }
}
