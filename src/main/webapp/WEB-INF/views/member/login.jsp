<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>로그인</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/member/login.css">
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
            <div id="wrap-header">
                <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>  
				<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>  
            </div>


    <!-- **************************************************************************** -->
            
            <main>
                <section id="main_layer1">
                    <form action="/member/login.do" method="post">
                        <div id="loginBox">
                            <div id="box_header1">
                                <h1>로 그 인</h1>
                            </div>
                            <div id="box_header2">
                                <label><input type="radio" name="position" value="std" checked>&nbsp;&nbsp;학생</label>&nbsp;&nbsp;&nbsp;&nbsp;    
                                <label><input type="radio" name="position" value="tch">&nbsp;&nbsp;강사</label>
                            </div>
                            <div id="box_main"> 
                                <div id="box_main_layer1">
                                    <div id="id-field">
                                        <input type="email" name="memberEmail" id="user_id" placeholder="ID : 이메일을 입력하세요">
                                    </div>
                                    <div id="pw-field" >
                                        <input type="password" name="memberPw" id="user_pw" placeholder="PW : 비밀번호를 입력하세요">    
                                    </div>
                                </div>
                                <div id="box_main_layer2">
                                    <button type="submit" id="btn">로그인</button>
                                </div>
                            </div>
                            <div id="login_footer">
                                <a href="#">ID 찾기</a> /
                                <a href="#">PW 재설정</a>
                            </div>
                        </div>
                    </form>
                </section>
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
    </body>
</html>