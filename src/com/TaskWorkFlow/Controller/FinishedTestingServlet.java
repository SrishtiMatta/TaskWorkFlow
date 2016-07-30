package com.TaskWorkFlow.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.TaskWorkFlow.Domain.User;
import com.TaskWorkFlow.Service.SendMail;

public class FinishedTestingServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(FinishedTestingServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		logger.info("Inside Finished Testing servlet");
		Connection con;
		PreparedStatement ps;
		PrintWriter out = response.getWriter();

		response.setContentType("text/html");
		
		String Taskid = request.getParameter("TaskID");
		String TaskName=request.getParameter("TaskName");
		String UId= request.getParameter("UserId");
		
		HttpSession session = request.getSession();
		User user =(User) session.getAttribute("USER_DETAILS");
		
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root"); // Path of database, username, password for sql
			
			Calendar cal = Calendar.getInstance();
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			
			ps=con.prepareStatement("Update Tasks set Status=?  , CompletedDate= ? where TaskId=?");
			ps.setString(1, "Tested");
			ps.setString(2, dateFormat.format(cal.getTime()));
			ps.setString(3, Taskid);
				
			ps.executeUpdate();
			
			logger.info("Task status updated");
			
			PreparedStatement p =con.prepareStatement("Select FirstName , EmailId from user where EmployeeId=?");
			p.setString(1, UId);
			ResultSet rs= p.executeQuery();
			
			if(!rs.next()){
				logger.info("Mail couldnt be sent");
				 out.println("<script type=\"text/javascript\">");        // creating alert message using java
				 out.println("alert('Sorry we could not send a mail to the user');");
				 out.println("location='TesterInProgress.jsp';");
				 out.println("</script>");
			}
			
			SendMail.sendMail( rs.getString(2), rs.getString(1), "Your task with Task ID-" + Taskid + ", Task Name-" + TaskName + " has been tested by the Tester with Id-" + user.getEmployeeId() + ", Name-" + user.getFirstName() + " " + user.getLastName() + "." );
			logger.info("Mail sent successfully");
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("location='TesterInProgress.jsp';");
			out.println("</script>");
			
		}
		catch(Exception e){
			 System.out.println(e);
			 logger.error(e);
			 out.println("<script type=\"text/javascript\">");        // creating alert message using java
			 out.println("alert('Some Unexpected Error has occured');");
			 out.println("location='TesterInProgress.jsp';");
			 out.println("</script>");
		}
	
	}
}
