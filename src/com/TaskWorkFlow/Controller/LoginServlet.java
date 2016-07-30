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

public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	final static Logger logger = Logger.getLogger(LoginServlet.class);
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		PrintWriter out = response.getWriter();
		out.println("<script type=\"text/javascript\">");        // creating alert message using java
		out.println("location='UserLogin.jsp';");
		out.println("</script>");
	
	}
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		logger.info("Inside login servlet");
		Connection con;
		response.setContentType("text/html");     // type of response given by the server
		
		
	// earlier we used to send name of the html tag as parameter	
//		String Uname = request.getParameter("UserName");
//		String Password = request.getParameter("Password");
		
		
// now since we are using ajax now data passed in ajax will be use to get parameter
		String Uname = request.getParameter("username");
		String Password = request.getParameter("password");
		PrintWriter out = response.getWriter();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root"); // Path of database, username, password for sql
			try {
				PreparedStatement ps = con.prepareStatement("Select * from User where UserName like binary ?  && Password like binary ?");
					                                    // use like binary instead of equal to as it is case sensitive 
				ps.setString(1, Uname);                   
				ps.setString(2,Password);
				ResultSet rs=ps.executeQuery();
				if(!rs.next()){           // initially rs out of table rs.next takes it to fist row and with each rs.next rows are iterated
					logger.info("Invalid Username or password")	;
					throw new NullPointerException();
				}
			// r.getString(Index) refers to columns of each row
				System.out.println(rs.getString(9));
					
				User UserDetails = new User(rs.getString(1), rs.getString(2),  rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11));
				
				logger.info("You have successfully logged in");
		//		out.print("You have successfully logged in");
				
				
				
					
		
				
				if(Uname.equals("admin")){
					
					out.println("Admin Log in");
					
						logger.info("Admin log in");
						logger.info("redirected to admin home page");
						
						request.setAttribute("NAME", Uname);
						HttpSession session = request.getSession();
						session.setAttribute("USER_DETAILS", UserDetails);
						
// now since ajax used no need to use request dispatcher as control will go from servlet to jsp and 
// then it will go to next required page. so request dispatcher used in jsp page

//						RequestDispatcher requestDispatcher;             
//						requestDispatcher = request.getRequestDispatcher("Admin.jsp");
//						requestDispatcher.forward(request, response);
				}
				else{
						if(rs.getString(9).contentEquals("Inactive")){
//							System.out.println("assdffgtghuj");
//							out.println("<script type=\"text/javascript\">");        // creating alert message using java
//							out.println("alert('Your account is inactive right now. To activate your account contact admin');");
//							out.println("location='UserLogin.jsp';");
//							out.println("</script>");
							
							logger.info("Inactive account");
							logger.info("Redirected to login page");
							request.setAttribute("INACTIVE", "INACTIVE");
							
							out.println("Inactive account");
							
//							RequestDispatcher requestDispatcher;             
//							requestDispatcher = request.getRequestDispatcher("UserLogin.jsp");
//							requestDispatcher.forward(request, response);
						}
						else{
						request.setAttribute("NAME", Uname);
						HttpSession session = request.getSession();
						session.setAttribute("USER_DETAILS", UserDetails);
						logger.info("Redirected to user home page");
						out.println("User Log in");
	//					RequestDispatcher requestDispatcher;             
	//					requestDispatcher = request.getRequestDispatcher("home.jsp");
	//					requestDispatcher.forward(request, response);
					}
				}
			}
			catch (Exception e2) {
					System.out.println(e2);
					out.println("Invalid User Name or Password");
					logger.error(e2);
					logger.info("Redirected to login page");
				//	System.out.println("Incorrect userName or password");
//					out.println("<script type=\"text/javascript\">");        // creating alert message using java
//					out.println("alert('User Name or password incorrect');");
//					out.println("location='UserLogin.jsp';");
//					out.println("</script>");
	
	//				RequestDispatcher requestDispatcher;                               // so that control remains on  same page even after pressing the submit page
	//				requestDispatcher = request.getRequestDispatcher("UserLogin.jsp");
	//				requestDispatcher.forward(request, response);
			}  
			finally{
				con.close();
			}
		}
		catch (Exception e) {
		//	System.out.println("Empty fields not allowed");
			System.out.println(e);
			logger.error(e);
			out.println(e);
		 // will be accessed using jsp to give message
//			RequestDispatcher requestDispatcher;             
//			requestDispatcher = request.getRequestDispatcher("UserLogin.jsp");
//			requestDispatcher.forward(request, response);
		}
	}
}