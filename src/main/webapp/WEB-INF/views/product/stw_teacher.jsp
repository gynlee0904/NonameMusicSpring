<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>서태우 선생님</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/product/stw_teacher.css">
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
                    <div id="profile1">
                        <img src="../resources/images/goodman.png" alt="서태우">
                    </div>

                    <div id="profile2">
                        <div id="tch_name">
                            <div id="tName">서태우 선생님</div>
                            <div id="bookmark "><i class="bi bi-heart"></i></div>
                                <!-- <a href="javascript:;" class="icon heart bi bi-heart">
                                    <img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기">
                                </a> -->
                        </div>

                        <p>레슨횟수 : 총 3회 </p>

                        <div div id="lesson_score">
                            <div id="starScr">
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-fill"></i>
                                <i class="bi bi-star-half"></i>
                                <i class="bi bi-star"></i>
                            </div>
                            <div id="reviewCnt">(12)</div>
            
                            <div><button id="rv_btn">리뷰</button></div>
                        </div>
                            
                        <div id="lesson_pay">
                            <p>레슨비 : 회당 50,000원 (50분 기준)</p>
                            <p>결제방법 : ㅇㅇ페이, 실시간 계좌이체</p>
                        </div>
                    </div>

                    <form action="" method="">
                        <div id="profile3"> 
                            <div id="">
                                <button id="chat_btn"> 
                                    <div id="contain_bln">
                                        <div id="counsel">상담하기&nbsp;</div>
                                        <div id="ballon_img"><i class="bi bi-wechat"></i></div>
                                        <!-- <div id="ballon_img"><i class="bi bi-chat-dots"></i></div> -->
                                    </div>
                                    <small>(상담 후 결제진행)</small>
                                </button>
                                <br>
                                <small id="contact">연락가능시간 : 매일 89시 ~ 10시 / 21시 ~ 23시</small>
                            </div>
                        </div>
                    </form>	
                </section>

                <section id="main_layer2">
                    <div class="title">
                        <h4>선생님 정보</h4>
                    </div>
                    <div class="data">
                            <p>한국대학교 피아노전공 (졸업) <br>
                            총 레슨 경력 7년<br>
                            입시레슨, 취미레슨 가능 <br>
                            레슨실 위치 : 낙성대역 2번 출구 앞 <br>
                            학생 자택으로 방문레슨 가능</p>   
                    </div> 
                </section>

                <section id="main_layer3">
                    <div class="title">
                        <h4>수강대상</h4>
                    </div>
                    <div class="data">
                        <p>피아노를 처음 배우시는 분 <br>
                        기초가 부족해서 고민이신 분<br>
                        한곡 완성이 목표이신 분<br>
                        더 깊고 완성도 높은 연주를 원하시는 분</p>
                    </div>
                </section>

                <section id="main_layer4">
                    <div class="title">
                        <h4>하고싶은 말</h4>
                    </div>
                    <div class="data">
                        <p>처음 배우시는 분도 어렵지 않게 잘 가르쳐드립니다</p>
                    </div>
                </section>

                <br><br>

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

            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        

        <script>
            // 리뷰버튼 누르면 리뷰있는곳으로 스크롤다운
            const rv_btn = document.getElementById('rv_btn');
            const main_layer3 = document.getElementById('main_layer3');
            rv_btn.addEventListener('click', () => {
                window.scrollBy({top:main_layer3.getBoundingClientRect().top, behavior: 'smooth'});
            });
            // 리뷰버튼 누르면 리뷰있는곳으로 스크롤다운



            //찜하기
            $(function(){
                var $likeBtn =$('.icon.heart');

                $likeBtn.click(function(){
                $likeBtn.toggleClass('active');

            if($likeBtn.hasClass('active')){          
                $(this).find('img').attr({
                'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
                alt:'찜하기 완료'
            });

            }else{
                $(this).find('i').removeClass('fas').addClass('far')
                $(this).find('img').attr({
                'src': 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
                alt:"찜하기"
                        })
                    }
                })
            })
            // 하트 누르면 빨갛게 찜
        </script>
    </body>
</html>