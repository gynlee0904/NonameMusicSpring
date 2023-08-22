<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>강사회원 마이페이지</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/member/mypage_tch.css">
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
                    <h1>MY PAGE</h1>
                </section>

                <form action="" method="">
                    <section id="main_layer2">
                        <section id="profile1">
                            <img src="../resources/images/profile_pic-removebg.png" alt="사진" id="mypicture">
                        </section>
                        <section id="profile2">
                            <p><b>선 생 님 (남) </b></p>
                            <p> HGD001@naver.com</p>
                            <p> 010-0904-1011 </p>
                            <p><small>가입일 : 2023.08.13</small></p>
                        </section>
                        <section id="profile3">
                            <button type="button" id="changePw_btn" name="changePw" onclick="">비밀번호 변경</button>
                            <a href="javascript:void(0)" onclick="checkDelete();"><button type="submit" id="delete_btn" name="delete" value="">회원탈퇴</button></a>
                        </section>
                    </section>
    
                    <section id="main_layer3">
                        <section class="title">
                            <p><b>기본 정보</b></p>
                        </section>
                        <section id="current" class="data">
                            <ul>
                                <li ><a href="#" >내 클래스</a></li>
                                <li ><a href="#" >내가 올린 글</a></li>
                                <li ><a href="#" >레슨 이력</a></li>
                                <li ><a href="#" >내 지갑</a></li>
                            </ul>
                        </section>
                    </section>
    
                    <section id="main_layer4">
                        <section class="title">
                            <p><b>레슨 정보</b></p></h3>
                        </section>
                        <section class="data">
                                <section id="lesson_title">
                                    <ul>
                                        <li>회당 레슨비</li>
                                        <li>결제받는 방법</li>
                                        <li>연락가능시간</li>
                                    </ul>  
                                </section>
                                <section id="lesson_data">
                                    <ul>
                                        <li>50,000원 (50분 기준)</li>
                                        <li>ㅇㅇ페이 / 실시간계좌이체</li>
                                        <li>매일 9시 ~ 10시 / 21시 ~ 23시 </li>

                                    </ul>
                                </section>
                        </section>
                    </section>

                    <section id="main_layer5">
                        <section class="title">
                            <p><b>추가 정보</b></p></h3>
                        </section>
                        <section class="data">
                                <section id="choice_title">
                                    <ul>
                                        <li>희망하는 레슨 장소</li>
                                        <li>희망하는 레슨 방식</li>
                                        <li>희망하는 레슨</li>
                                        <li>결제방식</li>
                                    </ul>  
                                </section>
                                <section id="choice_data">
                                    <ul>
                                        <li>연습실 레슨</li>
                                        <li>1대일 레슨 / 친구와 함께 레슨</li>
                                        <li>원하는 곡만 마스터 </li>
                                        <li> 무관</li>
                                    </ul>
                                </section>
                        </section>
                    </section>

            
    
                    <section id="main_layer6">
                        <section class="title">
                            <p><b>선생님 정보</b></p>
                        </section>
                        <section class="data">
                            <textarea spellcheck="false" name="history">존나좋은학교출신 </textarea>
                        </section>
                    </section>

                    <section id="main_layer7">
                        <section class="title">
                            <p><b>수강대상</b></p>
                        </section>
                        <section class="data">
                            <textarea spellcheck="false" name="target" >존못부터 존잘까지 커버가능</textarea>
                        </section>
                    </section>

                    <section id="main_layer8">
                        <section class="title">
                            <p><b>하고싶은말</b></p>
                        </section>
                        <section class="data">
                            <textarea spellcheck="false" name="freeWords">피아노 잘가르침</textarea>
                        </section>
                    </section>
    
                    <section id="main_layer9">
                        <input type="submit" id="modify_btn" name="modifyInfo" value="회원정보수정">
                    </section>
                </form>
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
    </body>
</html>