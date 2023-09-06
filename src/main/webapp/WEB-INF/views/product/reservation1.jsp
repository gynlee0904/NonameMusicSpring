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
                            <img src="#" alt="thumbnail" id="thumbnail" >
                        </div>
                        
                    </div>
                    <div id="main1_part2">
                        <div>
                            <h1>피아노 원데이 클래스 <i class="bi bi-heart"></i></h1>
                        </div>
                        <div>
                            <div id="t_score">
                                <p><i class="bi bi-check2-square"></i> 진행강사 : 서태우 </p>
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
                            <p><i class="bi bi-check2-square"></i> 진행 요일 : 화 / 목 / 토</p>
                            <p><i class="bi bi-check2-square"></i> 진행 시간 : 오전 10시 ~ 오후 1시 (3시간)</p>
                            <p><i class="bi bi-check2-square"></i> 1일 100,000원</p>
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
                        <i class="bi bi-check"></i>냐냔냐<br>
                        <i class="bi bi-check"></i>냐냔냐<br>
                        <i class="bi bi-check"></i>냐냔냐<br>
                        <i class="bi bi-check"></i>냐냔냐<br>
                        <i class="bi bi-check"></i>냐냔냐<br>
                        <i class="bi bi-check"></i>냐냔냐<br>
                    </div>
                </section>

                <section id="main_layer3">
                    <div class="title">
                        수강대상 
                    </div>
                    <div class="data">
                        <i class="bi bi-check"></i>냐냔냐<br>
                        <i class="bi bi-check"></i>냐냔냐<br>
                        <i class="bi bi-check"></i>냐냔냐<br>
                        <i class="bi bi-check"></i>냐냔냐<br>
                        <i class="bi bi-check"></i>냐냔냐<br>
                        <i class="bi bi-check"></i>냐냔냐<br>
                    </div>
                </section>

                <section id="main_layer4">
                    <div class="title">
                        수업진행과정
                    </div>
                    <div class="data"> 
                        <i class="bi bi-check"></i>냐냔냐<br>
                        <i class="bi bi-check"></i>냐냔냐<br>
                        <i class="bi bi-check"></i>냐냔냐<br>
                        <i class="bi bi-check"></i>냐냔냐<br>
                        <i class="bi bi-check"></i>냐냔냐<br>
                        <i class="bi bi-check"></i>냐냔냐<br>
                    </div>
                </section>

                <section id="main_layer5">
                    <div id="main5_part1">
                        <div id="starScore_wrap">
                            <div id="bigScore">
                                <h2>리뷰</h2>
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
                                <small>&nbsp(3개의 리뷰)</small>
                            </div>

                            <div id="write_rvw">
                                <button type="button">리뷰남기기</button>
                            </div>

                        </div>
                        
                    </div>

                    <div id="main5_part2">
                        <div id="photo_review">
                            <div class="card"></div>
                            <div class="card"></div>
                            <div class="card"></div>
                            <div class="card"></div>
                            <div class="card"></div>
                            <div class="card"></div>

                            
                        </div>
                        <div id="next_btn">
                            <i class="bi bi-chevron-compact-right"></i>
                        </div>
                    </div>
                </section>

                <section id="main_layer6">
                    <button id="openReviewBtn">
                        Review 'count'
                    </button>
                    <!-- <div id="openReview">
                    </div> -->
                </section>

                <section id="main_layer7">
                    <button class="reserve_btn">예약하기</button>  
                </section>
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
    </body>
</html>