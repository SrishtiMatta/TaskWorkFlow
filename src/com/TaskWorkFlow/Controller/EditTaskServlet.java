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
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.TaskWorkFlow.Domain.Task;


public class EditTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(EditTaskServlet.class);
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("Inside Edit task servlet");
		Connection con;
		PreparedStatement ps;
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String TId =request.getParameter("TaskID");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root"); // Path of database, username, password for sql
			ps=con.prepareStatement("Select * from Tasks where TaskID=?");
			ps.setString(1, TId);
				
			ResultSet rs = ps.executeQuery();
			rs.next();
			Task task= new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getDate(6) , rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10) , rs.getString(11) , rs.getString(12) , rs.getString(13) , rs.getString(14));
			HttpSession s =request.getSession();
			s.setAttribute("EDIT", task);
			
			
			
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
		//	out.println("alert('List Made');");
			out.println("location='EditTask.jsp';");
			out.println("</script>");
		}
		catch(Exception e){
			logger.error(e);
			System.out.println(e);
			 out.println("<script type=\"text/javascript\">");        // creating alert message using java
		//	 out.println("alert('Some Unexpected Error has occured');");
			 out.println("location='EditTask.jsp';");
			 out.println("</script>");
		}
	}
}
