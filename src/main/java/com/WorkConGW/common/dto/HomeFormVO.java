package com.WorkConGW.common.dto;
import org.apache.ibatis.type.Alias;

import com.WorkConGW.common.dto.BaseVO;

import lombok.Data;
import lombok.NoArgsConstructor;

import com.WorkConGW.approval.dto.ApprovalVO;
import com.WorkConGW.board.duty.dto.DutyVO;
import com.WorkConGW.board.issue.dto.IssueVO;
import com.WorkConGW.board.issue.dto.ProjectVO;
import com.WorkConGW.board.notice.dto.NoticeVO;

@Data
@Alias("HomeFormVO")
public class HomeFormVO extends BaseVO{
    private NoticeVO noticeVO;
    private ApprovalVO approvalVO;
    private IssueVO issueVO;
    private DutyVO dutyVO;
    private ProjectVO projectVO;
    private int dashboard_approval;
    private int dashboard_reservation;
    private int dashboard_issue;
    private int dashboard_duty;
    private int dashboard_project;
    private int dashboard_board;
    private int dashboard_weather;
    private String emp_id;
    public HomeFormVO(){
        this.noticeVO = new NoticeVO();
        this.approvalVO = new ApprovalVO();
        this.issueVO = new IssueVO();
        this.dutyVO = new DutyVO();
        this.projectVO = new ProjectVO();
    }

    public void setProjectVO(ProjectVO projectVO) {
        this.projectVO = projectVO;
    }
    public ProjectVO getProjectVO() {
        return projectVO;
    }

    public void setDutyVO(DutyVO dutyVO) {
        this.dutyVO = dutyVO;
    }
    public DutyVO getDutyVO() {
        return dutyVO;
    }

    public void setIssueVO(IssueVO issueVO) {
        this.issueVO = issueVO;
    }
    public IssueVO getIssueVO() {
        return issueVO;
    }

    public void setApprovalVO(ApprovalVO approvalVO) {
        this.approvalVO = approvalVO;
    }
    public ApprovalVO getApprovalVO() {
        return approvalVO;
    }

    public void setNoticeVO(NoticeVO noticeVO) {
        this.noticeVO = noticeVO;
    }
    public NoticeVO getNoticeVO() {
        return noticeVO;
    }
}
