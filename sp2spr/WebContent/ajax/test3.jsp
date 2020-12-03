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
<title>jQuery로만 구현한 Ajax</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#saveButton").click(function(){
			var value1 = $("#userId").val();
			var value2 = $("#userPwd").val();
			/* 
			//get
			$.get("test3_ok.jsp",{userId:value1,userPwd:value2},function(args){
				$("#resultDiv").html(args);
			});
			 */
			 
			 
			//post
			$.post("test3_ok.jsp",{userId:value1,userPwd:value2},function(args){
				$("#resultDiv").html(args);
			});			
		});
		$("#clearButton").click(function(){
			$("#resultDiv").empty();
		});
	});

</script>
</head>
<body>

아이디 : <input type="text" id="userId"/><br/>
패스워드 : <input type="text" id="userPwd"/><br/>

<button id="saveButton">전송</button><br/>
<button id="clearButton">지우기</button>


<br/>
<br/>
<div id = "resultDiv">

</div>
</body>
</html>