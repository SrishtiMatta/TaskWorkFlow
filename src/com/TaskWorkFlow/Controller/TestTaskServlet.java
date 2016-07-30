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

public class TestTaskServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	final static Logger logger=Logger.getLogger(TestTaskServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		logger.info("Inside test task servlet");
		Connection con;
		PreparedStatement ps;
		PrintWriter out = response.getWriter();
	
		response.setContentType("text/html");
		
		String Taskid = request.getParameter("TaskID");
		String TaskName=request.getParameter("TaskName");
		String UId=request.getParameter("UserId");
	
		HttpSession session = request.getSession();
		User user =(User) session.getAttribute("USER_DETAILS");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root"); // Path of database, username, password for sql
			
			ps=con.prepareStatement("Update Tasks set TesterId=? , Status=? where TaskId=?");
			ps.setString(1, user.getEmployeeId());
			ps.setString(2, "Under Testing");
			ps.setString(3, Taskid);
				
			ps.executeUpdate();
			
			logger.info("Task assigned to tester");
			logger.info("Redirected to tester new tasks list");
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("location='TesterNewTasks.jsp';");
			out.println("</script>");
			
			PreparedStatement p = con.prepareStatement("select FirstName , EmailId from user where EmployeeId=?");
			p.setString(1, UId);
			ResultSet rs= p.executeQuery();
			if(!rs.next()){
				logger.info("Mail not sent");
				 out.println("<script type=\"text/javascript\">");        // creating alert message using java
				 out.println("alert('Sorry we could not send a mail to the User');");
				 out.println("location='TesterNewTasks.jsp';");
				 out.println("</script>");
			}
			
			SendMail.sendMail(rs.getString(2), rs.getString(1), "Your task with Task ID-" + Taskid + ", Task Name-" + TaskName + " has been taken up by the Tester with Tester Id-" + user.getEmployeeId() + ", Name-" + user.getFirstName() + " " + user.getLastName());
			logger.info("Mail sent");
		
		}
		catch(Exception e){
			logger.error(e);
			System.out.println(e);
			 out.println("<script type=\"text/javascript\">");        // creating alert message using java
			   out.println("alert('Some Unexpected Error has occured');");
			   out.println("location='TesterNewTasks.jsp';");
			   out.println("</script>");
		}
	}

}
