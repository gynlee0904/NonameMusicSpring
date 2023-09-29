<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="../resources/css/header.css">
        <link rel="stylesheet" href="../resources/css/nav.css">
        <link rel="stylesheet" href="../resources/css/product/myClassList.css">
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
                    <h1> 내 클래스</h1>
                </section>
                <section id="main_layer2">
                    <div id="item_write">
                        <button id="writeClass" onclick="writeClass();"><i class="bi bi-arrow-up-circle"></i> 클래스등록</button>
                    </div>
                    <div id="checkBtn">
                        <i class="bi bi-check2-square"></i>체크한 항목&nbsp 
                        <button class="deleteClass"> 삭제하기</button>
                        <button class="hideClass"> 비공개하기</button>
                    </div>

                </section>
                <section id="main_layer3">
                
				<c:if test="${cList eq null}">
	               	<div class="no_my_class" >
	               		<span>${msg}</span>
	               	</div>
             	</c:if>
				<c:forEach var="myClass" items="${cList}" varStatus="i">
                    <div class="my_class">
	                    
		                    
                        <div class="checkbox">
                            <input type="checkbox" name="delhidecheck">
                        </div>
                        <div class="thumbnail">
                        	<div class="thumbnail_case">
		                        <img src="../resources/cuploadFiles/${myClass.classFileRename }" alt="#"  >
		                    </div>      
                        </div>
                        <div class="content">
                        	<c:url  var="detailUrl" value="/product/class_detail.do">
								<c:param  name="classNo" value="${myClass.classNo }"></c:param>
							</c:url>
                            <div>
                                <a href="${detailUrl}"><h1>${myClass.classTitle}</h1></a>
                            </div>
                            <div class="text">
                                <span>클래스 고유번호 : #${myClass.classNo},</span>
                                <span>등록일자 : <fmt:formatDate pattern="yy/MM/dd" value="${myClass.cCreateDate}"/></span> <br>
                                <span>진행시간대 : ${myClass.classTime}, </span>
                                <span>진행요일 : ${myClass.classDay} </span> <br>
                                <span>회당가격 : ${myClass.classPrice}원,</span>
                                <span>최대인원수 : ${myClass.maxPeople}명 </span>
                            </div>
                        </div>
                        <div class="btn">
                        	<button class="modifyClass" onclick="modifyClass('${myClass.classNo}');"> 수정하기</button>
                            <button class="deleteClass"> 삭제하기</button>
                            <button class="hideClass"> 비공개하기</button>
                        </div>
                    </div>
				</c:forEach>

                </section>
            </main>
        </div>

        <jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
        
        <script>
        function writeClass(){
    		location.href = "/product/insertClass.do";
    	}
        
        function modifyClass(classNo){
    		location.href = "/product/modifyClass.do?classNo="+classNo;
    	}

        </script>
    </body>
</html>