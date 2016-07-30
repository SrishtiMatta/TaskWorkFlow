package com.TaskWorkFlow.Domain;

public class User {
	private String EmployeeId;
	private String FirstName;
	private String LastName;
	private String ContactNo;
	private String EmailId;
	private String Department;
	private String Post;
	private String Role;
	private String Active;
	private String UserName;
	private String Password;
	
	public User(String EmployeeId, String FirstName, String LastName, String ContactNo ,String EmailId ,String Department ,String Post ,String Role ,String Active ,String UserName, String Password)
	{	this.EmployeeId=EmployeeId;
		this.FirstName=FirstName;
		this.LastName=LastName;
		this.ContactNo=ContactNo;
		this.EmailId=EmailId;
		this.Department=Department;
		this.Post=Post;
		this.Role=Role;
		this.Active=Active;
		this.UserName=UserName;
		this.Password=Password;
	}
	
	public String getEmployeeId() {
		return EmployeeId;
	}
	public void setEmployeeId(String employeeId) {
		EmployeeId = employeeId;
	}
	public String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public String getContactNo() {
		return ContactNo;
	}
	public void setContactNo(String contactNo) {
		ContactNo = contactNo;
	}
	public String getEmailId() {
		return EmailId;
	}
	public void setEmailId(String emailId) {
		EmailId = emailId;
	}
	public String getDepartment() {
		return Department;
	}
	public void setDepartment(String department) {
		Department = department;
	}
	public String getPost() {
		return Post;
	}
	public void setPost(String post) {
		Post = post;
	}
	public String getRole() {
		return Role;
	}
	public void setRole(String role) {
		Role = role;
	}
	public String getActive() {
		return Active;
	}
	public void setActive(String active) {
		Active = active;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
}
