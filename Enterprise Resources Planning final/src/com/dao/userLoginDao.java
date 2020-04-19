package com.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.model.roleuser;

public class userLoginDao {
	
	static Connection conn=null;
	
	
	
	public static ArrayList<roleuser> getaccountPermission(String role){
    	  String nam=null;
    	  ArrayList<roleuser> permit=new ArrayList<roleuser>();
    	  roleuser r=null;
    	  
    		 Connection con = (Connection) DBConnection.getConnection();
			        try{    
		        	Statement stm = (Statement) con.createStatement();
				   String query="SELECT p.permission_name FROM permission p, role r  WHERE  r.permission_id=p.id AND  r.role_name='"+role+"'";
		            System.out.println(query);
		            ResultSet rs=stm.executeQuery(query);
		            while(rs.next()){
		            	r=new roleuser();
		            r.setRolename(rs.getString("permission_name"));
		            permit.add(r);
		            }}
		            
		        
		      catch(SQLException ex){
		          ex.printStackTrace();
		      }
		           

     	  
     	  
return permit;
    	  
      }
      
      

      public static String getEmployeeRole( String empuser){
     String roles=null;
				 Connection con = (Connection) DBConnection.getConnection();
				int val=0;
			        try{    
			        	Statement stm = (Statement) con.createStatement();
					   String query="SELECT role FROM employee WHERE uname='"+empuser+"'";
			            System.out.println(query);
			            ResultSet rs=stm.executeQuery(query);
			            while(rs.next()){
			            	
			            	roles=(rs.getString("role"));
			            	
			            }}
			            
			        
			      catch(SQLException ex){
			          ex.printStackTrace();
			      }
			           return roles;
		
     	 
     	 
      }
				

  	
      public static boolean  getlogin(String id,String password){
    	  boolean	user=false;
  				 Connection con = (Connection) DBConnection.getConnection();
       			        try{    
  			        	Statement stm = (Statement) con.createStatement();
  					   String query="SELECT uname,password FROM employee  where uname='"+id+"' AND password='"+password+"'";
  			            System.out.println(query);
  			            ResultSet rs=stm.executeQuery(query);
  			            while(rs.next()){
  			            rs.getString("uname");
  			            rs.getString("password");
  			            user=true;
  			            }}
  			            
  			        
  			      catch(SQLException ex){
  			          ex.printStackTrace();
  			      }
  			           return  user;
  		
          	 
          	 
           }
	
	
	
	
	
	
}
