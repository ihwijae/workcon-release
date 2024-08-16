<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>WorkConGW</title>
    <script src="https://kit.fontawesome.com/3a92c85ff9.js" crossorigin="anonymous"></script>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
            crossorigin="anonymous"
    />
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
            crossorigin="anonymous"
    ></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${root}/resources/css/member/join-style.css" />

    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Passion+One:wght@400;700&display=swap');

        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        a {
            text-decoration: none;
        }

        body, input {
            font-family: 'Noto Sans KR', sans-serif;
        }

        .container {
            position: relative;
            width: 100%;
            min-height: 100vh;
            background-color: #fff;
            overflow: hidden;
            align-content: center;
            margin: 80px auto;
        }

        .signup-form {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            overflow: hidden;
        }

        .title a {
            font-size: 3.8rem;
            color: #0f0f0f;
            font-weight: 700;
            font-family: 'Passion One', sans-serif;
        }

        .title a:hover {
            color: #0f0f0f;
        }

        .sub-title {
            margin-bottom: 30px;
            font-size: 1.8rem;
            color: #0f0f0f;
            font-weight: 600;
        }

        .input-field {
            min-width: 500px;
            max-width: 800px;
            width: 80%;
            height: 60px;
            background-color: rgb(241, 239, 239);
            margin: 10px 0;
            border-radius: 15px;
            display: grid;
            grid-template-columns: 27% 73%;
            padding: 0 .4rem;
        }

        .id-field {
            grid-template-columns: 27% 48% 25%;
        }

        .id-field button {
            margin: auto;
        }

        .email-field {
            grid-template-columns: 27% 27% 46%;
            grid-template-rows: 50% 50%;
            height: 120px;
        }


        .usernum-field {
            grid-template-columns: 27% 20% 10% 42%;
        }

        .address-field {
            height: 240px;
        }

        .input-field label,
        .input-field span {
            text-align: center;
            line-height: 60px;
            color: #0f0f0f;
            font-size: 1rem;
            font-weight: 600;
        }

        .input-field span {
            font-weight: 900;
            font-size: 1.2rem;
        }

        .input-field input, .input-field select {
            background: none;
            border: none;
            height: 60px;
            outline: none;
            line-height: 1;
            font-weight: 400;
            font-size: 1rem;
            color: black;
        }

        .input-field input[type=button] {
            border: 1px solid #0f0f0f;
            height: 32px;
            width: 100px;
            border-radius: 5px;
            font-weight: 500;
            font-size: 14px;
            color: #0f0f0f;
        }

        .input-field input[type=button]:hover {
            background-color: #d9d2ff3d
        }

        .input-field select {
            margin: auto;
            margin-left: 0;
            height: 40px;
        }

        .input-field select:checked {
            background: inherit;
        }

        .input-field input::placeholder {
            color: #131212;
            font-weight: 400;
        }

        .btn {
            width: 200px;
            height: 50px;
            border: none;
            outline: none;
            border-radius: 20px;
            cursor: pointer;
            background-color: #0f0f0f;
            color: #fff;
            font-weight: 600;
            font-size: 1.2rem;
            margin: 30px 0;
            transition: .5s;
        }

        .btn:hover {
            background-color: #0f0f0f;
            color: #fff;
        }

        .input-btn {
            border: 1.5px solid ;
            color: #0f0f0f;
            height: 35px;
            width: 90px;
            border-radius: 10px;
            font-weight: 500;
            font-size: 14px;
        }

        .input-btn:hover {
            background-color: #d9d2ff3d
        }
    </style>
</head>
<body>
<div class="container">
    <div class="signup">
        <form action="<%=request.getContextPath()%>/emp/register" class="signup-form" method="post" id="join">
            <h1 class="title">WorkConGW</h1>
            <h3 class="sub-title">사원등록</h3>


            <div class="input-field id-field">
                <label>* 사번</label>
                <input id = "emp_Id_input" name="emp_Id" type="text" placeholder="사번를 입력해주세요" readonly="readonly" />
                <button type="button"  class="input-btn" onclick="checkemp_Id();">사번생성</button>
            </div>
            <div class="input-field id-field">
                <label>* 이메일</label>
                <input id = "emp_Email" name="emp_Email" type="text" placeholder="이메일를 입력해주세요" required value="njtest777@gmail.com"/>
                <input type="hidden" value="N" id="isDup" />
            </div>
            <div class="input-field">
                <label>* 비밀번호</label>
                <input id = "emp_Pwd" name="emp_Pwd" type="password" placeholder="비밀번호를 입력해주세요" required value="1234"/>
            </div>
            <div class="input-field">
                <label>* 비밀번호 확인</label>
                <input id = "emp_Pwd2"  type="password" placeholder="비밀번호를 한 번 더 입력해주세요" required value="1234"/>
            </div>
            <div class="input-field">
                <label>* 성명</label>
                <input id = "emp_Name" name="emp_Name" type="text" placeholder="성함을 입력해주세요" maxlength="6" required value="김시연"/>
            </div>
            <div class="input-field usernum-field">
                <label>* 주민번호</label>
                <input id = "emp_Regno" name="emp_Regno" type="text" size="6" placeholder="주민번호 앞자리" maxlength="6" required value="111111"/>
                <span>-</span>
                <input id = "emp_Regno2" name="emp_Regno2" type="password" size="7" placeholder="주민번호 뒷자리" maxlength="7" required value="111111"/>
            </div>
            <div class="input-field">
                <label>* 휴대전화</label>
                <input id = "emp_Hp" name="emp_Hp" type="text" placeholder="'-' 를 제외한 휴대전화 번호를 입력해주세요" required maxlength="11" value="010-1234-1234"/>
            </div>

            <div class="input-field">
                <label>* 주소</label>
                <div>
                    <input id = "myAdd1" name="emp_Add1"  type="text" placeholder="우편번호" required />
                    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" /><br />
                </div>
            </div>
            <div class="input-field"a>
                <label>* 우편번호</label>
                <input id = "myAdd3" name="emp_ZipCode" type="text"  placeholder="우편번호" required /><br />
            </div>
            <div class="input-field">
                <label>* 상세주소</label>
                <input id = "myAdd2" name="emp_Add2" type="text"  placeholder="상세주소" required value="1호" /><br />
            </div>


            <div class="input-field id-field">
                <label>* 직속상관</label>
                <input id = "emp_Sup_Id" name="emp_Sup_Id" type="text" placeholder="직속상관를 조직도에서 입력하세요"  />
                <button type="button"  class="input-btn" onclick="OpenWindow('<%=request.getContextPath()%>/organization', 'WorkConGW', 700,700)">조직도</button>
            </div>

            <div class="input-field id-field">
                <label>* 부서</label>
                <input id = "dept_Id" name="dept_Id" type="text" placeholder="부서코드를 입력하세요"  />
                <button type="button"  class="input-btn" onclick="OpenWindow('<%=request.getContextPath()%>/organization', 'WorkConGW', 700,700)">조직도</button>
            </div>



            <div class="input-field">
                <label>* 직위 : </label>
                <select id = "code_Id" name="code_Id" class="form-control">
                    <option value="c01" >부장</option>
                    <option value="c02" }>차장</option>
                    <option value="c03" }>과장</option>
                    <option value="c04" }>대리</option>
                    <option value="c05" }>사원</option>
                </select>
            </div>


            <div class="input-field">
                <label>* 권한설정 : </label>
                <select id = "auth_Id" name="auth_Id" class="form-control">
                    <option value="u" >일반사용자 : u</option>
                    <option value="s" }>시스템관리자 : s</option>
                </select>
            </div>


            <div class="input-field">
                <label>* 상태 : </label>
                <select id = "emp_St" name="emp_St" class="form-control">
                    <option value="1">재직 : 1</option>
                    <option value="2">휴직 : 2</option>
                    <option value="3">퇴사 : 3</option>
                </select>
            </div>

            <div>
                <button type="button" class="btn btn-dark" data-type="success" onclick="fnSubmit()">등록 완료</button>
                <button type="button" class="btn btn-dark" onclick="list_go();">목록으로</button>
            </div>

        </form>
    </div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    //다음 주소api
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                let addr = ""; // 주소 변수
                let extraAddr = ""; // 참고항목 변수
                let zipCode = data.zonecode;

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === "R") {
                    // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else {
                    // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === "R") {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== "" && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== "" && data.apartment === "Y") {
                        extraAddr += extraAddr !== "" ? ", " + data.buildingName : data.buildingName;
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== "") {
                        extraAddr = "(" + extraAddr + ")";
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.

                    document.getElementById("myAdd1").value = extraAddr;
                } else {
                    document.getElementById("myAdd1").value = "";
                }

                document.getElementById("myAdd3").value = zipCode;
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("myAdd1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("myAdd2").focus();

            },
        }).open();
    }



    function list_go()
    {
        location.href = "<%=request.getContextPath()%>/admin/emp/empList"
    }


    function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight){
        winleft = (screen.width - WinWidth) / 2;
        wintop = (screen.height - WinHeight) / 2;
        var winX      = window.screenX || window.screenLeft || 0;// 현재창의 x좌표
        var winY      = window.screenY || window.screenTop || 0; // 현재창의 y좌표

        winleft = winX + winleft;
        wintop = winY + wintop;

        var win = window.open(UrlStr, WinTitle, "scrollbars=yes,width="+ WinWidth +", "
            +"height="+WinHeight + ", top=" + wintop +", left="
            + winleft +", resizable=yes, status=yes");
        win.focus();
    }
</script>

<script>
    function fnSubmit(){
        let email_rule = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

        if($("#emp_Name").val()== null || $("#emp_Name").val()=="")
        {
            alert("이름을 입력해주세요.")
            $("#emp_Name").focus();
            return false;
        }

        if ($("#emp_Id_input").val() == null || $("#emp_Id_input").val() == "") {
            alert("사번를 입력해주세요.");
            $("#emp_Id_input").focus();

            return false;
        }
        if ($("#emp_Email").val() == null || $("#emp_Email").val() == "") {
            alert("이메일을 입력해주세요.");
            $("#emp_Email").focus();

            return false;
        }


        if ($("#emp_Pwd").val() == null || $("#emp_Pwd").val() == "") {
            alert("비밀번호를 입력해주세요.");
            $("#emp_Pwd").focus();

            return false;
        }

        if ($("#emp_Pwd2").val() == null || $("#emp_Pwd2").val() == "") {
            alert("비밀번호 확인하세요 .");
            $("#emp_Pwd2").focus();

            return false;
        }

        if(!email_rule.test($("#emp_Email").val())){
            alert("이메일을 형식에 맞게 입력해주세요. ex) 1234@naver.com");
            $("#emp_Email").focus();
            return false;
        }


        if (validateAndSubmit()) {
            $("#join").submit();
            alert('사원을 등록했습니다.');
        }




    }


    function validateAndSubmit() {
        // 비밀번호 확인
        let pwd1 = document.getElementById("emp_Pwd").value;
        let pwd2 = document.getElementById("emp_Pwd2").value;

        // 비밀번호가 다르면 submit 막기
        if (pwd1 !== pwd2) {
            // 비밀번호가 다릅니다. 모달창으로 알림 등을 표시할 수 있습니다.
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }

        return true;

    }



    //유효성 체크
    const isDup = document.querySelector("#isDup");
    const pwd = document.querySelector("input[name=emp_Pwd]");
    const pwd2 = document.querySelector("#emp_Pwd2");
    const regno1 = document.querySelector("input[name=emp_Regno]");
    const regno2 = document.querySelector("input[name=emp_Regno2]");
    const email = document.querySelector("input[name=emp_Email]");

    function check() {
        if(isDup.value == 'Y') {
            toastContent.innerText = "이메일 중복확인을 진행해주세요.";
            return false;
        }

        if(pwd.value.length == 0 || pwd.value != pwd2.value) {
            toastContent.innerText = "비밀번호가 일치하지 않습니다.";
            return false;
        }

        if(regno1.value.length != 6 && regno2.value.length != 7) {
            toastContent.innerText = "주민번호를 확인해주세요.";
            return false;
        }

        if(email.value.indexOf('@') == -1) {
            toastContent.innerText = "이메일 주소를 확인해주세요.";
            return false;
        }
    };
</script>

<script>
    //아이디 중복체크
    function checkDup() {
        const userId = document.querySelector("input[name=emp_Email]").value;

        if(userId != "") {
            $.ajax({
                url: "<%=request.getContextPath()%>/emp/idCnt",
                type: "POST",
                contentType : "application/json; charset-utf-8",
                dataType : "json",
                data: JSON.stringify({emp_Email : userId}),
                success: function (data) {
                    console.log(data);
                    $("#isDup").val("Y")
                    if (data.idCnt == 0) {
                        $("#isDup").val("Y")
                        alert("사용할 수 있는 이메일입니다.");
                    } else {
                        $("#isDup").val("N")
                        alert("중복된 이메일 입니다.");
                    }
                },
                error: function () {
                    alert("등록 시도에 실패하였습니다." + e);
                },
            });
        }
    }

    function checkemp_Id()
    {
        $.ajax({
            url : "<%=request.getContextPath()%>/emp/empId",
            type : "POST",
            dataType: 'json',
            success:function (data) {
                console.log(data);
                document.getElementById("emp_Id_input").value=data.emp_Id;

            },error:function () {
                alert('등록 시도에 실패했습니다.'+e);
            }
        })

    }
</script>
</body>
</html>