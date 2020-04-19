package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Product;
import com.model.ProductType;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class ProductDAO {
	
	static Connection con=null;
	public static ArrayList<ProductType> getProductTypeName(){
		ArrayList<ProductType> list=new ArrayList<ProductType>();
		con=(Connection) DBConnection.getConnection();
		ProductType pt=null;
		try {
			
			String sql="select product_name from producttype";
			Statement stmt=(Statement) con.createStatement();
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
            while(rs.next()){
            	pt=new ProductType();
			pt.setProductCategoryName(rs.getString("product_name"));
			list.add(pt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		}
	
	public static int getId(String ID){
		con=(Connection) DBConnection.getConnection();
		int id=0;
		
		try {
			String sql="select product_type_id where product_name='"+ID+"'";
			Statement stmt=(Statement) con.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
            	
			id=rs.getInt("product_type_id");
						}
			} catch (Exception e) {
		         e.printStackTrace();
		}
		return id;
		}
	
	public  static void Save(String porductName,int productPrice,String ProductionPlant,String storageLocation,String materialGroup,int weight,int unit,int producTypeId){
		con=(Connection) DBConnection.getConnection();
		try {
			 Statement stmt=(Statement) con.createStatement();
			 String sql="insert into product(product_name,product_price,production_plant,stroage_location,material_group,unit,weight,product_type_id)VALUES('"+porductName+"','"+productPrice+"','"+ProductionPlant+"','"+storageLocation+"','"+materialGroup+"','"+unit+"','"+weight+"','"+producTypeId+"')";
			 System.out.println(sql);
			 stmt.executeUpdate(sql);
			 
}
		catch(Exception e){
			e.printStackTrace();
		}
	
	}
	}
