package com.TaskWorkFlow.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;


public class CheckUserNameServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(CheckUserNameServlet.class);

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("Inside check user name Servlet");
		PreparedStatement ps;
		response.setContentType("text/html");     // type of response given by the server
		
		String UName = request.getParameter("userName");
		PrintWriter out= response.getWriter();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root"); // Path of database, username, password for sql
																													
			ps=con.prepareStatement("Select UserName from USER where UserName=?");
			ps.setString(1, UName);
						
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				logger.info("User Name already exists");
				out.println("UserName already exists");
			}
			else{
				out.println("Success");
			}
		}		
		catch (Exception e2) {
			logger.error(e2);
			System.out.println(e2);
			out.println(e2);
					
		
		}
	
	}	
	
}
