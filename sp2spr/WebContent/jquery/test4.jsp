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

<link rel="stylesheet" href="<%=cp %>/data/css/jquery-ui.css" type="text/css"/>

<style type="text/css">
	body{ font: 62.5% "굴림", sans-serif; margin: 50px;}
	ul#icons {margin: 0; padding: 0;}
	ul#icons li {margin: 2px; position: relative; padding: 4px 0; cursor: pointer; float: left;  list-style: none;}
	ul#icons span.ui-icon {float: left; margin: 0 4px;}
	#container { width: 300px;}
</style>

<script type="text/javascript" src="<%=cp %>/data/js/jquery-3.1.1.js"></script>
<script type="text/javascript" src="<%=cp %>/data/js/jquery-ui.js"></script>

<script type="text/javascript">
	$(function(){
		$("#container").tabs();
	});

</script>

</head>
<body>

<div id="container">
	<ul>
		<li><a href="#f1">첫번째</a></li>		
		<li><a href="#f2">두번째</a></li>
		<li><a href="#f3">세번째</a></li>
	</ul>
	<div id="f1">
		테스트1....
	</div>
	<div id="f2">
		테스트2....
	</div>
	<div id="f3">
		테스트3....
	</div>
</div>
</body>
</html>