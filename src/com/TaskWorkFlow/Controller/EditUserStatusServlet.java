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

public class EditUserStatusServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	final static Logger logger = Logger.getLogger(EditUserStatusServlet.class);
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		logger.info("Inside edit user status servlet");
		PreparedStatement ps ,p ,e;
		response.setContentType("text/html"); // type of response given by the server
		String id = request.getParameter("UserId");
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root");

			ps = con.prepareStatement("Select Active from user where EmployeeID = ?");
			ps.setString(1, id);
			
			ResultSet rs = ps.executeQuery();
//			if(!rs.next()){
//				throw new NullPointerException();
//			}
		
			rs.next();
			if(rs.getString(1).equals("Active")){
				p = con.prepareStatement("Update user set Active = ? where EmployeeID = ?");
				p.setString(1, "Inactive");
				p.setString(2, id);
			}
			else{
				p = con.prepareStatement("Update user set Active = ? where EmployeeID = ?");
				p.setString(1, "Active");
				p.setString(2, id);
			}
			
			p.executeUpdate();
			
			logger.info("User status edited");
			e=con.prepareStatement("select FirstName , EmailId , Active from user where EmployeeId=?");
			e.setString(1, id);
			ResultSet r=e.executeQuery();
			r.next();
			
			if(r.getString(3).equals("Active"))
				    SendMail.sendMail(r.getString(2), r.getString(1), "Your account has been activated by the admin.So you can now access your account.");
		    else
				    SendMail.sendMail(r.getString(2), r.getString(1), "Your account has been deacivated by the admin.So you can not access your account now.Please contact admin for more information.");
					   
			logger.info("Mail sent");	  
			
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
		//	out.println("alert('Status edited successfully');");
			out.println("location='UserList.jsp';");
			out.println("</script>");

			
		}	
		catch(Exception v){
			logger.error(v);	
			System.out.println(v);
			out.println("<script type=\"text/javascript\">");        // creating alert message using java
			out.println("alert('Some unexpected error has occcured');");
			out.println("location='UserList.jsp';");
			out.println("</script>");
		}    
	}
}
