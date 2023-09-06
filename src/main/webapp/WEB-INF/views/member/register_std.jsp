<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>학생회원가입</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/member/register_std.css">
        <link rel="stylesheet" href="../resources/css/footer.css">
        <link rel="stylesheet" href="../resources/css/reset.css">

        <!--헤더폰트-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Serif:wght@500&display=swap" rel="stylesheet">
        <!--본문폰트-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
    </head>


    <body>
        <div id="container">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>  
			<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>  


            <!-- ************************************************************************************ -->
            
                <main>
                    <section id="main_layer1">
                        <h1>학생으로 가입하기</h1>
                    </section>
                    
                    <form id="registerForm" action="/member/register2.do" method="post" enctype="multipart/form-data">
                        <section id="main_layer2">
                            <section id="e_title">
                                <p>필수정보</p>
                            </section>
            
                            <section id="e_data">
<%--                             <input type="hidden" name="position" value="${register.position}">  --%>
								<input type="hidden" name="position" value="std">
                                <table id="tbl_1">
                                    <tr>
                                        <td class="line1">이름</td>
                                        <td class="line2">
                                            <input type="text" name="memberName" id="memberName" class="input" value="${sMember.memberName}" reqired>
        
                                        </td>
                                        <td class="line1">성별</td>
                                        <td class="line2">
                                            <label><input type="radio" name="memberGender" value="F" class="ipt_chkbx" reqired <c:if test="${ sMember.memberGender eq 'F' }">checked</c:if>>&nbsp;&nbsp;여성</label>&nbsp;&nbsp;
                                            <label><input type="radio" name="memberGender" value="M" class="ipt_chkbx" reqired <c:if test="${ sMember.memberGender eq 'M' }">checked</c:if>>&nbsp;&nbsp;남성</label>&nbsp;&nbsp;

                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="line1">휴대폰번호</td>
                                        <td colspan="2" class="line2">
                                            <input type="text" name="memberPhone" id="memberPhone" class="input" value="${sMember.memberPhone }"  maxlength="13" reqired>
                                        </td>
                                        <td class="line4">
                                            <div id="phn_chked">휴대폰인증완료</div>
                                        </td>
                                        <!-- <td></td> -->
                                    </tr>
                                    <tr>
                                        <td class="line1">ID</td>
                                        <td colspan="2">
                                            <input type="text" name="memberEmail" id="memberEmail" class="input" placeholder="사용하시는 이메일을 입력해주세요." value="${sMember.memberEmail }" reqired>
                                        </td>
                                        <td class="line4">
                                        	<div>
	                                            <button type="button" id="eml_btn" name="dbCheckId" onclick="emailCheck()">이메일 중복확인</button>
	                                            <input type="hidden" name="idDuplication" value="${isChecked }">
                                        	</div>
                                            <div id="checkIdMsg">
	                                            <c:if test="${isAvailable eq 'yes'}">
													<span style="color: ${color};"><small>${msg}</small></span>
												</c:if>
												<c:if test="${isAvailable eq 'no'}">
													<span style="color: ${color};"><small>${msg}</small></span>
												</c:if>
                                            </div>
                                            
                                        </td>
                                        <!-- <td></td> -->
                                    </tr>
                                    <tr>
                                        <td class="line1">PW</td>
                                        <td colspan="2">
                                            <input type="password" name="memberPw" id="memberPw" class="input" placeholder="사용하실 비밀번호를 입력해 주세요."  reqired>
                                        </td>
                                        
                                        <td class="line4"><small> 8~12자리의 영문자, 숫자 포함</small></td>
                                        <!-- <td></td> -->
                                    </tr>
                                    <tr>
                                        <td class="line1">PW 확인</td>
                                        <td colspan="2">
                                            <input type="password" name="memberPwChk" id="memberPwChk"  class="input" placeholder="비밀번호를 한번 더 입력해 주세요." reqired>
                                        </td>
                                        <td></td>
                                        <!-- <td></td> -->
                                    </tr>
                                </table>
                            </section>
                        </section>
        
                        <section id="main_layer3">
                            <section id="cho_title">
                                <p>추가정보</p>
                            </section>
        
                            <section id="cho_data">
                                <table id="tbl_2">
                                    <tr class="line">
                                        <td >프로필 사진</td> 
                                        <td >
                                            <input type="file" name="uploadFile"  >
                                        </td>
                                    </tr>
                                    <tr class="line">
                                        <td >희망하는 레슨장소</td>
                                        <td >
                                            <label><input type="checkbox" name="place" value="visitTeacher" >&nbsp;&nbsp;선생님 연습실에서 레슨</label><br>
                                            <label><input type="checkbox" name="place" value="visitStudent" >&nbsp;&nbsp;우리집으로 방문 희망</label>
                                        </td>
                                    </tr>
                                    <tr class="line">
                                        <td >희망하는 레슨 방식</td>
                                        <td >
                                            <label><input type="checkbox" name="lesson" value="oneOnOne" >&nbsp;&nbsp;1 대 1 레슨</label><br>
                                            <label><input type="checkbox" name="lesson" value="group" >&nbsp;&nbsp;친구와 함께 레슨</label>
    
                                        </td>
                                    </tr>
                                    <tr class="line">
                                        <td >희망하는 레슨</td>
                                        <td >
                                            <label><input type="radio" name="lessonType" value="basic" class="ipt_chkbx">&nbsp;&nbsp;기초부터 차근히 배우고 싶어요.</label><br>
                                            <label><input type="radio" name="lessonType" value="wants" class="ipt_chkbx">&nbsp;&nbsp;원하는 곡만 마스터하고 싶어요.</label>
                                        </td>
                                    </tr>
                                    <tr class="line">
                                        <td >선호하는 선생님 성별</td>
                                        <td >
                                            <label><input type="radio" name="tGender" value="F" class="ipt_chkbx">&nbsp;&nbsp;여성</label>&nbsp;&nbsp;
                                            <label><input type="radio" name="tGender" value="M" class="ipt_chkbx">&nbsp;&nbsp;남성</label>&nbsp;&nbsp;
                                            <label><input type="radio" name="tGender" value="N" class="ipt_chkbx">&nbsp;&nbsp;무관</label>
                                        </td>
                                    </tr>
                                    <tr class="line">
                                        <td >나의 현재 레벨</td>
                                        <td >
                                            <label><input type="radio" name="myLevel" value="low" class="ipt_chkbx">&nbsp;&nbsp;하</label>&nbsp;&nbsp;
                                            <label><input type="radio" name="myLevel" value="middle" class="ipt_chkbx">&nbsp;&nbsp;중</label>&nbsp;&nbsp;
                                            <label><input type="radio" name="myLevel" value="mhigh" class="ipt_chkbx">&nbsp;&nbsp;중상</label>&nbsp;&nbsp;
                                            <label><input type="radio" name="myLevel" value="high" class="ipt_chkbx">&nbsp;&nbsp;상</label>
                                        </td>
                                    </tr>
                                </table>
                            </section>
                        </section>
        
                        <section id="main_layer4">
                            <section id="free_title">
                                <p>하고싶은말</p>
                            </section>
                            <div id="free_data">
                                <textarea rows="10" cols="60" placeholder="자유롭게 쓰세요" name="freeWords"></textarea>
                            </div>
                        </section>
        
                        <section id="main_layer5">
                            <input type="button" id="registerBtn" onclick="registerCheck()" value="회원가입완료">
                        </section>
                    </form>
                </main>
            </div>

            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
            
            <script> 
	            function registerCheck() {
	            	const memberName = document.getElementById("memberName");
	            	let memberGender = document.getElementsByName("memberGender");
	            	const memberPhone = document.getElementById("memberPhone");
	            	const memberEmail = document.getElementById("memberEmail");
	            	const memberPw = document.getElementById("memberPw");
	            	const memberPwChk = document.getElementById("memberPwChk");
	            	const emailCheck = document.getElementById("eml_btn");
	            	const checkIdMsg = document.querySelector("span");
	            	
	            	//정규식
	            	const regName = /^[가-힣]{2,15}$/;
	            	const regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
	            	const regPhone = /^(010)[0-9]{3,4}[0-9]{4}$/;
	            	const regPw = /^[a-zA-z0-9]{8,12}$/;
	            	
	            	const str = memberEmail.value;
	            	const words = str.split('@')
	            	


	            	
	            	//이름 확인 
	            	if(memberName.value == ""){
	            		alert("이름을 입력해주세요");
	            		memberName.focus();
	            		return false;
	            	} 
	            	if(!regName.test(memberName.value)){
	                    alert("이름은 2~15자까지의 한글만 입력할 수 있습니다")
	                    memberName.focus();
	                    return false;
	                }
	            	
	            	
	            	//성별 확인 
	        		let gender_type = null;

	        		for(var i = 0; i < memberGender.length; i++){
	        			if(memberGender[i].checked == true){ 
	        				gender_type = memberGender[i].value;
	        			}
	        		}
	        		if(gender_type == null){
						alert("성별을 선택하세요."); 
						memberGender[0].focus();
						return false;
	        		}
	        		

	            	//전화번호 확인 
	            	if(memberPhone.value == ""){
	            		alert("전화번호를 입력해주세요");
	            		memberPhone.focus();
	            		return false;
	            	}
	            	if(!regPhone.test(memberPhone.value)){
	            		alert("잘못된 전화번호 형식입니다.")
	                    memberPhone.focus();
	                    return false;
	            		
	            	}
	            	
	            	//이멜(아이디)확인
	            	if(memberEmail.value == ""){
						alert("사용하실 아이디를 입력해주세요");
						memberEmail.focus();
		            	return false;
	            	}
					if(!regEmail.test(memberEmail.value)){
	                    alert("잘못된 이메일 형식입니다.")
	                    memberEmail.focus();
	                    return false;
	                }
					if(registerForm.idDuplication.value == ""){
						 alert("이메일 중복체크를 해주세요")
						 return false;
					}

	            	//비밀번호 확인 
	            	if(memberPw.value == ""){
	            		alert("사용하실 비밀번호를 입력해주세요");
	            		memberPw.focus();
	            		return false;
	            	} 
	            	if(memberPw.value == memberEmail.value || memberPw.value == words[0] || memberPw.value == words[1]){
	                    alert("아이디와 동일한 비밀번호를 사용할 수 없습니다.")
	                    pw.focus();
	                    return false;
	                }
	            	if(!regPw.test(memberPw.value)){
	                    alert("비밀번호는 8~12자의 영문자와 숫자를 포함해야합니다(특수문자 제외)")
	                    memberPw.focus();
	                    return false;
	                }
	            	
	            	
	            	//비밀번호 일치 확인 
	            	if(memberPwChk.value == ""){
	            		alert("비밀번호를 한번 더 확인해주세요");
	            		memberPwChk.focus();
	            		return false;
	            	}
	            	if(memberPw.value != memberPwChk.value){
	            		alert("비밀번호가 맞지 않습니다. 다시 확인해주세요");
	            		memberPwChk.focus();
	            		return false;
	            	}
		            document.querySelector("#registerForm").submit();
	          	}
	            
	            
	            
	            
				
				
				
	            function emailCheck(){
	            	const memberEmail = document.getElementById("memberEmail").value;
	            	const memberName = document.getElementById("memberName").value;
	            	let memberGender = '';
	            	const memberPhone = document.getElementById("memberPhone").value;
	            	//라디오버튼 클릭한 값 저장
	            	const radioButtons = document.getElementsByName("memberGender");
					radioButtons.forEach((radio) => {  //forEach(item) item은 변수명이라 아무거나 써도 상관 없음
				        if (radio.checked) {
				            memberGender = radio.value;
				        }
				    });

					
					if(memberEmail.trim() != ""){
		            	location.href="/member/stdEmailCheck.do?memberEmail="+memberEmail+"&memberName="+memberName+"&memberGender="+memberGender+"&memberPhone="+memberPhone;
// 	            		var newUrl = "/member/register2.do";
// 	            		window.history.replaceState({}, document.title, newUrl);
						if('${isAvailable eq 'yes'}'){
	            		document.getElementsByName("idDuplication").value = "idCheck";  
// 	            		document.getElementById("eml_btn").disabled = true; // 버튼 비활성화
		            	return false;
						}
	            	}
					if('${isAvailable eq 'no'}' && document.querySelector("#registerForm").submit()){
						 alert("중복되는 이메일은 아이디로 사용할 수 없습니다. 다른 이메일을 입력해주세요")
						 memberEmail.focus();
						 return false;
					 }			
	            }
	            
	         // 아이디 입력란 값이 변경될 때 중복 확인 상태를 다시 "idUncheck"으로 변경
				document.getElementById("memberEmail").addEventListener("keydown", function() {
                document.getElementById("idDuplication").value = "idUncheck";
                document.getElementById("eml_btn").disabled = false; // 버튼 활성화
	            });
				
	         	
	           
	            
            
         </script>
        
    </body>
</html>