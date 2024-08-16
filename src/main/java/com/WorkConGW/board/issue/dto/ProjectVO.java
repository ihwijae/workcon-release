package com.WorkConGW.board.issue.dto;

import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Alias("ProjectVO")
public class ProjectVO {

	private int project_Id;
	private String project_Title;
	private Date project_Create_Dt;
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date project_End_Dt;
	@DateTimeFormat(pattern = "MM/dd/yyyy")
	private Date project_Update_Dt;
	private int project_St;
	private String emp_Id;
	private String emp_Name;
	private int dutyCount;
	private String isOpen = "open";	// 탭 체크
	private int todoIssueCount;	// todo 이슈 개수
	private int inprogressIssueCount;	// inprogress 이슈 개수
	private int doneIssueCount;	// done 이슈 개수
	private int oppListCount;	// 진행/종료된 이슈 개수(반대)

	private List<IssueVO> issueList;	// 프로젝트의 이슈리스트

	public int getProject_Id() {
		return project_Id;
	}

	public void setProject_Id(int project_Id) {
		this.project_Id = project_Id;
	}

	public String getProject_Title() {
		return project_Title;
	}

	public void setProject_Title(String project_Title) {
		this.project_Title = project_Title;
	}

	public Date getProject_Create_Dt() {
		return project_Create_Dt;
	}

	public void setProject_Create_Dt(Date project_Create_Dt) {
		this.project_Create_Dt = project_Create_Dt;
	}

	public Date getProject_End_Dt() {
		return project_End_Dt;
	}

	public void setProject_End_Dt(Date project_End_Dt) {
		this.project_End_Dt = project_End_Dt;
	}
	public Date getProject_Update_Dt() {
		return project_Update_Dt;
	}
	public void setProject_Update_Dt(Date project_Update_Dt) {
		this.project_Update_Dt = project_Update_Dt;
	}
	public int getProject_St() {
		return project_St;
	}

	public void setProject_St(int project_St) {
		this.project_St = project_St;
	}

	public String getEmp_Id() {
		return emp_Id;
	}

	public void setEmp_Id(String emp_Id) {
		this.emp_Id = emp_Id;
	}

	public String getEmp_Name() {
		return emp_Name;
	}

	public void setEmp_Name(String emp_Name) {
		this.emp_Name = emp_Name;
	}

	public int getDutyCount() {
		return dutyCount;
	}

	public void setDutyCount(int dutyCount) {
		this.dutyCount = dutyCount;
	}

	public String getIsOpen() {
		return isOpen;
	}

	public void setIsOpen(String isOpen) {
		this.isOpen = isOpen;
	}


	public int getTodoIssueCount() {
		return todoIssueCount;
	}

	public void setTodoIssueCount(int todoIssueCount) {
		this.todoIssueCount = todoIssueCount;
	}

	public int getInprogressIssueCount() {
		return inprogressIssueCount;
	}

	public void setInprogressIssueCount(int inprogressIssueCount) {
		this.inprogressIssueCount = inprogressIssueCount;
	}

	public int getDoneIssueCount() {
		return doneIssueCount;
	}

	public void setDoneIssueCount(int doneIssueCount) {
		this.doneIssueCount = doneIssueCount;
	}

	public int getOppListCount() {
		return oppListCount;
	}

	public void setOppListCount(int oppListCount) {
		this.oppListCount = oppListCount;
	}

	public List<IssueVO> getIssueList() {
		return issueList;
	}

	public void setIssueList(List<IssueVO> issueList) {
		this.issueList = issueList;
	}

	
}
