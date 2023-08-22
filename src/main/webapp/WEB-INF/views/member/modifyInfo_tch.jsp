<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>강사회원 정보수정</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/member/modifyInfo_tch.css">
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

                <form action="" method="">
                    <section id="main_layer2">
                        <section class="title">
                            <p><b>필수 정보</b></p>
                        </section>
                        <section class="data">
                            <table id="tbl_1">
                                <tr>
                                    <td class="line1">이름</td>
                                    <td  colspan="2" class="line2">
                                        <input type="text" name="memberName" class="input" value="선 생 님 (남)" readonly>
                                    </td>
                                    <!-- <td></td> -->
                                </tr>
                                <tr>
                                    <td class="line1">휴대폰번호</td>
                                    <td class="line2">
                                        <input type="text" name="memberPhone" class="input">
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
                                        <input type="file" name="profile"  >
                                    </td>
                                </tr>
                                <tr class="line">
                                    <td>회당 레슨비</td>
                                    <td>
                                        <input type="text" id="pay"> 원 (50분기준)
                                </td >
                                </tr>
                                <tr class="line">
                                    <td>결제 방법</td>
                                    <td>
                                        <label><input type="checkbox" name="" value="" >&nbsp;&nbsp;ㅇㅇ페이</label><br>
                                        <label><input type="checkbox" name="" value="" >&nbsp;&nbsp;실시간 계좌이체</label>
                                </td >
                                </tr>
                                <tr class="line">
                                    <td>채팅가능시간</td>
                                    <td>
                                        <input type="text" placeholder="매일, 주말, 월수금.. ㅇㅇ시~ㅇㅇ시 / ㅁㅁ시~ㅁㅁ시" id="contact_time">
                                </td >
                                </tr>
                                <tr class="line">
                                    <td>희망하는 레슨장소</td>
                                    <td>
                                        <label><input type="checkbox" name="" value="" >&nbsp;&nbsp;내 연습실에서 레슨</label><br>
                                        <label><input type="checkbox" name="" value="" >&nbsp;&nbsp;학생 자택으로 방문 희망</label>
                                </td >
                                </tr>
                                <tr class="line">
                                    <td >희망하는 레슨 방식</td>
                                    <td >
                                        <label><input type="checkbox" name="" value="" >&nbsp;&nbsp;1 대 1 레슨</label><br>
                                        <label><input type="checkbox" name="" value="" >&nbsp;&nbsp;그룹 레슨</label>
                                    </td>
                                </tr>
                                <tr class="line">
                                    <td >희망하는 레슨</td>
                                    <td >
                                        <label><input type="checkbox" name="type" class="ipt_chkbx" value="" >&nbsp;&nbsp;기초부터 차근히</label><br>
                                        <label><input type="checkbox" name="type" class="ipt_chkbx" value="" >&nbsp;&nbsp;원하는 곡만 마스터</label>
                                    </td>
                                </tr>
                            </table>
                        </section>
                    </section>
    
                    <section id="main_layer4">
                        <section class="title">
                            <p><b>선생님 정보</b></p>
                        </section>
                        <div class="data">
                            <textarea placeholder="출신교, 경력, 레슨실 위치등을 적어주세요" name="history" spellcheck="false"></textarea>
                        </div>
                    </section>
    
                    <section id="main_layer5">
                        <section class="title">
                            <p><b>수강대상</b></p>
                        </section>
                        <div class="data">
                            <textarea placeholder="자유롭게 쓰세요" name="target" spellcheck="false"></textarea>
                        </div>
                    </section>

                    <section id="main_layer6">
                        <section class="title">
                            <p><b>하고싶은 말</b></p>
                        </section>
                        <div class="data">
                            <textarea placeholder="학생들에게 하고싶은 말을 자유롭게 쓰세요" name="freeWords" spellcheck="false"></textarea>
                        </div>
                    </section>
    
                    <section id="main_layer7">
                        <input type="submit" id="modify_btn" value="수정 완료"> </input>
                    </section>
                </form>
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
    </body>
</html>