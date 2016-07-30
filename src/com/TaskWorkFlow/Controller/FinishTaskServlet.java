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

import com.TaskWorkFlow.Domain.User;
import com.TaskWorkFlow.Service.SendMail;

public class FinishTaskServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(FinishTaskServlet.class);
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		logger.info("Inside finish task servlet");
		Connection con;
		PreparedStatement ps;
		PrintWriter out = response.getWriter();

		response.setContentType("text/html");
		
		String Taskid = request.getParameter("TaskID");
		String TaskName = request.getParameter("TaskName");
		String UId = request.getParameter("UserId");
		
		HttpSession session = request.getSession();
		User user =(User) session.getAttribute("USER_DETAILS");
		
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root"); // Path of database, username, password for sql
			
			ps=con.prepareStatement("Update Tasks set Status=? where TaskId=?");
			ps.setString(1, "Completed");
			ps.setString(2, Taskid);
				
			ps.executeUpdate();
			logger.info("Task status edited successfully");
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("location='DeveloperInProgress.jsp';");
			out.println("</script>");
			
			PreparedStatement p =con.prepareStatement("Select FirstName , EmailId from user where EmaployeeId=?");
			p.setString(1, UId);
			ResultSet rs= p.executeQuery();
			
			if(!rs.next()){
				logger.info("Mail couldnt be sent");
				 out.println("<script type=\"text/javascript\">");        // creating alert message using java
				 out.println("alert('Sorry we could not send a mail to the user');");
				 out.println("location='DeveloperInProgress.jsp';");
				 out.println("</script>");
			}
			
			SendMail.sendMail( rs.getString(2), rs.getString(1), "Your task with Task ID-" + Taskid + ", Task Name-" + TaskName + " has been completed by the Developer with Id-" + user.getEmployeeId() + ", Name-" + user.getFirstName() + " " + user.getLastName() + "." );
			logger.info("Msil sent");
			
		
		}
		catch(Exception e){
			logger.error(e);
			System.out.println(e);
			 out.println("<script type=\"text/javascript\">");        // creating alert message using java
			 out.println("alert('Some Unexpected Error has occured');");
			 out.println("location='DeveloperInProgress.jsp';");
			 out.println("</script>");
		}
	
	}
}
