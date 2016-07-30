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

import org.apache.log4j.Logger;

import com.TaskWorkFlow.Service.SendMail;

public class DeleteTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(DeleteTaskServlet.class); 
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		logger.info("Inside delete task servlet");
		PrintWriter out = response.getWriter();

		PreparedStatement ps;
		response.setContentType("text/html"); // type of response given by the server
		String id = request.getParameter("TaskID");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root");

			ps = con.prepareStatement("Delete from Tasks where TaskId=?");
			ps.setString(1, id);
			int i = ps.executeUpdate();
			
	//		SendMail.sendMail(receiverMail, ReceiverName, msg);
			
			
			logger.info("Task deleted successfully");
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("alert('Task deleted successfully');");
			out.println("location='CurrentTask';");
			out.println("</script>");

		}
		catch(Exception e){
			System.out.println(e);
			logger.error(e);
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("alert('some unexpected error occured');");
			out.println("location='CurrentTask';");
			out.println("</script>");	
		}
	}
}
