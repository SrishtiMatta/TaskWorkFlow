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

import com.TaskWorkFlow.Service.SendMail;

public class AdminDeleteTaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(AdminDeleteTaskServlet.class);
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		logger.info("Inside Admin delete task servlet");
		PreparedStatement ps, pu;
		response.setContentType("text/html"); // type of response given by the server
		
		
		String Taskid = request.getParameter("TaskID");
		String TaskName=request.getParameter("TaskName");
		String UserId = request.getParameter("UserId");
//		System.out.println(Taskid);
//		System.out.println(UserId);
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root");
		
			ps = con.prepareStatement("Delete from Tasks where TaskId=?");
			ps.setString(1, Taskid);
			logger.info("Task deleted");
			ps.executeUpdate();
			
			pu=con.prepareStatement("Select FirstName , EmailId from user where EmployeeId=?");
			pu.setString(1, UserId);
			
			ResultSet rs=pu.executeQuery();
			if(!rs.next()){
				logger.info("User whose task is deleted doesnot exist");
				throw new Exception();
			}
			
			
			SendMail.sendMail(rs.getString(2), rs.getString(1), "Your Task with Task Id " + Taskid + " and Task Name " + TaskName +" has been deleted by admin.");
			logger.info("Mail sent to user");
			logger.info("Redirected to TaskList page");
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("alert('Task deleted successfully');");
			out.println("location='TaskList.jsp';");
			out.println("</script>");

		}
		catch(Exception e){
			logger.error(e);
			System.out.println(e);
		}
	}

}
