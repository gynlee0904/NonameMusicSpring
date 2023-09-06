<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>학생회원 마이페이지</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/member/mypage_std.css">
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


                    <section id="main_layer2">
                        <section id="profile1">
                        	<c:if test="${!empty sMember.proPicFilename }"><img src="../resources/nuploadFiles/${sMember.proPicFilename}" alt="사진" id="mypicture"></c:if>
							<c:if test="${empty sMember.proPicFilename }"><img src="../resources/images/profile_pic-removebg.png" alt="사진" id="mypicture" ></c:if>
                            
                        </section>
                        <section id="profile2">
                        	<p><b> ${sMember.memberName}(${sMember.memberGender})</b></p>
                            <p>${sMember.memberEmail}</p>
                            <p> ${sMember.memberPhone} </p>
                            <p><small>
                            	가입일 : <fmt:formatDate pattern="yyyy.MM.dd" value="${sMember.memberDate }"/>                           
                            </small></p>
                            
                        </section>
                        <section id="profile3">
                            <a href="#"><button type="button" id="changePw_btn" name="changePw">비밀번호 변경</button></a>
                            <a href="javascript:void(0)" onclick="checkDelete();"><button type="submit" id="delete_btn" name="delete">회원탈퇴</button></a>
                        </section>
                    </section>
    
                    <section id="main_layer3">
                        <section class="title">
                            <p><b>기본 정보</b></p>
                        </section>
                        <section id="current" class="data">
                            <ul>
                                <li ><a href="#" >수강 이력</a></li>
                                <li ><a href="#" >내가 올린 글</a></li>
                                <li ><a href="#" >내가 올린 리뷰</a></li>
                                <li ><a href="#" >찜 리스트</a></li>
                                <li ><a href="#" >내 지갑</a></li>
                            </ul>
                        </section>
                    </section>
    
                    <section id="main_layer4">
                        <section class="title">
                            <p><b>추가 정보</b></p></h3>
                        </section>
                        <section class="data">
                                <section id="choice_title">
                                    <ul>
                                        <li>희망하는 레슨 장소</li>
                                        <li>희망하는 레슨 방식</li>
                                        <li>희망하는 레슨</li>
                                        <li>선호하는 선생님 성별</li>
                                        <li>나의 현재 레벨 </li>
                                    </ul>  
                                </section>
                                <section id="choice_data">
                                    <ul>
                                        <li>
                                         <%--	${sMember.place} --%>
                                        	<c:if test="${sMember.place ne null && sMember.place.contains('visitTeacher')}">선생님 연습실에서 레슨</c:if>
                                        	<c:if test="${sMember.place.contains('visitTeacher') && sMember.place.contains('visitStudent')}">/</c:if>
                                       		<c:if test="${sMember.place ne null && sMember.place.contains('visitStudent')}">우리집으로 방문 희망</c:if>
                                       		<c:if test="${sMember.place eq null}">선택안함</c:if>
                                        </li>
                                        <li>
											<c:if test="${sMember.lesson ne null && sMember.lesson.contains('oneOnOne')}">1 대 1 레슨</c:if>
                                        	<c:if test="${sMember.lesson.contains('oneOnOne') && sMember.lesson.contains('group')}">/</c:if>
                                       		<c:if test="${sMember.lesson ne null && sMember.lesson.contains('group')}">친구와 함께 레슨</c:if>
                                       		<c:if test="${sMember.lesson eq null}">선택안함</c:if>
										</li>
                                        <li>
                                        	<c:if test="${sMember.lessonType eq 'basic' }">기초부터 차근히 배우고 싶어요.</c:if>
                                        	<c:if test="${sMember.lessonType eq 'wants' }">원하는 곡만 마스터하고 싶어요.</c:if>
                                        	<c:if test="${sMember.lessonType eq null}">선택안함</c:if>
                                        </li>
                                        <li>
											<c:if test="${sMember.tGender eq 'F' }">여성</c:if>
                                        	<c:if test="${sMember.tGender eq 'M' }">남성</c:if>
                                        	<c:if test="${sMember.tGender eq 'N' }">무관</c:if>
                                        	<c:if test="${sMember.tGender eq null}">선택안함</c:if>
										</li>
                                        <li>
											<c:if test="${sMember.myLevel eq 'low'}">하</c:if>
                                        	<c:if test="${sMember.myLevel eq 'middle'}">중</c:if>
                                        	<c:if test="${sMember.myLevel eq 'mhigh'}">중상</c:if>
                                        	<c:if test="${sMember.myLevel eq 'high'}">상</c:if>
                                        	<c:if test="${sMember.myLevel eq null}">선택안함</c:if>
										</li>
                                    </ul>
                                </section>
                        </section>
                    </section>
    
                    <section id="main_layer5">
                        <section class="title">
                            <p><b>하고싶은 말</b></p>
                        </section>
                        <section class="data">
                            <textarea spellcheck="false">${sMember.freeWords}</textarea>
                        </section>
                    </section>
	                <form action="/member/modify_std.do" method="get">
	                    <section id="main_layer6">
<%--                         <a href="/member/modify_std.do?memberEmail=${memberEmail}&position=std"> --%>
<!--                         	<button type="submit" id="modify_btn" name="modifyInfo">회원정보수정</button> -->
<!--                         </a> -->
	                        <input type="submit" id="modify_btn" name="modifyInfo" value="회원정보수정">
	                    </section>
	                </form>
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
        
        <script>
	    	function checkDelete(){
				const memberEmail = '${memberEmail}'
				if(confirm ("정말 탈퇴하시겠습니까? 탈퇴한 아이디는 다시 사용할수 없습니다")){
					location.href = "/member/delete.do?memberEmail="+memberEmail;
				}
				//확인(true) 눌렀을때만 탈퇴되도록  //취소누르면 실행문이 동작 안함 
			}
	    	
	    	
	    	
	    	
		</script> 
    </body>
</html>