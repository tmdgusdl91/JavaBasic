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
	
	function getXMLHttpRequest(){ //Ajax에 사용할 객체 생성메소드
		
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
	}	
	
	window.onload=function(){
		getXMLHttpRequest();  //객체 생성메소드 호출
	}
	
	//GET방식
	function ajaxRequestGet(){		
		var data = document.myForm.greeting.value;
		if(data==""){
			alert("값입력하셈");
			document.myForm.greeting.focus();
			return;
		}
		
		XMLHttpRequest.open("GET","ajaxGetPost_ok.jsp?greeting="+data,true);  //GET방식은 주소창에 값을 입력해줘야함.
		XMLHttpRequest.onreadystatechange = callback;
		XMLHttpRequest.send(null);
	}
	

	//POST방식
	function ajaxRequestPost(){
		var data = document.myForm.greeting.value;
		if(data==""){
			alert("값입력하셈");
			document.myForm.greeting.focus();
			return;
		}
		
		XMLHttpRequest.open("POST","ajaxGetPost_ok.jsp",true);  //POST방식은 주소창에 값입력을 안함.
		XMLHttpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //POST방식일때 작성
		XMLHttpRequest.onreadystatechange = callback;
		XMLHttpRequest.send("greeting="+data);  //send 메소드 안에다가 보낼 데이터를 작성함.
	}
	
	
	function callback(){
		var divE = document.getElementById("printDIV");
		//  요청 페이지 정보 설정          요청을 보내기 시작          서버에서 응답오기 시작
		if(XMLHttpRequest.readyState==1||XMLHttpRequest.readyState==2||XMLHttpRequest.readyState==3){
			divE.innerHTML = "<img src='../image/bar.gif' width='20%' height='10%'/>";
		}else if(XMLHttpRequest.readyState==4){ //서버 응답 완료
			divE.innerHTML = XMLHttpRequest.responseText;
		}else{
			divE.innerHTML = "<font color='red'>"+XMLHttpRequest.status+" 에러발생 </font>";
		}
	}

</script>

</head>
<body>

<h1>Ajax Get,Post</h1>
<hr/>		
<form action="" name="myForm">
	<input type="text" name="greeting">
	<input type="button" value="Get방식" onclick="ajaxRequestGet();">
	<input type="button" value="Post방식" onclick="ajaxRequestPost();">
</form>
<br/>
<div id="printDIV" style="border: 1px solid green; width: 50%"></div>

</body>
</html>