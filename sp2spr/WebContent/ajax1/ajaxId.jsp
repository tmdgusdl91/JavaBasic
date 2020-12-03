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

<script type="text/javascript">
	var XMLHttpRequest;
	
	function requestGet(){
		
		if(window.ActiveXObject){ //IE경우
			try {
				XMLHttpRequest = new ActiveXOjbect("Msxml2.XMLHTTP");  //IE 5.0 이후 버전
			} catch (e) {
				XMLHttpRequest = new ActiveXOjbect("Microsoft.XMLHTTP"); //IE 5.0 이전 버전
			}
		}else{
			//not IE
			XMLHttpRequest = new XMLHttpRequest();
		}
		divE2 = document.getElementById("resultDIV2");
		if(!document.myForm.userId.value){
			divE2.innerHTML = "<font color='red'> 아이디입력 </font>";
		}
		var params = "?userId="+document.myForm.userId.value;
		XMLHttpRequest.open("GET","ajaxId_ok.jsp"+params,true);
		XMLHttpRequest.onreadystatechane = callback;
		XMLHttpRequest.send(null);
	}
	function callback(){
		if(XMLHttpRequest.readyState==4){
			if(XMLHttpRequest.status==200){
				var str = XMLHttpRequest.responseText;
				var divE = document.getElementById("resultDIV");
				divE.innerHTML = str;
			}else{
				var divE = document.getElementById("resultDIV");
				divE.innerHTML ="<img width='15' height='15' src='../image/loading.gif'/>";
			}
		}
	}
	
</script>

</head>
<body>

<form action="" name="myForm">

<h1>아이디 입력</h1><br/>					<!-- 키보드를 눌렀다 땔 때  -->
<input type="text" id="userId" name="userId" onkeyup="requestGet();"/>

</form>
<br/><br/><br/>
<div id="resultDIV"></div>
<div id="resultDIV2"></div>
</body>
</html>