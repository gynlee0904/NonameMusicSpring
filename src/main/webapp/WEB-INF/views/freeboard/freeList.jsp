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
        <title>글 목록</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/board/freeList.css">
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
                            <button class="menuBtn" id="menu_notice" onclick="locate1()">공지사항</button>
                            <button class="menuBtn" id="menu_free" onclick="locate2()">자유게시판</button> 
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
                        
                            
                            <table>
                                <colgroup>
                                    <col width="10%">
                                    <col width="50%">
                                    <col width="10%">
                                    <col width="15%">
                                    <col width="15%">
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>글제목</th>
                                        <th>글쓴이</th>
                                        <th>작성일</th>
                                        <th>조회수</th>
                                    </tr>
                                </thead>
                                
                                <tbody>
                                	<c:forEach var="freeboard" items="${fList}" varStatus="i">
	                                    <tr>
	                                        <td class="align" nowrap>${freeboard.freeNo}</td> 
	                                        <td id="subject" nowrap>
	                                        	<c:if test="${!empty freeboard.freeFilename }"> ◎ <a href="/free/detail.do?freeNo=${ freeboard.freeNo }" class="subject"> ${freeboard.freeSubject} </a></c:if>
												<c:if test="${empty freeboard.freeFilename }"> &nbsp;&nbsp;&nbsp;&nbsp; <a href="/free/detail.do?freeNo=${ freeboard.freeNo }" class="subject"> ${freeboard.freeSubject} </a></c:if>
	                                        </td> 
	                                        <td class="align"  nowrap>
	                                        	<c:set var="wrterNmLength" value="${fn:length(freeboard.freeWriter)}"/>
	                                        		<c:choose>
	                                        			<c:when test="${fn:length(freeboard.freeWriter)}>1">
	                                        				<c:out value='${fn:substring(freeboard.freeWriter,0,1) }'/>*<c:out value='${fn:substring(freeboard.freeWriter,1+1,3) }'/>
	                                        			</c:when>
	                                        			<c:otherwise><c:out value="${freeboard.freeWriter}"/></c:otherwise>
	                                        		</c:choose>
<%-- 	                                        	${freeboard.freeWriter}</td> --%>
	                                        <td class="align" nowrap>
	                                        	<fmt:formatDate pattern="yy/MM/dd HH:mm:ss" value="${freeboard.uploadDate }"/>
	                                        </td>
	                                        <td class="align" nowrap>
	                                        	<fmt:formatNumber  pattern="###,###,###" value="12300"></fmt:formatNumber>
	                                        </td>
	                                    </tr>
                                    </c:forEach>
                                </tbody>
							</table>
<!-- 							<div id="pageNavi"> -->
								 	
<!--                              </div> -->
                            <div id="table_footer">
		                        <form action="/free/search.do" method="get">
		                            <div id="search_wrap">
		                                <select name="searchCondition">
		                                    <option value="all">전체</option>
		                                    <option value="title">제목</option>
		                                    <option value="content">내용</option>
		                                    <option value="writer">작성자</option>
		                                </select>
		                                <div class="search-box">
		                                    <input type="search" name="searchKeyword" placeholder="검색어를 입력하세요">
		                                    <input type="submit" value="검색">
		                                </div>
		                            </div>
		                        </form>
	                        
	                        	<div id="count_nav">
									<c:forEach begin="${pInfo.startNavi}" end="${pInfo.endNavi}"  var="p">
										<c:url var="pageUrl" value="/free/list.do" >
											<c:param name="page" value="${p}"></c:param>
										</c:url>	
										<p><a href="${pageUrl}"> ${p}</a>&nbsp;&nbsp;</p>
									</c:forEach> 
		                        </div>
	                        
		                        <div id="btn">
		                            <button type="button" name ="uploadBtn" id="uploadBtn" onclick="location.href='/free/insert.do'">글작성</button>
		                            <button type="button" name ="listBtn" id="listBtn" onclick="location.href='/free/list.do?page=1'">첫페이지로</button>
		                        </div>    
	                    	</div>
	                </section>
	            </section>
	        </div>
	    </main>
	</div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
        <script>
//             function toggleButton(buttonNumber) {
//                 var buttons = document.getElementsByClassName('menuBtn');
//                 for (var i = 0; i < buttons.length; i++) {
//                     if (i === buttonNumber - 1) {
//                         buttons[i].classList.add('active');
//                     } else {
//                         buttons[i].classList.remove('active');
//                     }
//                     //buttons[0].active = location.href='/free/list.do?currentPage=1'
//  	                //buttons[1].active = location.href='/board/list.do?currentPage=1'
// 					//이동 하고나서 색 바꾸도록 
//                 }
//             }

            function locate1 (){
                location.href='/notice/list.do'
            }
            function locate2 (){
                location.href='/free/list.do'
            }

           


        </script>
        
    </body>
</html>