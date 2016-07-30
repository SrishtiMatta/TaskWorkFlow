package com.TaskWorkFlow.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.TaskWorkFlow.Domain.User;

public class TaskServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	final static Logger logger=Logger.getLogger(TaskServlet.class);

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("Inside Task Servlet");
		PrintWriter out = response.getWriter();

		PreparedStatement ps;
		response.setContentType("text/html"); // type of response given by the server
		String TName = request.getParameter("TaskName"); // give the name of element mentioned in form
		String TDesc = request.getParameter("TaskDesc");
		String EDate = request.getParameter("EDate");
		String Ftp = request.getParameter("Ftp");
		String Quantity = request.getParameter("Quantity");
		String TRole = request.getParameter("TargetRole");
		String Priority=request.getParameter("Priority");
		
		
		//System.out.println(EDate);

		try {
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("USER_DETAILS");
			Calendar cal = Calendar.getInstance();
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			
//			if(EDate.compareTo(dateFormat.format(cal.getTime()))<0){
//				System.out.println(EDate.compareTo(dateFormat.format(cal.getTime())));
//				out.println("Expected date is before current date");
//				
//			}
//			else{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/WorkFlow", "root", "root");
		
					ps = con.prepareStatement("insert  into Tasks(TaskName , TaskDescription , UserId , CreatedDate, ExpectedDate, Status, FTPLocation , Quantity ,TargetRole , Priority  ) values(?,?,?,?,?,?,?,?,?,?)");
					ps.setString(1, TName);
					ps.setString(2, TDesc);
					ps.setString(3, user.getEmployeeId());
					ps.setString(4, dateFormat.format(cal.getTime()));
					ps.setString(5, EDate);
					ps.setString(6, "Submitted");
					ps.setString(7, Ftp);
					ps.setString(8, Quantity);
					ps.setString(9, TRole);
					ps.setString(10, Priority);
					int i = ps.executeUpdate();
					if (i > 0) {
						logger.info("Task registered successdfully");
		//				out.println("<script type=\"text/javascript\">");
		//				out.println("alert('Task Registered successfully.');");
		//				out.println("location='home.jsp';");
		//				out.println("</script>");
						
						out.println("Task registered successfully");
					}
		//	} 
		}
		catch (SQLException e) {
			logger.error(e);
			logger.info("Quantity should be integer");
			System.out.println(e);
//			out.println("<script type=\"text/javascript\">");
//			out.println("alert('Incorrect data type. Quantity should be of type INTEGER');");
//			out.println("location='EnterTask.jsp';");
//			out.println("</script>");
			
			out.println("Quantity should be of type Integer");
		} 
		catch (Exception e) {
			logger.error(e);
			System.out.println(e);
//			out.println("<script type=\"text/javascript\">");
//			out.println("alert('Some unexpected error occured. Please try again later');");
//			out.println("location='home.jsp';");
//			out.println("</script>");
			out.println("Some unexpected error has occured");
		}
	}
}

	