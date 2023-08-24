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
                    
                    <form action="/member/register2.do" method="post" enctype="multipart/form-data">
                        <section id="main_layer2">
                            <section id="e_title">
                                <p>필수정보</p>
                            </section>
            
                            <section id="e_data">
                            <input type="hidden" name="position" value="${register.position}"> 
                                <table id="tbl_1">
                                    <tr>
                                        <td class="line1">이름</td>
                                        <td class="line2">
                                            <input type="text" name="memberName" class="input" reqired>
        
                                        </td>
                                        <td class="line1">성별</td>
                                        <td class="line2">
                                            <input type="text" name="memberGender" class="input" reqired>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="line1">휴대폰번호</td>
                                        <td colspan="2" class="line2">
                                            <input type="text" name="memberPhone" class="input" reqired>
                                        </td>
                                        <td class="line4">
                                            <div id="phn_chked">휴대폰인증완료</div>
                                        </td>
                                        <!-- <td></td> -->
                                    </tr>
                                    <tr>
                                        <td class="line1">ID</td>
                                        <td colspan="2">
                                            <input type="text" name="memberEmail" class="input" placeholder="사용하시는 이메일을 입력해주세요." check_result="fail" reqired>
                                        </td>
                                        <td class="line4">
                                            <button type="button" id="eml_btn">이메일 확인</button>
                                        </td>
                                        <!-- <td></td> -->
                                    </tr>
                                    <tr>
                                        <td class="line1">PW</td>
                                        <td colspan="2">
                                            <input type="password" name="memberPw" class="input" placeholder="사용하실 비밀번호를 입력해 주세요." reqired>
                                        </td>
                                        
                                        <td></td>
                                        <!-- <td></td> -->
                                    </tr>
                                    <tr>
                                        <td class="line1">PW 확인</td>
                                        <td colspan="2">
                                            <input type="password" name="memberPwChk" class="input" placeholder="비밀번호를 한번 더 입력해 주세요." reqired>
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
                            <input type="submit" value="회원가입완료"> </input>
                        </section>
                    </form>
                </main>
            </div>

            <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
    </body>
</html>