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
        <title>공지 보기</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/board/freeDetail.css">
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

 <!-- **************************************************************************** -->
            
            <main>
                <div id="whole_layer">

                    <aside id="aside">
                        <div id="aside_layer1"></div>
                        <div id="menu_container">
                            <button class="menuBtn" id="menu_notice" onclick="toggleButton(1); locate1();">공지사항</button>
                            <button class="menuBtn" id="menu_free" onclick="toggleButton(2); locate2();">자유게시판</button> 
                            <button class="menuBtn" id="menu_playing" onclick="toggleButton(3)">연주 영상</button>
                            <button class="menuBtn" id="menu_market" onclick="toggleButton(4)">거래게시판</button>
                        </div>
                        <div id="aside_layer3"></div>
                    </aside>
                    
                    <section id="main_layer1">
                        <section id="board_name">
                            <h1>자유게시판</h1>
                        </section>
                        
                        <section id="board_content">
                            <div id="content_wrap">
                                <div id="freeSubject">${freeboard.freeSubject}</div>
                                <div id="freeboardview">
									<fmt:formatDate pattern="yy/MM/dd HH:mm:ss" value="${freeboard.uploadDate}"/>, 조회수
								</div>
								
                                <div id="freeContent">
                                	<c:if test="${!empty freeboard.freeFilename }"><img src="../resources/nuploadFiles/${freeboard.freeFilename }" alt="#"  ><br>${freeboard.freeContent}</c:if>
									<c:if test="${empty freeboard.freeFilename }"> ${freeboard.freeContent}</c:if>
                                </div>
                                <div id="file_wrap">
                                    <div>
                                        ${freeboard.freeFilename}
                                    </div>
                                    <div>
                                        <input type="text" name="freeWriter" placeholder="작성자" value="${freeboard.freeWriter}">
                                        <c:set var="wrterNmLength" value="${fn:length(freeboard.freeWriter)}"/>
                                  		<c:choose>
                                   			<c:when test="${fn:length(freeboard.freeWriter)}>1">
                                   				<c:out value='${fn:substring(freeboard.freeWriter,0,1) }'/>*<c:out value='${fn:substring(freeboard.freeWriter,2,3) }'/>
                                   			</c:when>
                                   			<c:otherwise><c:out value="${freeboard.freeWriter}"/></c:otherwise>
                                    	</c:choose>
                                    
                                    </div>
                                </div>
                            </div>
                            <div id="btn_wrap">
                                <div>
                                    <button id="listBackBtn" >돌아가기</button>
                                </div>
                                <div>
                                    <input type="submit" name="" value="수정">
                                    <a href="/free/delete.do?freeNo=${freeboard.freeNo }"><button id="deleteBtn" >삭제</button></a>
                                </div>
                            </div>	
<!-- ************************************************************************************************************ -->
                            <br>
                            
                            <section id="comment_layer">
                                <section id="commentOpenBtn">
                                    <button id="viewComments">
                                        Comments 'count'
                                    </button>
                                </section>
                                <section id="commen_list">
                                    <ul>
                                        <li>
                                            <div class="commen">
                                                <div class="div_border">
                                                    댓글번호 - 댓작성자  // 작성일자
                                                </div>
                                                <div class="div_border" id="comments_content">
                                                    댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
                                                </div>
                                                <div class="div_border">
                                                    답글달기버튼 //수정, 삭제버튼 
                                                </div>
                                            </div>
                                        </li>
                                        
                                    </ul>
                                </section>
                                <section>
                                    댓글달기란,댓글달기버튼
                                </section>
                            </section>
                        </section>
                    </section>
                </div>
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
        
	       	<script>
	            function toggleButton(buttonNumber) {
	                var buttons = document.getElementsByClassName('menuBtn');
	                for (var i = 0; i < buttons.length; i++) {
	                    if (i === buttonNumber - 1) {
	                        buttons[i].classList.add('active');
	                    } else {
	                        buttons[i].classList.remove('active');
	                    }
	// 	                buttons[0].active = location.href='/notice/list.do?currentPage=1'
	// 	                buttons[1].active = location.href='/board/list.do?currentPage=1'
						//이동 하고나서 색 바꾸도록 
	                }
	            }
	
	            function locate1 (){
	                location.href='/notice/list.do?page=1'
	            }
	            function locate2 (){
	                location.href='/free/list.do?page=1'
	            }
	
	      </script>
              
    </body>
</html>