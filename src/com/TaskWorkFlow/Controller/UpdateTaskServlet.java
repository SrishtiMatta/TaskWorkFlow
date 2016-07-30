package com.TaskWorkFlow.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.TaskWorkFlow.Domain.Task;

public class UpdateTaskServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(UpdateTaskServlet.class);
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		logger.info("Inside update task servlet");
		HttpSession session = request.getSession();
		Task task =(Task) session.getAttribute("EDIT");
		
		PreparedStatement ps;
		response.setContentType("text/html"); // type of response given by the server
		String id = request.getParameter("TId");
		
		String TDesc = request.getParameter("TaskDescription");
		String EDate = request.getParameter("ExpectedDate");
		String Ftp = request.getParameter("FTPLocation");
		String Quantity = request.getParameter("Quantity");
		String Priority= request.getParameter("Priority");
		
		
		System.out.println(task.getPriority());
		
		if(Priority.equals("Select")){
			Priority=task.getPriority();
			System.out.println(Priority);
		}
		
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root");
	
			ps = con.prepareStatement(
					"Update Tasks set TaskDescription=? , ExpectedDate=?,  FTPLocation=? , Quantity=? , Priority= ? where TaskId=?");
			
			ps.setString(1, TDesc);
			ps.setString(2, EDate);
			ps.setString(3, Ftp);
			ps.setString(4, Quantity);
			ps.setString(5, Priority);
			ps.setString(6, id);
			
			int i = ps.executeUpdate();
			logger.info("Task edited successfully");
			
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("alert('Task edited successfully');");
			out.println("location='CurrentTask';");
			out.println("</script>");

		}
		catch(Exception e){
			logger.error(e);
			System.out.println(e);
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("alert('Some unexpected error occured');");
			out.println("location='CurrentTask';");
			out.println("</script>");
			
		}
	}
}
