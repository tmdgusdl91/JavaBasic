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
	
	function ajaxRequest(){
		/* 
		//IE
		XMLHttpRequest = new ActiveXObject("Msxml2.XMLHTTP");
		 */
		//chrome (not IE)
		XMLHttpRequest = new XMLHttpRequest();
		XMLHttpRequest.open("get","helloAjax_ok.jsp",true);
		XMLHttpRequest.onreadystatechange = callback; //사용자 정의 메소드
		XMLHttpRequest.send(null);
	}
	
	function callback(){
		//서버로부터 응답이 왔을때 실행되는 메소드
		var responseText = XMLHttpRequest.responseText; //응답하는 데이터가 Text일때. XML이면 responseXML
		var divE = document.getElementById("printDIV"); //출력되는 곳의 위치를 지정한 객체를 만듬.
		divE.innerHTML = responseText; //divE에 대한 위치에 responseText의 값을 삽입.
	}

</script>
</head>
<body>

<h1>Hello Ajax</h1>

<input type="button" value="클릭" onclick="ajaxRequest();"/>
<br/>
<br/>
<div id="printDIV" style="border: 1px solid red; width: 50%">

</div>

</body>
</html>