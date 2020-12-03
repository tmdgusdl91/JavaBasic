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
<title>Javascript로 ajax구현</title>
<script type="text/javascript" src="<%=cp%>/data/js/ajaxUtil.js"></script>
<script type="text/javascript">
	function sendIt(){
		//XMLHttpRequest 객체 생성
		xmlHttp = createXMLHttpRequest();
		var query = "";
		var su1 = document.getElementById("su1").value;
		var oper = document.getElementById("oper").value;
		var su2 = document.getElementById("su2").value;
		//GET방식 데이터 전송
		query = "test1_ok.jsp?su1="+su1+"&su2="+su2+"&oper="+oper;
		//onreadystatechange 프로퍼티
		//서버가 작업을 끝내고 클라이언트에게 데이터를 돌려줄때 자동으로 실행되는 메소드를 지정한다.
		xmlHttp.onreadystatechange = callback;
		
		xmlHttp.open("GET",query,true);  //true는 비동기 방식
		xmlHttp.send(null);
	}
	
	function callback(){
		if(xmlHttp.readyState==4){  //서버에서 정상적인 응답을 받았을 때
			if(xmlHttp.status==200){ //404,500 같은 에러가 발생하지 않았을때
				printData();
			}
		}
	}
	
	function printData(){
		var result = xmlHttp.responseXML.getElementsByTagName("root")[0];
		var out = document.getElementById("resultDiv");  //출력하는 곳의 객체를 만듬
		out.innerHtml = "";
		var value = result.firstChild.nodeValue;  //xml파싱
		out.innerHTML = value;
	}
</script>
</head>
<body>

<input type="text" id="su1"/>
<select id = "oper">
	<option value="hap">더하기</option>
	<option value="sub">빼기</option>
	<option value="mul">곱하기</option>
	<option value="div">나누기</option>
</select>
<input type="text" id="su2"/>

<input type="button" value=" = " onclick="sendIt();"/>
<div id="resultDiv"></div>

</body>
</html>