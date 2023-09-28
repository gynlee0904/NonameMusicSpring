<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="./resources/css/header.css">
        <link rel="stylesheet" href="./resources/css/nav.css">
        <link rel="stylesheet" href="./resources/css/index.css">
        <link rel="stylesheet" href="./resources/css/footer.css">
        <link rel="stylesheet" href="./resources/css/reset.css">

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
                <section id="main_layer1"></section>

                <section id="main_layer2">
                    <section>
                        <div id="review">
                            <ul>
                                <li>Review</li>
                            </ul>
                        </div>
                        <div></div>
                    </section>
                    <section>
                        <div id="playing">
                            <ul>
                                <li>Play</li>
                            </ul>
                        </div>
                        <div id="video">
<!--                             <iframe width="390" height="200" src="https://www.youtube.com/embed/2qtKMC5wzkU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe> -->
                        </div>
                    </section>
                    <section>
                        <div id="board">
                            <ul>
                                <li>Board</li>
                            </ul>
                        </div>
                        <div>
                        	<table>
                                <colgroup>
                                    <col width="10%">
                                    <col width="70%">
<%--                                     <col width="10%"> --%>
                                    <col width="15%">
<%--                                     <col width="15%"> --%>
                                </colgroup>
                                <thead>
                                    <tr>
                                        <th >No.</th>
                                        <th>글제목</th>
<!--                                         <th>글쓴이</th> -->
                                        <th>작성일</th>
<!--                                         <th>조회수</th> -->
                                    </tr>
                                </thead>
                                
                                <tbody>
                                	<c:forEach var="board" items="${bList}" varStatus="i">
	                                    <tr>
	                                        <td class="align" nowrap>
	                                        	${(pInfo.totalCount - i.index) - ((pInfo.currentPage - 1)  *  15 ) }
	                                        </td> 
	                                        <td id="subject" nowrap>
	                                        	<c:if test="${!empty board.noticeFilename }"> ◎ <a href="/notice/detail.do?noticeNo=${ notice.noticeNo }" class="subject"> ${board.noticeSubject} </a></c:if>
												<c:if test="${empty board.noticeFilename }"> &nbsp;&nbsp;&nbsp;&nbsp; <a href="/notice/detail.do?noticeNo=${ notice.noticeNo }" class="subject"> ${board.noticeSubject} </a></c:if>
	                                        </td> 
	                                        <td class="align" nowrap>
	                                        	<fmt:formatDate pattern="yy/MM/dd HH:mm:ss" value="${board.nCreateDate }"/>
	                                        </td>
	                                    </tr>
                                    </c:forEach>
                                </tbody>
							</table>
                        </div>
                    </section>
                </section>
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
    </body>
</html>