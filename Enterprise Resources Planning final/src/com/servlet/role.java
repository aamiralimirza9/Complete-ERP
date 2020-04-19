package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DBManager;

/**
 * Servlet implementation class role
 */
@WebServlet("/role")
public class role extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public role() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String master=request.getParameter("a");
		String menu=request.getParameter("b");
		String report=request.getParameter("c");
		String permit=request.getParameter("d");
		int a=0,b = 0,c=0;
		if(master!=null && menu==null && report==null ){
		a=DBManager.getPermissionid(master);
		DBManager.addrole(a,permit);
	}
		if(menu!=null && master==null && report==null){
			a=DBManager.getPermissionid(menu);
			DBManager.addrole(a,permit);
	
	}
		if(report!=null  && menu==null && master==null){
			a=DBManager.getPermissionid(menu);
			DBManager.addrole(a,permit);
	}
		if(menu!=null && master!=null && report==null ){
			a=DBManager.getPermissionid(menu);
			b=DBManager.getPermissionid(master);
			DBManager.addrole1(a,b,permit);
			
	
	}
		
		if(menu!=null && report!=null && master==null ){
			a=DBManager.getPermissionid(menu);
			b=DBManager.getPermissionid(report);
			DBManager.addrole1(a,b,permit);
			
	
	}
		if(master!=null && report!=null && menu==null ){
			a=DBManager.getPermissionid(master);
			b=DBManager.getPermissionid(report);
			DBManager.addrole1(a,b,permit);
			
	
	}
		if(menu!=null && report!=null && master!=null ){
			a=DBManager.getPermissionid(menu);
			b=DBManager.getPermissionid(report);
			c=DBManager.getPermissionid(master);
			DBManager.addrole2(a,b,c,permit);
			
	}	

}
}