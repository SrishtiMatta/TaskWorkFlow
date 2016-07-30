package com.TaskWorkFlow.Controller;

import com.TaskWorkFlow.Domain.User;
import com.TaskWorkFlow.Service.SendMail;
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



public class AssignTaskServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(AssignTaskServlet.class);
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		logger.info("Inside assign task servlet");
		Connection con;
		PreparedStatement ps;
		PrintWriter out = response.getWriter();
	
		response.setContentType("text/html");
		
	
		String Taskid = request.getParameter("TaskID");
		String TaskName=request.getParameter("TaskName");
		String UId=request.getParameter("UserId");     // id of the user who has entered the task
	
		HttpSession session = request.getSession();
		User user =(User) session.getAttribute("USER_DETAILS");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root"); // Path of database, username, password for sql
			
			ps=con.prepareStatement("Update Tasks set DeveloperId=? , Status=? where TaskId=?");
			ps.setString(1, user.getEmployeeId());
			ps.setString(2, "In Progress");
			ps.setString(3, Taskid);
				
			ps.executeUpdate();
			logger.info("Task successfully assigned to devloper");
			
				
			PreparedStatement p = con.prepareStatement("select FirstName , EmailId from user where EmployeeId=?");
			p.setString(1, UId);
			ResultSet rs= p.executeQuery();
			if(!rs.next()){
				logger.info("Could not send mail to user");
				logger.info("Redirected to developer new task list page");
				 out.println("<script type=\"text/javascript\">");        // creating alert message using java
				 out.println("alert('Sorry we could not send a mail to the User');");
				 out.println("location='DeveloperNewTasks.jsp';");
				 out.println("</script>");
			}
			
			SendMail.sendMail(rs.getString(2), rs.getString(1), "Your task with Task ID-" + Taskid + ", Task Name-" + TaskName + " has been taken up by the develper with Devloper Id-" + user.getEmployeeId() + ", Name-" + user.getFirstName() + " " + user.getLastName());
			logger.info("Mail sent to user");
			
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("location='DeveloperNewTasks.jsp';");
			out.println("</script>");
			
		}
		catch(Exception e){
			System.out.println(e);
			logger.error(e);
		
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			 out.println("alert('Some Unexpected Error has occured');");
			 out.println("location='DeveloperNewTasks.jsp';");
			 out.println("</script>");
		}
	
	
	}
}