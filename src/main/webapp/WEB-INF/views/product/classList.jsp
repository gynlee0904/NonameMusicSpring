<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ClassList</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/product/classList.css">
        <link rel="stylesheet" href="../resources/css/footer.css">
        <link rel="stylesheet" href="../resources/css/reset.css">
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.css" />

        <!--헤더폰트-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Serif:wght@500&display=swap" rel="stylesheet">
        <!--본문폰트-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
    
        <!--Bootstrap 아이콘cdn -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    </head>

    <body>
        <div id="container">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>  
			<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>  

 <!-- **************************************************************************** -->
            
            <main>
                <section id="itemlist_head">
                    <div id="orderby">
                        <!-- 상세검색 -->
                        <select name="orderBy">
                            <option value="all">정렬하기</option>
                            <option value="all">가나다순</option>
                            <option value="title">별점높은순</option>
                            <option value="content">별점낮은순</option>
                            <option value="content">레슨많은순</option>
                            <option value="content">레슨적은순</option>
                            <option value="content">가격높은순</option>
                            <option value="content">가격낮은순</option>
                        </select>
                    </div>
 
                    <div id="item_search">
                        <div>
                            <form action="/notice/search.do" method="get">
                                <div id="search_wrap">
                                    <select name="searchCondition">
                                        <option value="all">전체</option>
                                        <option value="title">제목</option>
                                        <option value="content">선생님</option>
                                    </select>
                                    <div class="search-box">
                                        <input type="search" name="searchKeyword" placeholder="검색어를 입력하세요">
                                        <input type="submit" value="검색">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div>
                            상세검색
                        </div>
                    </div>
                </section>

                <section id="main_layer">
					<div id="prev_icon">
						<c:if test="${pInfo.startNavi != 1}">
							<c:url var="prevUrl" value="/product/all_class_list.do" >  
								<c:param name="currentPage" value="${pInfo.currentPage -1 }"></c:param> 								
							</c:url>
							<a href="${prevUrl}"><i class="bi bi-chevron-compact-left"></i></a>
						</c:if>
					</div>
					
					<div id=main_wrap">
					
	                    <div class="item_list">
		                    <c:if test="${cList eq null}">
			                	<div class="no_my_class">
		                	 	 	<span>${msg}</span>
			                	</div>
		                	</c:if>
		                	
							<c:forEach var="allClass" items="${cList}" varStatus="i">
	                        <div class="card">
	                        	<c:url  var="detailUrl" value="/product/class_detail.do">
									<c:param  name="classNo" value="${allClass.classNo }"></c:param>
<%-- 									<c:param  name="memberEmail" value="${memberEmail }"></c:param> --%>
								</c:url>
								<a href="${detailUrl}">
		                            <div class="img">
		                                <img src="../resources/cuploadFiles/${allClass.classFileRename }" alt="썸네일" >
		                            </div>
	                            </a>
	                            <div class="text">
	                                <h2>${allClass.classTitle }</h2>
	                                <div class="explain">
	                                    <p>${allClass.classTime } / ${allClass.classPrice }원</p>
	                                    <p>진행강사 : ${allClass.classWriter }</p>
	                                </div>
	                                
	                                <div class="watch">
	                                    <button type="button" onclick="showDetail('${detailUrl}');" id="showClass"><i class="bi bi-check-lg"></i>상세보기</button>
	                                </div>
	                            </div>
	                        </div>
	                        </c:forEach>
	                    </div>
	                    <div id="pageNavi">
<%-- 		                    <c:if test="${pInfo.startNavi != 1}"> --%>
<%-- 								<c:url var="prevUrl" value="/product/all_class_list.do" >   --%>
<%-- 									<c:param name="currentPage" value="${pInfo.startNavi -1 }"></c:param> 								 --%>
<%-- 								</c:url> --%>
<%-- 								<a href="${prevUrl}">[이전]&nbsp;&nbsp;</a> --%>
<%-- 							</c:if> --%>
						
							<c:forEach begin="${pInfo.startNavi}" end="${pInfo.endNavi}"  var="p">
								<c:url var="pageUrl" value="/product/all_class_list.do" >
									<c:param name="currentPage" value="${p}"></c:param>
								</c:url>	
								
								<c:choose>
				                    <c:when test="${p == pInfo.currentPage}">
				                    	<p><a href="${pageUrl}" style="color: #ccc"> ${p}</a>&nbsp;&nbsp;</p>
				                    </c:when>
				                    <c:otherwise>
				                        <p><a href="${pageUrl}"> ${p}</a>&nbsp;&nbsp;</p>
				                    </c:otherwise>
				                </c:choose>
							</c:forEach> 
							
<%-- 							<c:if test="${pInfo.endNavi != pInfo.naviTotalCount}"> --%>
<%-- 								<c:url var="nextUrl" value="/product/all_class_list.do" >   --%>
<%-- 									<c:param name="currentPage" value="${pInfo.endNavi + 1}"></c:param> 								 --%>
<%-- 								</c:url> --%>
<%-- 								<a href="${nextUrl}">[다음]</a> --%>
<%-- 							</c:if> --%>
	                    </div>
					</div>
					
					<div id="next_icon">
						<c:if test="${pInfo.currentPage != pInfo.naviTotalCount}">
							<c:url var="nextUrl" value="/product/all_class_list.do" >  
								<c:param name="currentPage" value="${pInfo.currentPage + 1}"></c:param> 								
							</c:url>
							<a href="${nextUrl}"><i class="bi bi-chevron-compact-right"></i></a>
						</c:if>
					</div>
                </section>
                
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
        <script src="https://cdn.jsdelivr.net/npm/swiper@10/swiper-bundle.min.js"></script>
        <script>
	      	function showDetail(url){
	      		location.href=url;  //location href라고 잘못 써서 이동이 안됐음 
	      	}
  
        </script>
        
    </body>
</html>