package com.TaskWorkFlow.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.TaskWorkFlow.Service.SendMail;

public class DeleteUserServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	final static Logger logger= Logger.getLogger(DeleteUserServlet.class);
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		logger.info("Inside delete user servlet");
		PrintWriter out = response.getWriter();
		PreparedStatement ps , pt ,pf;
		response.setContentType("text/html"); // type of response given by the server
		String id = request.getParameter("UserId");
			
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root");
				
			pf=con.prepareStatement("select FirstName , EmailId from user where EmployeeID=?");
			pf.setString(1,id);
				
			ResultSet rs= pf.executeQuery();
			rs.next();
			String to = rs.getString(2);
			String name=rs.getString(1);
			
			PreparedStatement e =con.prepareStatement("select Status , TaskName , TaskId ,DeveloperId , TesterId from tasks where UserId= ?");
			e.setString(1, id);
			ResultSet m = e.executeQuery();
			while(m.next()){
				if(m.getString(1).equals("In Progress")){
					PreparedStatement d = con.prepareStatement("Select FirstName , EmailId from user where EmployeeId= ?");
					d.setString(1, m.getString(4));
					ResultSet a=d.executeQuery();
					SendMail.sendMail(a.getString(2), a.getString(1), "The task with TaskID-" + m.getString(3) + " and Name-" + m.getString(2) + " that had been assigned to you has been deleted by the admin as the account of user who had entered this tasks has been deleted");
					
				}
				else if(m.getString(1).equals("Under Testing")){
					PreparedStatement d = con.prepareStatement("Select FirstName , EmailId from user where EmployeeId= ?");
					d.setString(1, m.getString(5));
					ResultSet a=d.executeQuery();
					SendMail.sendMail(a.getString(2), a.getString(1), "The task with TaskID-" + m.getString(3) + " and Name-" + m.getString(2) + " that had been assigned to you for testing has been deleted by the admin as the account of user who had entered this tasks has been deleted");
					
				}
				
				
			}
				
			pt=con.prepareStatement("Delete from tasks where UserId = ?");
			pt.setString(1, id);
			pt.executeUpdate();
			
			logger.info("All tasks of the user deleted");
			
			ps = con.prepareStatement("Delete from user where EmployeeId=?");
			ps.setString(1, id);
			ps.executeUpdate();
			
			logger.info("User deleted successfully");
			SendMail.sendMail(to, name, "Your account has been deleted by the admin. Please contact admin for any queries.");
			logger.info("Mail sent to the user");
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("alert('User and its tasks deleted successfully');");
			out.println("location='UserList.jsp';");
			out.println("</script>");

		}
		catch(Exception e){
			logger.error(e);
			System.out.println(e);
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("alert('Some unexpected error has occured');");
			out.println("location='UserList';");
			out.println("</script>");
		}	
	}
}
