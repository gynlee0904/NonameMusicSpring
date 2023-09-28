<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TeacherList</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/product/teacherList.css">
        <link rel="stylesheet" href="../resources/css/footer.css?after">
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
        
        <style>
        	#wrap-footer {
			    --bottom: 0px;
			    margin-top: auto;
			    clear:both; 
			}
			
			footer {
			    background-color: #f4f4f4;
			    --width : 1040px;
			    width : 1300px;
			    height : 100px;
			    margin: 20px auto 0;
			    
			    padding-top : 65px;
			    text-align: center;
			    font-size:1px;
			    --bottom: 0px;  
			}
        	
        </style>
    </head>

    <body>
        <div id="container">
            <jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>  
			<jsp:include page="/WEB-INF/views/include/nav.jsp"></jsp:include>  

 <!-- **************************************************************************** -->
            
            <main>
                <section id="itemlist_head">
                    <div id="orderby">
                        <!-- 상세검색 -->
                        <select name="orderBy">
                            <option value="all">정렬하기</option>
                            <option value="all">가나다순</option>
                            <option value="title">별점높은순</option>
                            <option value="content">별점낮은순</option>
                            <option value="content">레슨많은순</option>
                            <option value="content">레슨적은순</option>
                            <option value="content">가격높은순</option>
                            <option value="content">가격낮은순</option>
                        </select>
                    </div>
                    
                    <div id="item_search">
                        <div>
                            <form action="/notice/search.do" method="get">
                                <div id="search_wrap">
                                    <select name="searchCondition">
                                        <option value="all">전체</option>
                                        <option value="title">제목</option>
                                        <option value="content">내용</option>
                                        <option value="content">선생님</option>
                                    </select>
                                    <div class="search-box">
                                        <input type="search" name="searchKeyword" placeholder="검색어를 입력하세요">
                                        <input type="submit" value="검색">
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div id="item_matching">
                            매칭된 선생님들만 보기&nbsp;<i class="bi bi-toggle-off" id="switchOff" onclick="switchOn()"></i><i class="bi bi-toggle-on" id="switchOn" onclick="switchOff()" style="display: none;"></i> 
                        </div>
                    </div>
                </section>
             
                <section id="main_layer">
                    <div id="prev_icon"><i class="bi bi-chevron-compact-left"></i></div>

                    <div class="item_list">
                        
                        <a href="">
                            <div class="card">
                                <img src="../resources/images/goodman.png" alt="" width="150" height="150">
                                <div class="text">
                                    <h3>서태우 선생님</h3>
                                    <p>레슨횟수 : 3회 </p>
                                    <p>★★★★★</p>
                                </div>
                            </div>
                        </a>

                    </div>

                    <div id="next_icon"><i class="bi bi-chevron-compact-right"></i></div>
                </section>


                <section id="pageNavi">

                </section>
                
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        

        <script>
            let switchToggle = false;
            function switchOn(){
                if(switchToggle){
                    document.querySelector("#switchOn").style.display="block";
                    document.querySelector("#switchOff").style.display="none";
                }switchToggle = !switchToggle
                
            }
            function switchOff(){
                if(switchToggle){
                    document.querySelector("#switchOff").style.display="block";
                    document.querySelector("#switchOn").style.display="none";
                }switchToggle = !switchToggle

                window.location.href = "#";
            }



        </script>
    </body>
</html>