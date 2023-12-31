<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>학생회원 정보수정</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/member/modifyInfo_std.css">
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
                    <h1>회원 정보 수정</h1>
                </section>
                
                <form action="/member/modify_std.do" method="post" enctype="multipart/form-data">
                	<input type="hidden" name="memberEmail" value="${sMember.memberEmail}"> 
                	<input type="hidden" name="position" value="std"> 
                    <section id="main_layer2">
                        <section class="title">
                            <p><b>필수 정보</b></p>
                        </section>
                        <section class="data">
                        	<table id="tbl_1">
                                <tr>
                                    <td class="line1">이름</td>
                                    <td  colspan="2" class="line2">
                                        <input type="text" name="memberName" id="name" value="${sMember.memberName}" readonly>
<%--                                     	<p id="name"> ${sMember.memberName} </p> --%>
                                    </td>
                                    <!-- <td></td> -->
                                </tr>
                                <tr>
                                    <td class="line1">휴대폰번호</td>
                                    <td class="line2">
                                        <input type="text" name="memberPhone" class="input" value="${sMember.memberPhone}">
                                    </td>
                                    <td class="line4">
                                        <div id="phn_chked">휴대폰인증</div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="line1">PW</td>
                                    <td colspan="2">
                                        <input type="password" name="memberPw" class="input" placeholder="현재 사용하시는 비밀번호를 입력해 주세요.">
                                    </td>
                                    <!-- <td></td> -->
                                </tr>
                            </table>
                        </section>
                    </section>
    
                    <section id="main_layer3">
                        <section class="title">
                            <p><b>추가 정보</b></p>
                        </section>
                        <section class="data">
                            <table id="tbl_2">
                                <tr class="line">
                                    <td >프로필 사진</td> 
                                    <td >
                                        <input type="file" name="uploadFile" >
                                    </td>
                                </tr>
                                <tr class="line">
                                    <td>희망하는 레슨장소</td>
                                    <td>
                                        <label><input type="checkbox" name="place" value="visitTeacher" <c:if test="${sMember.place ne null && sMember.place.contains('visitTeacher')}">checked</c:if> >&nbsp;&nbsp;선생님 연습실에서 레슨</label><br>
                                        <label><input type="checkbox" name="place" value="visitStudent" <c:if test="${sMember.place ne null && sMember.place.contains('visitStudent')}">checked</c:if> >&nbsp;&nbsp;우리집으로 방문 희망</label>

                                </td >
                                </tr>
                                <tr class="line">
                                    <td >희망하는 레슨 방식</td>
                                    <td >
                                        <label><input type="checkbox" name="lesson" value="oneOnOne" <c:if test="${sMember.lesson ne null && sMember.lesson.contains('oneOnOne')}">checked</c:if> >&nbsp;&nbsp;1 대 1 레슨</label><br>
                                        <label><input type="checkbox" name="lesson" value="group" <c:if test="${sMember.lesson ne null && sMember.lesson.contains('group')}">checked</c:if> >&nbsp;&nbsp;친구와 함께 레슨</label>
                                    </td>
                                </tr>
                                <tr class="line">
                                    <td >희망하는 레슨</td>
                                    <td >
                                        <label><input type="radio" name="lessonType" class="ipt_chkbx" value="basic" <c:if test="${ sMember.lessonType eq 'basic' }">checked</c:if> >&nbsp;&nbsp;기초부터 차근히 배우고 싶어요.</label><br>
                                        <label><input type="radio" name="lessonType" class="ipt_chkbx" value="wants" <c:if test="${ sMember.lessonType eq 'wants' }">checked</c:if> >&nbsp;&nbsp;원하는 곡만 마스터하고 싶어요.</label>
                                    </td>
                                </tr>
                                <tr class="line">
                                    <td >선호하는 선생님 성별</td>
                                    <td >
                                        <label><input type="radio" name="tGender" class="ipt_chkbx" value="F" <c:if test="${ sMember.tGender eq 'F' }">checked</c:if> >&nbsp;&nbsp;여성</label>&nbsp;&nbsp;
                                        <label><input type="radio" name="tGender" class="ipt_chkbx" value="M" <c:if test="${ sMember.tGender eq 'M' }">checked</c:if> >&nbsp;&nbsp;남성</label>&nbsp;&nbsp;
                                        <label><input type="radio" name="tGender" class="ipt_chkbx" value="N" <c:if test="${ sMember.tGender eq 'N' }">checked</c:if> >&nbsp;&nbsp;무관</label>
                                    </td>
                                </tr>
                                <tr class="line">
                                    <td >나의 현재 레벨</td>
                                    <td >
                                        <label><input type="radio" name="myLevel" class="ipt_chkbx" value="low" <c:if test="${ sMember.myLevel eq 'low' }">checked</c:if> >&nbsp;&nbsp;하</label>&nbsp;&nbsp;
                                        <label><input type="radio" name="myLevel" class="ipt_chkbx" value="middle" <c:if test="${ sMember.myLevel eq 'middle' }">checked</c:if> >&nbsp;&nbsp;중</label>&nbsp;&nbsp;
                                        <label><input type="radio" name="myLevel" class="ipt_chkbx" value="mhigh" <c:if test="${ sMember.myLevel eq 'mhigh' }">checked</c:if> >&nbsp;&nbsp;중상</label>&nbsp;&nbsp;
                                        <label><input type="radio" name="myLevel" class="ipt_chkbx" value="high" <c:if test="${ sMember.myLevel eq 'high' }">checked</c:if> >&nbsp;&nbsp;상</label>
                                    </td>
                                </tr>
                            </table>
                        </section>
                    </section>
    
                    <section id="main_layer4">
                        <section class="title">
                            <p><b>하고싶은 말</b></p>
                        </section>
                        <div class="data">
                            <textarea rows="10" cols="60" name="freeWords" spellcheck="false" placeholder="${sMember.freeWords}"></textarea>
                        </div>
                    </section>
    
                    <section id="main_layer5">
                        <input type="submit" id="modify_btn" value="수정 완료"> </input>
                    </section>
                </form>
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
        <script>
//         	window.onload = function(){
<%--         		var selectedValues = <%= request.getParameterValues("place") %>; --%>
        		
//         		for (var i = 0; i < selectedValues.length; i++){
//         			var value= selectedValues[i];
//         			var checkBox = document.ceateElement("input");
//         			checkBox.type = "checkbox";
//         			checkBox.value = sMember.place;
//         			checkBox.checked = true;
//         		}
        		
//         	}
        
        </script>
    </body>
</html>