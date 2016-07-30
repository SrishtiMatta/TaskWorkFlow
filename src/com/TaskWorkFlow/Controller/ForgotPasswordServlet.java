package com.TaskWorkFlow.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.TaskWorkFlow.Service.SendMail;

public class ForgotPasswordServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	final static Logger logger  = Logger.getLogger(ForgotPasswordServlet.class);
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con;
		logger.info("Inside forgot Password servlet");
		response.setContentType("text/html");
		String UserName=request.getParameter("username");
		PrintWriter out = response.getWriter();
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root"); // Path of database, username, password for sql
			PreparedStatement ps = con.prepareStatement("Select FirstName ,EmailId , Password from User where UserName like binary ? ");
					                                    // use like binary instead of equal to as it is case sensitive 
			ps.setString(1, UserName);                   
			ResultSet rs=ps.executeQuery();
			if(!rs.next()){           // initially rs out of table rs.next takes it to fist row and with each rs.next rows are iterated
				logger.info("Invalid user name");
//				request.setAttribute("IncorrectName", "Please enter a valid user Name");
//				RequestDispatcher requestDispatcher;             
//				requestDispatcher = request.getRequestDispatcher("ForgotPassword.jsp");
//				requestDispatcher.forward(request, response);
				out.println("Incorrect User Name");
			}
			out.println("Success");
			logger.info("Mail sent");
			SendMail.sendMail(rs.getString(2), rs.getString(1), "Your Password is " + rs.getString(3) + ".");
//			request.setAttribute("MailSent", "Email has been sent to your Email Id.");
//			RequestDispatcher requestDispatcher;             
//			requestDispatcher = request.getRequestDispatcher("UserLogin.jsp");
//			requestDispatcher.forward(request, response);
			out.println("Success");
		}
		catch (Exception e2) {
			logger.error(e2);
			System.out.println(e2);
//			out.println("<script type=\"text/javascript\">");        // creating alert message using java
//			out.println("alert('Some unexpected error has occured.');");
//			out.println("location='UserLogin.jsp';");
//			out.println("</script>");
			
			out.println("Some unexpected error has occurred");
			
		}  
	}
}
