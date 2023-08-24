<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<header>
    <div id="header_layer1"> </div>
    <div id="header_layer2">
        <a href="/index.jsp"><img src="../resources/images/mainlogo.png" alt="logo" id="mainlogo"></a>
    </div>
    <div id="header_layer3">
<%--     	<c:choose> --%>
<%--   			<c:when test="${memberEmail eq null }"> --%>
<!-- 	      	 	<div class="member"><a href="/member/register1.do" >Join</a></div> -->
<!-- 	         	<div class="member"><a href="/member/login.do" >LogIn</a></div> -->
<%--         	</c:when> --%>
<%-- 	        <c:when test="${memberEmail ne null && position eq 'std' }"> --%>
<%-- 	        	<div class="member"><a href="/member/mypage_std.do?memberEmail=${memberEmail}&position=std"  class="my_std">MyPage</a></div> --%>
<!-- 	        	<div class="member"><a href="/member/logout.do" class="my_std">LogOut</a></div> -->
<%-- 	        </c:when> --%>
<%-- 	        <c:when test="${memberEmail ne null && position eq 'tch' }"> --%>
<%-- 	        	<div class="member"><a href="/member/mypage_tch.do?memberEmail=${memberEmail}&position=tch" class="my_tch">MyPage</a></div> --%>
<!-- 	        	<div class="member"><a href="/member/logout.do" class="my_tch">LogOut</a></div> -->
<%-- 	        </c:when> --%>
<%--     	</c:choose> --%>

        <c:if test="${memberEmail eq null }">
      	 	<div class="member"><a href="/member/register1.do" >Join</a></div>
         	<div class="member"><a href="/member/login.do" >LogIn</a></div>
        </c:if>
        <c:if test="${memberEmail ne null && position eq 'std' }">
         	<div class="member"><a href="/member/mypage_std.do?memberEmail=${memberEmail}&position=std" >MyPage</a></div>
         	<div class="member"><a href="/member/logout.do" >LogOut</a></div>
        </c:if>
        <c:if test="${memberEmail ne null && position eq 'tch' }">
         	<div class="member"><a href="/member/mypage_tch.do?memberEmail=${memberEmail}&position=tch" >MyPage</a></div>
         	<div class="member"><a href="/member/logout.do" >LogOut</a></div>
        </c:if>
        
        <div ><a href="#" >C/S Center</a></div>
    </div>
    
    <script>
//     	if(position.equals("std")){
//     		document.getElementByClass("my_tch").style.display = 'none';
//     		document.getElementByClass("my_tch").style.display = 'block';
//     	}else if(position.equals("tch"){
//     		document.getElementByClass("my_std").style.display = 'none';
//     		document.getElementByClass("my_std").style.display = 'block';
    	
//     	}
    
    </script>
    
</header>