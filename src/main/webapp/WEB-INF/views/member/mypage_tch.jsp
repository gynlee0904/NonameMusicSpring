<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

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

<!--                 <form action="/member/mypage.do" method="get"> -->
                    <section id="main_layer2">
                        <div id="profile1">
                            <c:if test="${!empty tMember.proPicFilename }"><img src="../resources/nuploadFiles/${tMember.proPicFilename}" alt="사진" id="mypicture"></c:if>
							<c:if test="${empty tMember.proPicFilename }"><img src="../resources/images/profile_pic-removebg.png" alt="사진" id="mypicture" ></c:if>
                        </div>
                        <div id="profile2">
                    		<p><b>${tMember.memberName}(${tMember.memberGender}) </b></p>
                            <p> ${tMember.memberEmail}</p>
                            <p> ${tMember.memberPhone} </p>
                            <p><small>가입일 : <fmt:formatDate pattern="yyyy.MM.dd" value="${tMember.memberDate }"/> 
                            <input type="hidden" name="position" value="tch"> 
                            </small></p>
                        </div>
                        <div id="profile3">
                            <button type="button" id="changePw_btn" name="changePw" onclick="">비밀번호 변경</button>
                            <a href="javascript:void(0)" onclick="checkDelete();"><button id="delete_btn" name="delete">회원탈퇴</button></a>
                        </div>
                    </section>
    
                    <section id="main_layer3">
                        <div class="title">
                            <p><b>기본 정보</b></p>
                        </div>
                        <div id="current" class="data">
                            <ul>
                            	<li >내 프로필 : 공개중</li>
                                <li ><a href="javascript:void(0)" onclick="goToMyClassList();">내 클래스</a></li>
                                <li ><a href="#" >내가 쓴 글</a></li>
                                <li ><a href="#" >레슨 이력</a></li>
                                <li ><a href="#" >내 지갑</a></li>
                            </ul>
                        </div>
                    </section>
    
                    <section id="main_layer4">
                        <div class="title">
                            <p><b>레슨 정보</b></p>
                        </div>
                        <div class="data">
	                        <div id="lesson_title">
	                            <ul>
	                                <li>회당 레슨비</li>
	                                <li>결제받는 방법</li>
	                                <li>연락가능시간</li>
	                            </ul>  
	                        </div>
	                        <div id="lesson_data">
	                            <ul>
	                                <li>${tMember.lessonFee} 원 (50분 기준)</li>
	                                <li>${tMember.payment}</li>
	                                <li>${tMember.contactTime} </li>
	
	                            </ul>
	                        </div>
                        </div>
                    </section>

                    <section id="main_layer5">
                        <div class="title">
                            <p><b>추가 정보</b></p>
                        </div>
                        <div class="data">
	                        <div id="choice_title">
	                            <ul>
	                                <li>희망하는 레슨 장소</li>
	                                <li>희망하는 레슨 방식</li>
	                                <li>희망하는 레슨</li>
	                            </ul>  
	                        </div>
	                        <div id="choice_data">
	                            <ul>
	                                <li>${tMember.place}</li>                           
	                                <li>${tMember.lesson} </li>
	                                <li>${tMember.lessonType}  </li>
	                            </ul>
	                        </div>
                        </div>
                    </section>

                    <section id="main_layer6">
                        <section class="title">
                            <p><b>선생님 정보</b></p>
                        </section>
                        <section class="data">
                            <textarea spellcheck="false" name="history">${tMember.history} </textarea>
                        </section>
                    </section>

                    <section id="main_layer7">
                        <section class="title">
                            <p><b>수강대상</b></p>
                        </section>
                        <section class="data">
                            <textarea spellcheck="false" name="target" >${tMember.target}</textarea>
                        </section>
                    </section>

                    <section id="main_layer8">
                        <section class="title">
                            <p><b>하고싶은말</b></p>
                        </section>
                        <section class="data">
                            <textarea spellcheck="false" name="freeWords">${tMember.freeWords}</textarea>
                        </section>
                    </section>
    
                    <section id="main_layer9">
                         <a href="/member/modify_tch.do?memberEmail=${memberEmail }"><button type="submit" id="modify_btn" name="modifyInfo" >회원정보수정</button></a>
                    </section>
<!--                 </form> -->
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
       
        <script>
        	//회원탈퇴하기
	    	function checkDelete(){
				const memberEmail = '${memberEmail}';
				if(confirm ("정말 탈퇴하시겠습니까? 탈퇴한 아이디는 다시 사용할수 없습니다")){
					location.href = "/member/delete_tch.do?memberEmail="+memberEmail;
				}
				//확인(true) 눌렀을때만 탈퇴되도록  //취소누르면 실행문이 동작 안함 
			}

	    	//마이 클래스 리스트 페이지로 이동 
	    	function goToMyClassList(){
	    		const memberEmail = '${memberEmail}';
	    		location.href = "/product/my_class_list.do?memberEmail="+memberEmail;
	    	}
		</script> 
    </body>
</html>