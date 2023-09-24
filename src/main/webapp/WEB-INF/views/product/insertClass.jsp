<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>피아노원데이클래스-윤대협T</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/product/insertClass.css">
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
            	<form action="/product/insertClass.do" method="POST"  enctype="multipart/form-data">
                <section id="main_layer1">
                    <div id="main1_part1">
                        <div id="img" >
                            <input type="file" name="uploadFile" id="attachFile" style="display: none;" accept="image/*">
                            <i class="bi bi-camera" id="camera"></i>
                            <img src="../resources/images/no_image.jpg" id="thumbnail">
                        </div>
                        
                    </div>
                    <div id="main1_part2">
                        <div id="class_title">
                            <input type="text" name="classTitle" placeholder="클래스명을 입력하세요" spellcheck="false">
                        </div>
                        <div id="info">
                        	<input type="hidden" name="memberEmail" value="${memberEmail }">
                            <p><i class="bi bi-check2-square"></i> 진행강사 : ${memberName} </p>
                            <div id="info_input">
                                <p><i class="bi bi-check2-square"></i> 진행 요일 : <input class="input" type="text" name="classDay"  placeholder="진행요일 혹은 날짜를 입력하세요" spellcheck="false" ></p>
                                <p><i class="bi bi-check2-square"></i> 진행 시간 : <input class="input" type="text" name="classTime" placeholder="진행시간을 입력하세요" spellcheck="false"></p>
                                <p><i class="bi bi-check2-square"></i> 가격 :  <input class="input" type="text" name="classPrice" placeholder="회당가격을 입력하세요" spellcheck="false"> 원</p>
                                <p><i class="bi bi-check2-square"></i> 최대인원 : <input class="input" type="text" name="maxPeople" placeholder="회당 최대레슨인원을 입력하세요" spellcheck="false"> 명</p>
                            </div>
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
                        <textarea name="classTarget" spellcheck="false"></textarea>
                    </div>
                </section>

                <section id="main_layer4">
                    <div class="title">
                        수업진행과정
                    </div>
                    <div class="data"> 
                        <textarea name="classProgress"spellcheck="false"></textarea>
                    </div>
                </section>

                <section id="main_layer7">
                    <button type="submit" class="reserve_btn">등록하기</button>  
                </section>
                </form>
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
        <script>
            const attachFile = document.getElementById('attachFile');
            const thumbnail = document.getElementById('thumbnail');
            const camera = document.getElementById('camera');

            thumbnail.addEventListener('click', () => {
                attachFile.click();
            });
            camera.addEventListener('click', () => {
                attachFile.click();
            });

            attachFile.addEventListener('change', (event) => {
            const file = event.target.files[0];
            if (file) { 
                // 새 이미지를 표시하기 위해 파일을 미리보기로 사용할 수 있습니다.
                const reader = new FileReader();
                reader.onload = (e) => {
                    thumbnail.src = e.target.result;
                };
                reader.readAsDataURL(file);
            }
        });
        </script>
    </body>
</html>