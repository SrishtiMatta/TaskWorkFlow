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

public class UpdateProfileServlet extends HttpServlet {


	private static final long serialVersionUID = 1L;
	final static Logger logger= Logger.getLogger(UpdateProfileServlet.class);
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		logger.info("Inside update profile servlet");
		PreparedStatement ps;
		response.setContentType("text/html"); // type of response given by the server
		
		HttpSession session = request.getSession();
		User user =(User) session.getAttribute("USER_DETAILS");
		
		String Fname = request.getParameter("FirstName");
		String Lname= request.getParameter("LastName");
		String ContactNo=request.getParameter("ContactNo");
		String EmailId = request.getParameter("EmailId");
		String Department = request.getParameter("Department");
		String Post = request.getParameter("Post");
		String UName = request.getParameter("UserName");
		String Role = request.getParameter("Role");
		
		if(Fname==null || Fname==""){
			Fname=user.getFirstName();
		
		}
		if(ContactNo==null || ContactNo==""){
			ContactNo=user.getContactNo();
		}

		if(EmailId==null || EmailId==""){
			EmailId=user.getEmailId();
		}
		if(Department==null || Department==""){
			Department=user.getDepartment();
		}
		if(Post==null || Post==""){
			Post=user.getPost();
		}
		if(UName==null || UName==""){
			UName=user.getUserName();
		}
		
		if(Role.equals("Select")){
			Role=user.getRole();
		}

		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root");

			ps = con.prepareStatement(
					"Update User set FirstName=? , LastName=?,  ContactNo=? , EmailId=? , Department=? , Post=?, Role=? , Active=? , UserName=? where EmployeeID=?");
			
			ps.setString(1, Fname);
			ps.setString(2, Lname);
			ps.setString(3, ContactNo);
			ps.setString(4, EmailId);
			ps.setString(5, Department);
			ps.setString(6, Post);
			ps.setString(7, Role);
			ps.setString(8, "Active");
			ps.setString(9, UName);
			ps.setString(10, user.getEmployeeId());


			int i = ps.executeUpdate();
			
			PreparedStatement p = con.prepareStatement("select * from user where EmployeeId=?");
			p.setString(1, user.getEmployeeId());
			
			ResultSet rs = p.executeQuery();
			
			if(!rs.next()){
				logger.info("User not found");
				throw new Exception();
			}
			
			User UserDetails = new User(rs.getString(1), rs.getString(2),  rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11));
			
			session.setAttribute("USER_DETAILS", UserDetails);
			if(UserDetails.getUserName().equals("admin")){
				out.println("<script type=\"text/javascript\">");        // creating alert message using java
				out.println("alert('Profile Edited Successfully');");
				out.println("location='Admin.jsp';");
				out.println("</script>");
			}
			else{
				logger.info("Profile edited successfully");
				out.println("<script type=\"text/javascript\">");        // creating alert message using java
				out.println("alert('Profile Edited Successfully');");
				out.println("location='Profile.jsp';");
				out.println("</script>");
			}
		}
		catch(Exception e){
			System.out.println(e);
			logger.error(e);
//			out.println("<script type=\"text/javascript\">");        // creating alert message using java
//			out.println("alert('Some unexpected error occured. Please try again later');");
//			out.println("location='Profile.jsp';");
//			out.println("</script>");
			
			if(user.getUserName().equals("admin")){
				out.println("<script type=\"text/javascript\">");        // creating alert message using java
				out.println("alert('Some unexpected error occured. Please try again later');");
				out.println("location='Admin.jsp';");
				out.println("</script>");
			}
			else{
				logger.info("Profile edited successfully");
				out.println("<script type=\"text/javascript\">");        // creating alert message using java
				out.println("alert('Some unexpected error occured. Please try again later');");
				out.println("location='Profile.jsp';");
				out.println("</script>");
			}
		}
	}
}
