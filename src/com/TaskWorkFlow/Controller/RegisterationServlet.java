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
import com.mysql.jdbc.MysqlDataTruncation;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

public class RegisterationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L; // internally id maintained for class
	final static Logger logger = Logger.getLogger(RegisterationServlet.class);

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("Inside Registeration Servlet");
		PreparedStatement ps;
		response.setContentType("text/html");     // type of response given by the server
		
		String Eid = request.getParameter("employeeId");
		String Fname = request.getParameter("fName");      // names given as data parameter of ajax call
		String Lname = request.getParameter("lName");
		String Contact = request.getParameter("contactNo");
		String email = request.getParameter("emailID");
		String Dept = request.getParameter("dept");
		String Post = request.getParameter("post");
		String UName = request.getParameter("userName");
		String Pass = request.getParameter("pass");
		String Role = request.getParameter("role");
		PrintWriter out= response.getWriter();
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root"); // Path of database, username, password for sql
																													
			try {
				
					ps=con.prepareStatement("Select UserName from USER where UserName=?");
					ps.setString(1, UName);
						
					ResultSet rs = ps.executeQuery();
					if(rs.next()){
						logger.info("User Name already exists");
						out.println("UserName already exists");
					}
					else{		
						ps = con.prepareStatement("insert into USER values(?,?,?,?,?,?,?,?,?,?,?)"); // user is the table name no of ?= no of columns
																													
						ps.setString(1, Eid); // 0,1,2,3 ddepicts the serial order of question marks in table. All question markks are in 1 to 1 corrospondence with colimn names
						ps.setString(2, Fname);
						ps.setString(3, Lname);
						ps.setString(4, Contact);
						ps.setString(5, email);
						ps.setString(6, Dept);
						ps.setString(7, Post);
						ps.setString(8, Role);
						ps.setString(9, "Inactive");
						ps.setString(10, UName);
						ps.setString(11, Pass);
						
						int i = ps.executeUpdate();
						if (i > 0) {
							logger.info("User registered successfully");
							
							SendMail.sendMail(email, Fname, "You account with User Name " + UName + " has been created. But th account is inactive right now please contact admin for activating your account." );
							
							
					
						
							request.setAttribute("Registered", "Your account has been created please contact admin to activate your account.");
	//						RequestDispatcher requestDispatcher; 
	//						requestDispatcher = request.getRequestDispatcher("UserLogin.jsp");
	//						requestDispatcher.forward(request, response);
							System.out.println("You are successfully registered...");
							
							out.println("Registeration Successful");
							
	//						System.out.println("values Enterd are" + Eid + Fname + Lname + Contact + email + Dept + Post + Role
	//								+ UName + Pass);
						}
					}
				}
				catch(MysqlDataTruncation e){
					logger.error(e);
					System.out.println(e);
//					out.println("<script type=\"text/javascript\">");        // creating alert message using java
//					out.println("alert('UserName " + UName + " aleady exists')");
//					out.println("location='Register.jsp';");               // all filled data deleted and new page opens because it is done after form is submitted and because there is error you are redirected to the forms page so all filled data deleted
//					out.println("</script>");	
					out.println("Invalid Employee Id");
				}
			
				catch (MySQLIntegrityConstraintViolationException e){
					System.out.println(e);
					logger.error(e);
					logger.info("Employee id already exists");
					
//					out.println("<script type=\"text/javascript\">");        // creating alert message using java
//					out.println("alert('Your ID " + Eid +" already Exists');");
//					out.println("location='UserLogin.jsp';");               // all filled data deleted and new page opens because it is done after form is submitted and because there is error you are redirected to the forms page so all filled data deleted
//					out.println("</script>");
					
					out.println("Employee id already exists");
				}
			
				catch (Exception e2) {
					logger.error(e2);
					System.out.println(e2);
					out.println(e2);
					
//					out.println("<script type=\"text/javascript\">"); 
//					out.println("alert('Some unexpected error has occured');");
//					out.println("location='UserLogin.jsp';");               // all filled data deleted and new page opens because it is done after form is submitted and because there is error you are redirected to the forms page so all filled data deleted
//					out.println("</script>");
				}
				finally {
					con.close();
				}
		}
	
		catch (Exception e) {
			logger.error(e);
			logger.info("Some unexpected error occured");
			//System.out.println("Empty fields not allowed");
			System.out.println(e);
			out.println(e);
		}
	}

	
}