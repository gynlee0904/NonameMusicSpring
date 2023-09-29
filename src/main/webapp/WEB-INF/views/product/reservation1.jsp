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
    	
    	
    </head>


    <body>
        <div id="container">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>  
			<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>  

 <!-- **************************************************************************** -->
            
            <main>
                <section id="main_layer1">
                    <div id="main1_part1">
                        <div id="img">
                             <img src="../resources/cuploadFiles/${classOne.classFileRename }" id="thumbnail">
                        </div>
                        
                    </div>
                    <div id="main1_part2">
                        <div class="classTitle">
                        
                            <h1 id="h1">피아노 원데이 클래스</h1>
                            <div class="like">
								<button class="heart-button" id="like" onclick="bookmarkBtn();">
									<c:if test="${bmkYn == 1 }"> <!-- 북마크 했음 --> 
										<i class="bi bi-heart-fill bmk-img"></i>
									</c:if>
									<c:if test="${bmkYn == 0 }">  <!-- 북마크 안했음 --> 
										<i class="bi bi-heart no-bmk-img"></i>
									</c:if>
								</button>
							</div>
                        </div>
                        <div>
                            <div id="t_score">
                                <p><i class="bi bi-check2-square"></i> 진행강사 : ${classOne.classWriter } </p>
                                <div id="starScore">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-half"></i>
                                    <i class="bi bi-star"></i>
                                </div>
                                <div>(12)</div>
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

                            <div id="bigstar">
                                <i class="bi bi-star"></i>
                                <!-- <i class="bi bi-star-half"></i>
                                <i class="bi bi-star-fill"></i> -->

                                <i class="bi bi-star"></i>
                                <!-- <i class="bi bi-star-half"></i>
                                <i class="bi bi-star-fill"></i> -->

                                <i class="bi bi-star"></i>
                                <!-- <i class="bi bi-star-half"></i>
                                <i class="bi bi-star-fill"></i> -->

                                <i class="bi bi-star"></i>
                                <!-- <i class="bi bi-star-half"></i>
                                <i class="bi bi-star-fill"></i> -->

                                <i class="bi bi-star"></i>
                                <!-- <i class="bi bi-star-half"></i>
                                <i class="bi bi-star-fill"></i> -->                                
                            </div>

                            <div id="bigScore2">
                                <strong>5.0</strong>
                                <small>&nbsp;(3개의 리뷰)</small>
                            </div>

                            <div id="write_rvw">
                                <button id="writeRvwBtn" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">리뷰남기기</button>
                            	
                            	
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
								      
								      <div class="modal-body" style="height:200px;">
							        	<textarea name="classReviewContent" style="width:100%; height:70%;" spellcheck="false"></textarea>
							          	<div class="d-flex" style=" height:30%;">
								        	<input type="file" name="uploadFile"  id="file" value="이미지첨부하기">
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
	           </div>

                    <div id="main5_part2">
                        <div id="photo_review">
                            <a href="#">
                            	<div class="card"></div>
                            </a>
                            <a href="#">
                            	<div class="card"></div>
                            </a>
                            <a href="#">
                            	<div class="card"></div>
                            </a>
                            <a href="#">
                            	<div class="card"></div>
                            </a>
                            <a href="#">
                            	<div class="card"></div>
                            </a>
                        </div>
                        <div id="next_btn">
                            <i class="bi bi-chevron-compact-right"></i>
                        </div>
                    </div>
                </section>
                
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
	                				<p>별점</p>
	                				<p>${classReview.classReviewWriter }</p>
	                				<p>${classReview.cReviewCreateDate }</p>
	                			</div>
	                			<div>
	                				<div class="review_edit_btn">
	                                    <!-- 리뷰 수정폼 오픈 -->
	                                    <button type="button" id="reviewModifyFormBtn" >수정</button>
	                                    
	                                    <!-- 리뷰삭제버튼 -->
	                                    <c:url var="delRReviewUrl" value="">
	                                        <c:param name="classReviewNo" value="${classReview.classReviewNo }"/>
	                                        <c:param name="refClassNo" value="${classReview.refClassNo }"/> 
	                                   		<c:param name="classReviewWriter" value="${classReview.classReviewWriter }"/> <!-- 자기가쓴댓글만 삭제하도록 -->
	                                    </c:url>    
	                                    <button type="button" id="reviewdeleteBtn" onclick="deleteReview('${delRReviewUrl}');">삭제</button>
	                                </div>
	                			</div>
	                			
	                		</div>
	                		<div id="rvwContent">
	                			${classReview.classReviewContent }
	                		</div>
	                		<div id="rvwPic">
	                			<img src="../resources/ruploadFiles/${classReview.classReviewFileRename }" alt="#">
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
	     	
	     	//리뷰등록 
	     	function insertReview(){
	     		alert("ss");
	     		
	     	}
        
        </script>
        
    </body>
</html>