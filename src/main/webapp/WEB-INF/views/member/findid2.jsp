<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>아이디 찾기2</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/member/findid2.css">
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
                <section id="main_layer1">
                    <div id="findIdBox">
                        <div id="box_header1">
                            <h1>아이디 찾기</h1>
                        </div>
                        <div id="box_main">
                            <p> ghdrlfehd 회원님의 ID는</p><br>
                            <p>[학생]&nbsp;&nbsp;<span><b>ssssssss@ggggggggg</b></span>&nbsp;&nbsp;입니다.</p>
                        </div>
                        <div id="box_foot">
                            <a href="/member/login.do"><input type="submir" id="login_btn" value="로그인하기"></a>
                            <a href="#"><input type="button" id="pw_btn" value="비밀번호 재설정"></a>
                        </div>
                    </div>
                </section>
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
    </body>
</html>