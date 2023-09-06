<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<header>
    <div id="header_layer1"> </div>
    <div id="header_layer2">
        <a href="/index.jsp"><img src="../resources/images/mainlogo.png" alt="logo" id="mainlogo"></a>
    </div>
    <div id="header_layer3">
    		

        <div id="memberMenu">
			<div class="member" id="join"  style="display:none;"><a href="/member/register1.do" >Join</a></div>
			<div class="member" id="logIn" style="display:none;"><a href="/member/login.do" >LogIn</a></div>

			<div class="member" id="myPage" style="display:none;"><a href="/member/mypage_std.do?memberEmail=${memberEmail}&position=std" >MyPage</a></div>
			<div class="member" id="logOut" style="display:none;"><a href="/member/logout.do" >LogOut</a></div>

			<div class="member" id="myPage2" style="display:none;"><a href="/member/mypage_tch.do?memberEmail=${memberEmail}&position=tch" >MyPage</a></div>
			<div class="member" id="logOut2" style="display:none;"><a href="/member/logout.do" >LogOut</a></div>

        	<div class="member"><a href="#" >C/S Center</a></div>
        </div>

<%-- 			<c:if test="${memberEmail eq null }"> --%>
<!-- 				<div class="member"><a href="/member/register1.do" >Join</a></div> -->
<!-- 				<div class="member"><a href="/member/login.do" >LogIn</a></div> -->
<%-- 			</c:if> --%>
			
<%-- 			<c:if test="${memberEmail ne null && position eq 'std' }"> --%>
<%-- 				<div class="member"><a href="/member/mypage_std.do?memberEmail=${memberEmail}&position=std" >MyPage</a></div> --%>
<!-- 				<div class="member"><a href="/member/logout.do" >LogOut</a></div> -->
<%-- 			</c:if> --%>
<%-- 			<c:if test="${memberEmail ne null && position eq 'tch' }"> --%>
<%-- 				<div class="member"><a href="/member/mypage_tch.do?memberEmail=${memberEmail}&position=tch" >MyPage</a></div> --%>
<!-- 				<div class="member"><a href="/member/logout.do" >LogOut</a></div> -->
<%-- 			</c:if> --%>

<!--         	<div class="member"><a href="#" >C/S Center</a></div> -->

		<div id="welcome">
 			<c:if test="${memberEmail ne null}">
	            <span>${memberEmail}님 환영합니다!</span> 
		   	</c:if>
		</div>
			

		
    </div>
    
    <script>
    
    if(${memberEmail eq null }){
    	document.querySelector("#join").style.display="block"
    	document.querySelector("#join").style.opacity="1";
    	document.querySelector("#logIn").style.display="block"
    	document.querySelector("#logIn").style.opacity="1";
    }
    else if(${memberEmail ne null && position eq 'std' }){
    	document.querySelector("#myPage").style.display="block"
       	document.querySelector("#myPage").style.opacity="1";
       	document.querySelector("#logOut").style.display="block"
       	document.querySelector("#logOut").style.opacity="1";
    }
    else if(${memberEmail ne null && position eq 'tch' }){
    	document.querySelector("#myPage2").style.display="block"
       	document.querySelector("#myPage2").style.opacity="1";
       	document.querySelector("#logOut2").style.display="block"
       	document.querySelector("#logOut2").style.opacity="1";
    }



    </script>
    
</header>