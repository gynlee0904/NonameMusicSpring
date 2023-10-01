<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${classOne.classTitle } - ${classOne.classWriter }T </title>
        <!-- 부트스트랩 css CDN -->
<!--     	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous"> -->
        <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
        
        
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/product/reservation1.css">
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
        
        <!--Bootstrap 아이콘cdn -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
        
        <!-- JQuery CDN -->
		<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    	
    	
    </head>


    <body>
        <div id="container">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>  
			<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>  

 <!-- **************************************************************************** -->
            
            <main>
                <section id="main_layer1">
                    <div id="main1_part1">
                        <div id="classThumbnail">
                             <img src="../resources/cuploadFiles/${classOne.classFileRename }" id="thumbnail">
                        </div>
                        
                    </div>
                    <div id="main1_part2">
                        <div class="classTitle d-flex" >
                        
                            <h1 id="h1">${classOne.classTitle }
								<button class="heart-button" id="like" onclick="bookmarkBtn();">
									<c:if test="${bmkYn == 1 }"> <!-- 북마크 했음 --> 
										<i class="bi bi-heart-fill bmk-img"></i>
									</c:if>
									<c:if test="${bmkYn == 0 }">  <!-- 북마크 안했음 --> 
										<i class="bi bi-heart no-bmk-img" ></i>
									</c:if>
								</button>
							</h1>
                        </div>
                        <div>
                            <div id="t_score">
                                <p><i class="bi bi-check2-square"></i> 진행강사 : ${classOne.classWriter } </p>
                                <div id="starScore" class="starRating""></div>
                                <div>(${totalReviewCount})</div>
                                <div><button id="rv_btn">리뷰</button></div>
                            </div>
                            <div id="t_info">
	                            <p><i class="bi bi-check2-square"></i> 진행 요일 : ${classOne.classDay }</p>
	                            <p><i class="bi bi-check2-square"></i> 진행 시간 : ${classOne.classTime }</p>
	                            <p><i class="bi bi-check2-square"></i> 1일 ${classOne.classPrice }</p>
                            </div>
                        </div>
                        <div class="button">
                            <button class="reserve_btn">예약하기</button>
                            <button class="ask_btn">문의하기</button>
                        </div>
                    </div>
                </section>

                <section id="main_layer2">
                    <div class="title">
                        선생님 정보 
                    </div>
                    <div class="data">
                    	${tMember.history }
<!--                         <i class="bi bi-check"></i>냐냔냐<br> -->
<!--                         <i class="bi bi-check"></i>냐냔냐<br> -->
<!--                         <i class="bi bi-check"></i>냐냔냐<br> -->
<!--                         <i class="bi bi-check"></i>냐냔냐<br> -->
<!--                         <i class="bi bi-check"></i>냐냔냐<br> -->
<!--                         <i class="bi bi-check"></i>냐냔냐<br> -->
                    </div>
                </section>

                <section id="main_layer3">
                    <div class="title">
                        수강대상 
                    </div>
                    <div class="data">
                    		${classOne.classTarget }
<!--                         <i class="bi bi-check"></i>냐냔냐<br> -->
<!--                         <i class="bi bi-check"></i>냐냔냐<br> -->
<!--                         <i class="bi bi-check"></i>냐냔냐<br> -->
<!--                         <i class="bi bi-check"></i>냐냔냐<br> -->
<!--                         <i class="bi bi-check"></i>냐냔냐<br> -->
<!--                         <i class="bi bi-check"></i>냐냔냐<br> -->
                    </div>
                </section>

                <section id="main_layer4">
                    <div class="title">
                        수업진행과정
                    </div>
                    <div class="data"> 
                    	${classOne.classProgress }
<!--                         <i class="bi bi-check"></i>냐냔냐<br> -->
<!--                         <i class="bi bi-check"></i>냐냔냐<br> -->
<!--                         <i class="bi bi-check"></i>냐냔냐<br> -->
<!--                         <i class="bi bi-check"></i>냐냔냐<br> -->
<!--                         <i class="bi bi-check"></i>냐냔냐<br> -->
<!--                         <i class="bi bi-check"></i>냐냔냐<br> -->
                    </div>
                </section>

                <section id="main_layer5">
                    <div id="main5_part1">
                        <div id="starScore_wrap">
                            <div id="bigScore">
                                <h2 id="h2">리뷰</h2>
                            </div>

                            <div id="bigstar" class="starRating"></div>

                            <div id="bigScore2">
                                <strong>평점 ${totalReviewAvg}</strong>
                                <small>&nbsp;(${totalReviewCount}개의 리뷰)</small>
                            </div>

                            <div id="write_rvw">
                                <button id="writeRvwBtn" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">리뷰남기기</button>
                            </div>	
                          	<!-- Modal -->
                          	<form action="/review/insert.do" method="post" enctype="multipart/form-data" >
							<input type="hidden" name=refClassNo value="${classOne.classNo}">
								<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog modal-dialog-centered" >
								    <div class="modal-content">
								      <div class="modal-header">
								        <h1 class="modal-title fs-5" id="exampleModalLabel">리뷰남기기</h1>
								        <input type="hidden" name="classReviewWriter">
								        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								      </div>
								      
								      <div class="modal-body" style="height:250px;">
							        	<textarea name="classReviewContent" style="width:100%; height:70%;" spellcheck="false"></textarea>
							          	<div id="input" class="" style=" height:30%;">
							          		<div id="fileInput">
									        	<input type="file" name="uploadFile" >
							          		</div>
											<!-- 별점 -->
							        	   	<div class="rate">
				                                <input type="radio" id="rating10" name="cReviewStar" value="5"><label for="rating10" title="5점"></label>
				                                <input type="radio" id="rating9" name="cReviewStar" value="4.5"><label class="half" for="rating9" title="4.5점"></label>
				                                <input type="radio" id="rating8" name="cReviewStar" value="4"><label for="rating8" title="4점"></label>
				                                <input type="radio" id="rating7" name="cReviewStar" value="3.5"><label class="half" for="rating7" title="3.5점"></label>
				                                <input type="radio" id="rating6" name="cReviewStar" value="3"><label for="rating6" title="3점"></label>
				                                <input type="radio" id="rating5" name="cReviewStar" value="2.5"><label class="half" for="rating5" title="2.5점"></label>
				                                <input type="radio" id="rating4" name="cReviewStar" value="2"><label for="rating4" title="2점"></label>
				                                <input type="radio" id="rating3" name="cReviewStar" value="1.5"><label class="half" for="rating3" title="1.5점"></label>
				                                <input type="radio" id="rating2" name="cReviewStar" value="1"><label for="rating2" title="1점"></label>
				                                <input type="radio" id="rating1" name="cReviewStar" value="0.5"><label class="half" for="rating1" title="0.5점"></label>
				                            </div>
								        </div>
							      	  </div>
								      	
								      <div class="modal-footer">
								        <button type="button" id="closeReview" data-bs-dismiss="modal">취소</button>
								        <button type="submit" id="insertReview">등록하기</button>
								      </div>
								    </div>
								  </div>
								</div>
							</form>
		               </div>
		           </div>

                    <div id="main5_part2">
                        <div id="photo_review">
                        	<c:forEach var="classReview" items="${cReviewList}" >
<%--                         	<c:url var="detailReviewUrl" value=""> --%>
<%-- 	                            <c:param name="classReviewNo" value="${classReview.classReviewNo }"/> --%>
<%-- 	                            <c:param name="refClassNo" value="${classReview.refClassNo }"/>  --%>
<%-- 	                       		<c:param name="classReviewWriter" value="${classReview.classReviewWriter }"/> <!-- 자기가쓴댓글만 삭제하도록 --> --%>
<%--                        	 	</c:url>   --%>
                    
                            <c:if test="${!empty classReview.classReviewFileRename }">
	                            <a href="${detailReviewUrl }">
	                            	<div class="card">
	                            		<img src="../resources/ruploadFiles/${classReview.classReviewFileRename }" alt="#">
	                            	</div>
                            	</a>
                			</c:if>
	                            
                            </c:forEach>
                        </div>

                        <div id="next_btn">
                        <c:if test="${!empty classReview.classReviewFileRename }">
                            <i class="bi bi-chevron-compact-right"></i>
                        </c:if>
                        </div>
                    </div>
                </section>
                
                <!-- 리뷰 리스트 -->
                <section id="main_layer6">
	                <c:if test="${cReviewList eq null}">
		               	<div class="no-review">
			              	<span>${msg}</span>
		               	</div>       			
	       			</c:if>
	       			
	       			<c:forEach var="classReview" items="${cReviewList}" > 
	                	<div id="rvwBox">
	                		<div id="rvwInfo">
	                			<div>
	                				<p><span class="reviewScore">${classReview.cReviewStar }</span></p>
	                				<p>${classReview.classReviewWriter }</p>
	                				<p><fmt:formatDate pattern="yyyy.MM.dd" value="${classReview.cReviewCreateDate }"/></p>
	                				
	                			</div>
	                			<div>
	                				<div class="review_edit_btn">
	                                    <!-- 리뷰 수정폼 오픈 -->
	                                    <button type="button" id="reviewModifyFormBtn" >수정</button>
	                                    
	                                    <!-- 리뷰삭제버튼 -->
	                                    <c:url var="delReviewUrl" value="">
	                                        <c:param name="classReviewNo" value="${classReview.classReviewNo }"/>
	                                        <c:param name="refClassNo" value="${classReview.refClassNo }"/> 
	                                   		<c:param name="classReviewWriter" value="${classReview.classReviewWriter }"/> <!-- 자기가쓴댓글만 삭제하도록 -->
	                                    </c:url>    
	                                    <button type="button" id="reviewdeleteBtn" onclick="deleteReview('${delReviewUrl}');">삭제</button>
	                                </div>
	                			</div>
	                			
	                		</div>
	                		<div id="rvwContent">
	                			${classReview.classReviewContent }
	                		</div>
	                		<div id="rvwPic">
	                			<c:if test="${!empty classReview.classReviewFileRename }">
	                				<img src="../resources/ruploadFiles/${classReview.classReviewFileRename }" alt="#">
	                			</c:if>
	                		</div>
	                	</div>
                	</c:forEach>
                	
                	
                	<div id="rvwPageNavi"></div>
                	
                </section>


<!--                 <section id="main_layer7"> -->
<!--                     <button class="reserve_btn">예약하기</button>   -->
<!--                 </section> -->
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
        <!-- 부트스트랩 CDN -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
        
        <script>
	     	// 북마크 클릭
			function bookmarkBtn() {
				const bmkYn = '${bmkYn}';
				const classNo = '${classOne.classNo}'
				if(bmkYn == 1) { //북마크 이미 눌렀을 때 
					if(confirm("북마크를 취소하시겠습니까?")) {
						location.href = "/product/delete_bmk.do?refClassNo=" + classNo;
					}
				}else { //북마크 안눌렀을 때
					if(confirm("북마크하시겠습니까?")) {
						location.href = "/product/insert_bmk.do?refClassNo=" + classNo;
					}
				}
			}
	     	
	     	//별점 평점(0.0 ~ 5.0)
	        const rating = ${totalReviewAvg};
	
	        // 별 아이콘을 표시할 엘리먼트
	        const starRating = document.querySelectorAll('.starRating');
	
	        // 별 아이콘을 생성하여 엘리먼트에 추가
	        function createStarIcons(rating) {
	        	
	        	const fullStars = Math.floor(rating);
	            const halfStar = (rating % 1) >= 0.5;
	            const emptyStars = 5 - fullStars - (halfStar ? 1 : 0);
	            let starIcons = '';
	
	            for (let i = 0; i < fullStars; i++) {
	                starIcons += '<i class="bi bi-star-fill"></i> ';
	            }
	
	            if (halfStar) {
	                starIcons += '<i class="bi bi-star-half"></i> ';
	            }
	
	            for (let i = 0; i < emptyStars; i++) {
	                starIcons += '<i class="bi bi-star"></i> ';
	            }
	            return starIcons;
	        }
	        // 각 엘리먼트에 동일한 별점 설정
	        starRating.forEach((element) => {
	            element.innerHTML = createStarIcons(rating);
	        });
	        
	        
	     
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	        
	      //별점 평점(0.0 ~ 5.0)

	        const score = ${totalReviewAvg};
	
	        // 별 아이콘을 표시할 엘리먼트
	        const reviewScore = document.querySelectorAll('.reviewScore');
	
	        // 별 아이콘을 생성하여 엘리먼트에 추가
	        function createStarScores(score) {
	        	
	        	const fullStars = Math.floor(score);
	            const halfStar = (score % 1) >= 0.5;
	            const emptyStars = 5 - fullStars - (halfStar ? 1 : 0);
	            let starIcons = '';
	
	            for (let i = 0; i < fullStars; i++) {
	                starIcons += '<i class="bi bi-star-fill"></i> ';
	            }
	
	            if (halfStar) {
	                starIcons += '<i class="bi bi-star-half"></i> ';
	            }
	
	            for (let i = 0; i < emptyStars; i++) {
	                starIcons += '<i class="bi bi-star"></i> ';
	            }
	            return starIcons;
	        }
	        // 각 엘리먼트에 동일한 별점 설정
	        reviewScore.forEach((element) => {
	            element.innerHTML = createStarScores(score);
	        });
	        
	      
	     	
	     
        
        </script>
        
    </body>
</html>