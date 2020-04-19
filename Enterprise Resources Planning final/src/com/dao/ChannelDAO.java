package com.dao;

import java.sql.Connection;

import com.mysql.jdbc.Statement;

public class ChannelDAO {
	static Connection conn=null;
	public static void save(String  route){
		 
		 conn=(Connection) DBConnection.getConnection();
		 try {
			 
			 Statement stmt=(Statement) conn.createStatement();
			 String sql="insert into channel(route)VALUES('"+route+"')";
			 System.out.println(sql);
			stmt.executeUpdate(sql);
			 
			
		} catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
		}
		 
	 }

}
