package com.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.model.Channel;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;


public class RouteDAO {
	
	static Connection con=null;
	public static ArrayList<Channel> getRoute(){
		ArrayList<Channel> list=new ArrayList<Channel>();
		con=(Connection) DBConnection.getConnection();
		Channel channel=null;
		try {
			
			String sql="select route from channel";
			Statement stmt=(Statement) con.createStatement();
			System.out.println(sql);
			ResultSet rs=stmt.executeQuery(sql);
            while(rs.next()){
            	channel=new Channel();
			channel.setRoute(rs.getString("route"));
			list.add(channel);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
		}
	public static int getChannelId(String route){
		con=(Connection) DBConnection.getConnection();
		int id=0;
		
		try {
			String sql="select channel_id from channel where route='"+route+"'";
			Statement stmt=(Statement) con.createStatement();
			ResultSet rs=stmt.executeQuery(sql);
			while(rs.next()){
            	
			id=rs.getInt("channel_id");
						}
			} catch (Exception e) {
		         e.printStackTrace();
		}
		return id;
		}
	
	public  static void Save(String description,int channelId,String from1,String to1){
		con=(Connection) DBConnection.getConnection();
		try {
			 Statement stmt=(Statement) con.createStatement();
			 String sql="INSERT INTO route(description,channel_id,routefrom,toRoute)VALUES('"+description+"','"+channelId+"','"+from1+"','"+to1+"')";
			 System.out.println(sql);
			 stmt.executeUpdate(sql);
			 
}
		catch(Exception e){
			e.printStackTrace();
		}
	
	}

}
