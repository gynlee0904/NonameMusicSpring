<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>비밀번호 재설정3</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/member/changePw3.css">
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
                    <form action="/member/findId.do" method="post"></form>
                        <div id="findBox">
                            <div id="box_header1"><h1>비밀번호 재설정</h1></div>
                            <div id="box_main">
                                <div class="pass_field">
                                    <div class="changePw">
                                        <h4>현재 비밀번호</h4>
                                    </div>
                                    <div class="input_box">
                                        <input type="password" name="newPw" class="input_field" placeholder="현재 사용중인 비밀번호를 입력하세요">
                                    </div>
                                </div>
                                <div class="pass_field">
                                    <div class="changePw">
                                        <h4>새 비밀번호</h4>
                                    </div>
                                    <div class="input_box">
                                        <input type="password" name="newPwChk" class="input_field" placeholder="사용하실 비밀번호를 입력하세요">
                                    </div>
                                </div>
                                <div class="pass_field">
                                    <div class="changePw">
                                        <h4>새 비밀번호 확인</h4>
                                    </div>
                                    <div class="input_box">
                                        <input type="password" name="newPwChk" class="input_field" placeholder="비밀번호를 한번 더 입력하세요">
                                    </div>
                                </div>
                            </div>
                            <div id="box_foot">
                                <input type="submit" id="changPwBtn" value="비밀번호 변경">
                            </div>
                        </div>
                    </form> 
                </section>
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
    </body>
</html>