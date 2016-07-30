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

import com.TaskWorkFlow.Domain.User;

public class UpdatePasswordServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	final static Logger logger=Logger.getLogger(UpdatePasswordServlet.class);

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		logger.info("Inside update password servlet");
		PreparedStatement ps;
		response.setContentType("text/html"); // type of response given by the server
		HttpSession session = request.getSession();
		User user =(User) session.getAttribute("USER_DETAILS");
		String Password =request.getParameter("NewPass");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root");
			ps = con.prepareStatement("Update User set Password=? where EmployeeId=?");
			ps.setString(1, Password);
			ps.setString(2, user.getEmployeeId());
			int i = ps.executeUpdate();
//			logger.info("Password updated successfully");
//			out.println("<script type=\"text/javascript\">");        // creating alert message using java
//			out.println("alert('Password Changed successfully');");
//			out.println("location='home.jsp';");
//			out.println("</script>");
			
			if(user.getUserName().equals("admin")){
				out.println("admin");
			}
			else{
				out.println("user");
			}

		}
		catch(Exception e){
			System.out.println(e);
			logger.error(e);
//			out.println("<script type=\"text/javascript\">");        // creating alert message using java
//			out.println("alert('Some unexpected error occured. Please try again later');");
//			out.println("location='home.jsp';");
//			out.println("</script>");
			
			if(user.getUserName().equals("admin")){
				out.println("admine");
			}
			else{
				out.println("usere");
			}
			
				
		}
	}
}
