<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="<%=cp %>/data/js/jquery-3.1.1.js"></script>

<script type="text/javascript">
/* 
	window.onload = function(){
		alert("ㅎㅇ");
	}
	
	window.onload = function(){
		alert("gd2");
	}
*/

$(document).ready(function(){
	alert("jQuery환영");
});

$(document).ready(function(){
	alert("jQuery환영2");
});

$(function(){
	$(document.body).css("background","pink");
});

$(function(){
	$("<div><p>제이쿼리</p></div>").appendTo("body");
});

</script>
</head>

<body>

</body>
</html>