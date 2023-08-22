<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<header>
    <div id="header_layer1"> </div>
    <div id="header_layer2">
        <a href="/index.jsp"></a><img src="../resources/images/mainlogo.png" alt="logo" id="mainlogo"></a>
    </div>
    <div id="header_layer3">
        <c:if test="${memberEmail eq null }">
      	 	<div class="member"><a href="/member/register1.do" >Join</a></div>
         	<div class="member"><a href="/member/login.do" >LogIn</a></div>
        </c:if>
        <c:if test="${memberEmail ne null }">
         	<div class="member"><a href="/member/mypage.do?memberEmail=${memberEmail}" >MyPage</a></div>
         	<div class="member"><a href="/member/logout.do" >LogOut</a></div>
        </c:if>
        <div ><a href="#" >C/S Center</a></div>
    </div>
</header>