<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>비밀번호 재설정</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/member/changePw.css">
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
                <section id=main_layer1>
                    <form action="/member/findId.do" method="post">
                        <div id="findBox">
                            <div id="box_header1"><h1>비밀번호 재설정</h1></div>
                            <div id="box_header2">
                                    <label><input type="radio" name="position"  value="std" checked>&nbsp;&nbsp;학생</label>&nbsp;&nbsp;&nbsp;&nbsp;    
                                    <label><input type="radio" name="position"  value="tch">&nbsp;&nbsp;강사</label>
                            </div>
                            <div id="box_main">
                                <div class="info_field">
                                    <div class="checkInfo">
                                        <h4>이름</h4>
                                    </div>
                                    <div class="input_box">
                                        <input type="password" name="newPw" class="input_field" placeholder="이름을 입력해주세요">
                                    </div>
                                </div>
                                <div class="info_field">
                                    <div class="checkInfo">
                                        <h4>아이디</h4>
                                    </div>
                                    <div class="input_box">
                                        <input type="password" name="newPwChk" class="input_field" placeholder="사용하시는 이메일을 입력해주세요">
                                    </div>
                                </div>
                            </div>
                            <div id="box_foot">
                                <input type="submit" id="changPwBtn" value="휴대폰인증">
                            </div>
                        </div> 
                    </form>
                </section>
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
    </body>
</html>