package com.TaskWorkFlow.Domain;

import java.util.Date;

public class Task {
	private int TaskID;
	private String TaskName;
	private String TaskDescription;
	private String UserID;
	private Date CreatedDate;
	private Date ExpectedDate;
	private String Status;
	private String FtpLocation;
	private int Quantity;
	private String TargetRole;
	private String DeveloperId;
	private String Priority;
	private String TesterId;
	private String CompletedDate;
	
	public Task(int TaskID , String TaskName, String TaskDescription,  String UserID,  Date CreatedDate ,Date ExpectedDate ,String Status, String FtpLocation,int Quantity,String TargetRole ,String DeveloperId , String Priority , String TesterId , String CompletedDate) {
		this.TaskID =TaskID;
		this.TaskName=TaskName;
		this.TaskDescription=TaskDescription;
		this.UserID=UserID;
		this.CreatedDate=CreatedDate;
		this.ExpectedDate=ExpectedDate;
		this.Status=Status;
		this.FtpLocation=FtpLocation;
		this.Quantity=Quantity;
		this.TargetRole=TargetRole;
		this.DeveloperId=DeveloperId;
		this.Priority=Priority;
		this.TesterId=TesterId;
		this.CompletedDate=CompletedDate;
	}
	
	public String getCompletedDate() {
		return CompletedDate;
	}

	public void setCompletedDate(String completedDate) {
		CompletedDate = completedDate;
	}

	public String getTesterId() {
		return TesterId;
	}

	public void setTesterId(String testerId) {
		TesterId = testerId;
	}

	public int getTaskID() {
		return TaskID;
	}
	public void setTaskID(int taskID) {
		TaskID = taskID;
	}
	public String getTaskName() {
		return TaskName;
	}
	public void setTaskName(String taskName) {
		TaskName = taskName;
	}
	public String getTaskDescription() {
		return TaskDescription;
	}
	public void setTaskDescription(String taskDescription) {
		TaskDescription = taskDescription;
	}
	public String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		UserID = userID;
	}
	public Date getCreatedDate() {
		return CreatedDate;
	}
	public void setCreatedDate(Date createdDate) {
		CreatedDate = createdDate;
	}
	public Date getExpectedDate() {
		return ExpectedDate;
	}
	public void setExpectedDate(Date expectedDate) {
		ExpectedDate = expectedDate;
	}
	public String getStatus() {
		return Status;
	}
	public void setStatus(String status) {
		Status = status;
	}
	public String getFtpLocation() {
		return FtpLocation;
	}
	public void setFtpLocation(String ftpLocation) {
		FtpLocation = ftpLocation;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	public String getTargetRole() {
		return TargetRole;
	}
	public void setTargetRole(String targetRole) {
		TargetRole = targetRole;
	}

	public String getDeveloperId() {
		return DeveloperId;
	}

	public void setDeveloperId(String developerId) {
		DeveloperId = developerId;
	}

	public String getPriority() {
		return Priority;
	}

	public void setPriority(String priority) {
		Priority = priority;
	}
	
}
