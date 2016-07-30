package com.TaskWorkFlow.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.TaskWorkFlow.Domain.Task;
import com.TaskWorkFlow.Domain.User;

public class CompleteTasksServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(CompleteTasksServlet.class);
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		logger.info("Inside Complete tasks Servlet.");
		Connection con;
		PreparedStatement ps;
		PrintWriter out = response.getWriter();
		ArrayList<Task> tasks= new ArrayList<>();
		response.setContentType("text/html");
		
		HttpSession session = request.getSession();
		User user =(User) session.getAttribute("USER_DETAILS");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root"); // Path of database, username, password for sql
			
			ps=con.prepareStatement("Select * from Tasks where UserId= ?  && Status=?");
			ps.setString(1, user.getEmployeeId());
			ps.setString(2, "Tested");
				
			ResultSet rs = ps.executeQuery();
//			if(!rs.next()){
//				logger.info("Developer has no completd tasks");	
//				out.println("<script type=\"text/javascript\">");        // creating alert message using java
//				out.println("alert('You have no Completed Tasks');");
//				out.println("location='home.jsp';");
//				out.println("</script>");
//			}
//			else{
	
			
			while(rs.next()) {   
					Task tk= new Task(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getDate(6) , rs.getString(7), rs.getString(8), rs.getInt(9), rs.getString(10) , rs.getString(11), rs.getString(12), rs.getString(13), rs.getString(14));
					tasks.add(tk);
			}
					
					HttpSession s =request.getSession();
					s.setAttribute("TASKS", tasks);
					logger.info("List of completed tasks made successfully");
			//		System.out.println(tasks.size());
					out.println("<script type=\"text/javascript\">");        // creating alert message using java
			//		out.println("alert('List Made');");
					out.println("location='CompleteTasks.jsp';");
					out.println("</script>");
	//		}
		
		}
		catch(Exception e){
			System.out.println(e);
			logger.error(e);
			logger.info("Redirected to home page");
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("alert('Some Unexpected Error has occured');");
			out.println("location='home.jsp';");
			out.println("</script>");
		}
	}
}
