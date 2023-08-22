<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>게시글 작성</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/board/freeInsert.css">
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

 <!-- **************************************************************************** -->
            
            <main>
                <div id="whole_layer">
                    <aside id="aside">
                        <div id="aside_layer1"></div>
                        <div id="menu_container">
                            <button class="menuBtn" id="menu_notice" onclick="locate1()">공지사항</button>
                            <button class="menuBtn" id="menu_free" onclick="locate2()">자유게시판</button> 
                            <button class="menuBtn" id="menu_playing" onclick="toggleButton(3)">연주 영상</button>
                            <button class="menuBtn" id="menu_market" onclick="toggleButton(4)">거래게시판</button>
                        </div>
                        <div id="aside_layer3"></div>
                    </aside>
                    
                    <section id="main_layer1">
                        <section id="board_name">
                            <h1>자유게시판</h1>
                        </section>
                        
                        <section id="board_content">
                            <form action="/free/insert.do" method="post" enctype="multipart/form-data">
                                <div>
                                    <input type="text" name="freeSubject" placeholder="제목">
                                </div>
                                <div>
                                    <textarea name="freeContent" placeholder="내용" spellcheck="false"></textarea>
                                </div>
                                <div id="file_wrap">
                                    <div >
                                        <input type="file" name="uploadFile" value="파일첨부하기">
                                    </div>
                                    <div>
                                        <input type="text" name="freeWriter" placeholder="작성자" value="${memberName }" >
                                    </div>
                                </div>
                                <div id="btn_wrap">
                                    <input type="submit" value="올리기">
                                    <input type="button" value="돌아가기">
                                </div>	
                            </form>
                        </section>
                    </section>
                </div>
                
                
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
       	<script>
//             function toggleButton(buttonNumber) {
//                 var buttons = document.getElementsByClassName('menuBtn');
//                 for (var i = 0; i < buttons.length; i++) {
//                     if (i === buttonNumber - 1) {
//                         buttons[i].classList.add('active');
//                     } else {
//                         buttons[i].classList.remove('active');
//                     }
//                     // buttons[0].active = location.href='/notice/list.do?currentPage=1'
//  	               // buttons[1].active = location.href='/board/list.do?currentPage=1'
// 					//이동 하고나서 색 바꾸도록 
//                 }
//             }

            function locate1 (){
                location.href='/notice/list.do'
            }
            function locate2 (){
                location.href='/free/list.do'
            }

      </script>
    </body>
</html>