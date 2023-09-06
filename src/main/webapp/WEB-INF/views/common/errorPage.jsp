<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<h1>서비스실패</h1>
		<h2>관리자에게 문의바랍니다</h2>
		<h2>${error }</h2>
<%-- 		<a href = "${url }">페이지 이동</a> --%>
			
			
		<script>
			const msg = "${msg}";
			if(msg!=null)alert(msg);
			
			const url = '${url }';
			location.href = url;
		</script>
	</body>
</html>