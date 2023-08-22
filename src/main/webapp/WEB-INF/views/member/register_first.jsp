<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원가입</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/member/register_first.css">
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
                    <h1>회원가입</h1>
                </section>
    
                <form action="/member/register1.do" method="post">
                    <section id="main_layer2">
                        <div>
                            <div id="policy">약관</div>
                            <div id="agree">
                                <label><input type="checkbox" name="policy" >&nbsp;동의합니다(필수)</label>
                            </div>
                        </div>
                    </section>

                    <section id="main_layer3">
                        <div>
                            <div>
                                <label><input type="radio" name="position" value="std" checked>학생으로 가입하기</label>
                            </div>
                            <div>
                                <label><input type="radio" name="position" value="tch">선생님으로 가입하기</label>
                            </div>
                        </div>
                    </section>
    
                    <section id="main_layer4">
                        <button type="submit" id="next_btn">본인인증하기</button></a>
                    </section>
                </form>
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
    </body>
</html>