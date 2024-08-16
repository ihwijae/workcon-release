package com.WorkConGW.emp.dto;

import java.util.Date;

import com.WorkConGW.common.command.FileUploadCommand;
import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import com.WorkConGW.common.dto.BaseVO;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.google.api.client.util.Data;

@Alias("EmpVO")
public class EmpVO extends BaseVO{
    private String emp_Id;
    private String emp_Name;
    private String emp_Pwd;
    private String emp_Regno;
    private String emp_Regno2;
    private String emp_Hp;
    private String emp_Sign;
    private String emp_Picture;
    private int emp_St;
    private String emp_Add1;
    private String emp_Add2;



    int cnt;



    private String emp_ZipCode;
    private String dept_Id;
    private Date emp_Create_Dt;
    private Date emp_Update_Dt;
    private String emp_Email;
    private String auth_Id;
    private String code_Id;
    private String emp_Code_Resp_Id;
    private String attend_St_Id;
    private String code_Name;
    private String dept_Name;
    private String attend_St_Name;
    private String emp_Update_Yn;
    private String team_Id;
    private String auth_Name;
    private FileUploadCommand fileUploadCommand;



    private String search_code;
    private String flag;
    private String emp_Sup_Id;

    private int emp_authkey;
    
    private String history_Attend_Time;
    private String history_Leaving_Time;

	
    
    public EmpVO(String emp_ZipCode,int emp_authkey,String emp_Id, String emp_Name, String emp_Pwd,String emp_Regno, String emp_Hp, String emp_Sign,String emp_Picture, int emp_St, String emp_Add1,String emp_Add2,String dept_Id, Date emp_Create_Dt, Date emp_Update_Dt,String emp_Email
        , String auth_Id, String code_Id, String emp_Code_Resp_Id, String code_Name, String dept_Name, String attend_St_Name, String emp_Update_Yn, String team_Id, String auth_Name, String search_Auth, String attend_St_Id, String emp_Regno2,String emp_Sup_Id, String history_Attend_Time, String history_Leaving_Time) {
            super();
            this.emp_ZipCode=emp_ZipCode;
            this.emp_Regno2 = emp_Regno2;
            this.emp_Id = emp_Id;
            this.emp_Name = emp_Name;
            this.emp_Pwd = emp_Pwd;
            this.emp_Regno = emp_Regno;
            this.emp_Hp = emp_Hp;
            this.emp_Sign = emp_Sign;
            this.emp_Picture = emp_Picture;
            this.emp_St = emp_St;
            this.emp_Add1 = emp_Add1;
            this.emp_Add2 = emp_Add2;
            this.dept_Id=  dept_Id;
            this.emp_Create_Dt = emp_Create_Dt;
            this.emp_Update_Dt = emp_Update_Dt;
            this.emp_Email= emp_Email;
            this.auth_Id = auth_Id;
            this.code_Id = code_Id;
            this.code_Name=code_Name;
            this.dept_Name=dept_Name;
            this.attend_St_Name=attend_St_Name;
            this.emp_Update_Yn=emp_Update_Yn;
            this.team_Id=team_Id;
            this.auth_Name =auth_Name;
            this.search_code=search_code;
            this.attend_St_Id=attend_St_Id;
            this.emp_Sup_Id =emp_Sup_Id;
            this.emp_authkey = emp_authkey;
            this.history_Attend_Time = history_Attend_Time;
            this.history_Leaving_Time = history_Leaving_Time;

    }


    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }


    public String getSearch_code() {
        return search_code;
    }

    public void setSearch_code(String search_code) {
        this.search_code = search_code;
    }


    public EmpVO(){
        this.fileUploadCommand = new FileUploadCommand();
    }

    public FileUploadCommand getFileUploadCommand() {
        return fileUploadCommand;
    }

    public void setFileUploadCommand(FileUploadCommand fileUploadCommand) {
        this.fileUploadCommand = fileUploadCommand;
    }
    public String getEmp_ZipCode() {
        return emp_ZipCode;
    }

    public void setEmp_ZipCode(String emp_ZipCode) {
        this.emp_ZipCode = emp_ZipCode;
    }
    public String getemp_Sup_Id()
    {
        return this.emp_Sup_Id;
    }
    public void setemp_Sup_Id(String emp_Sup_Id){
        this.emp_Sup_Id=emp_Sup_Id;
    }

    // 생성자를 호출하면 객체가 생성된다.

    public String getemp_Regno2()
    {
        return this.emp_Regno2;
    }
    public void setemp_Regno2(String emp_Regno2) {
        this.emp_Regno2 = emp_Regno2;
    }

    public String getEmp_Id() {
        return this.emp_Id;
    }

    public void setEmp_Id(String emp_Id) {
        this.emp_Id = emp_Id;
    }

    public String getEmp_Name() {
        return this.emp_Name;
    }

    public void setEmp_Name(String emp_Name) {
        this.emp_Name = emp_Name;
    }

    public String getEmp_Pwd() {
        return this.emp_Pwd;
    }

    public void setEmp_Pwd(String emp_Pwd) {
        this.emp_Pwd = emp_Pwd;
    }

    public String getEmp_Regno() {
        return this.emp_Regno;
    }

    public void setEmp_Regno(String emp_Regno) {
        this.emp_Regno = emp_Regno;
    }

    public String getEmp_Hp() {
        return this.emp_Hp;
    }

    public void setEmp_Hp(String emp_Hp) {
        this.emp_Hp = emp_Hp;
    }

    public String getEmp_Sign() {
        return this.emp_Sign;
    }

    public void setEmp_Sign(String emp_Sign) {
        this.emp_Sign = emp_Sign;
    }

    public String getEmp_Picture() {
        return this.emp_Picture;
    }

    public void setEmp_Picture(String emp_Picture) {
        this.emp_Picture = emp_Picture;
    }

    public int getEmp_St() {
        return this.emp_St;
    }

    public void setEmp_St(int emp_St) {
        this.emp_St = emp_St;
    }

    public String getEmp_Add1() {
        return this.emp_Add1;
    }

    public void setEmp_Add1(String emp_Add1) {
        this.emp_Add1 = emp_Add1;
    }

    public String getEmp_Add2() {
        return this.emp_Add2;
    }

    public void setEmp_Add2(String emp_Add2) {
        this.emp_Add2 = emp_Add2;
    }

    public String getDept_Id() {
        return this.dept_Id;
    }

    public void setDept_Id(String dept_Id) {
        this.dept_Id = dept_Id;
    }

    public Date getEmp_Create_Dt() {
        return this.emp_Create_Dt;
    }

    public void setEmp_Create_Dt(Date emp_Create_Dt) {
        this.emp_Create_Dt = emp_Create_Dt;
    }

    public Date getEmp_Update_Dt() {
        return this.emp_Update_Dt;
    }

    public void setEmp_Update_Dt(Date emp_Update_Dt) {
        this.emp_Update_Dt = emp_Update_Dt;
    }

    public String getEmp_Email() {
        return this.emp_Email;
    }

    public void setEmp_Email(String emp_Email) {
        this.emp_Email = emp_Email;
    }

    public String getAuth_Id() {
        return this.auth_Id;
    }

    public void setAuth_Id(String auth_Id) {
        this.auth_Id = auth_Id;
    }

    public String getCode_Id() {
        return this.code_Id;
    }

    public void setCode_Id(String code_Id) {
        this.code_Id = code_Id;
    }

    public String getEmp_Code_Resp_Id() {
        return this.emp_Code_Resp_Id;
    }

    public void setEmp_Code_Resp_Id(String emp_Code_Resp_Id) {
        this.emp_Code_Resp_Id = emp_Code_Resp_Id;
    }

    public String getAttend_St_Id() {
        return this.attend_St_Id;
    }

    public void setAttend_St_Id(String attend_St_Id) {
        this.attend_St_Id = attend_St_Id;
    }

    public String getcode_Name() {
        return this.code_Name;
    }

    public void setcode_Name(String code_Name) {
        this.code_Name = code_Name;
    }

    public String getDept_Name() {
        return this.dept_Name;
    }

    public void setDept_Name(String dept_Name) {
        this.dept_Name = dept_Name;
    }

    public String getAttend_St_Name() {
        return this.attend_St_Name;
    }

    public void setAttend_St_Name(String attend_St_Name) {
        this.attend_St_Name = attend_St_Name;
    }

    public String getEmp_Update_Yn() {
        return this.emp_Update_Yn;
    }



    public void setEmp_Update_Yn(String emp_Update_Yn) {
        this.emp_Update_Yn = emp_Update_Yn;
    }

    public String getTeam_Id() {
        return this.team_Id;
    }

    public void setTeam_Id(String team_Id) {
        this.team_Id = team_Id;
    }

    public String getAuth_Name() {
        return this.auth_Name;
    }

    public void setAuth_Name(String auth_Name) {
        this.auth_Name = auth_Name;
    }


    public String getFlag() {
        return this.flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }


    public int getEmp_authkey() {
        return emp_authkey;
    }

    public void setEmp_authkey(int emp_authkey) {
        this.emp_authkey = emp_authkey;
    }

    public String getHistory_Attend_Time() {
        return this.history_Attend_Time;
    }

    public void setHistory_Attend_Time(String history_Attend_Time) {
        this.history_Attend_Time = history_Attend_Time;
    }

    public String getHistory_Leaving_Time() {
        return this.history_Leaving_Time;
    }

    public void setHistory_Leaving_Time(String history_Leaving_Time) {
        this.history_Leaving_Time = history_Leaving_Time;
    }

}

