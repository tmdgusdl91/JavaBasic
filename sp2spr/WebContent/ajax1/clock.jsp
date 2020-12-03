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
	
	window.onload = function(){
		printClientTime(); //client 시간
		requestTime(); //server 시간		
	}
	
	//Ajax사용 안함.
	function printClientTime(){
		
		//클라이언트 시간
		var clientTimeSpan = document.getElementById("clientTimeSpan");
		var now = new Date();
		var timeStr = now.getFullYear() + "/" + (now.getMonth()+1) +"/" + now.getDate()
					+ "  "+ now.getHours() + " : " + now.getMinutes()+" : " + now.getSeconds()
		clientTimeSpan.innerHTML = timeStr;
					
		//1초마다 자기 자신을 호출 (재귀)
		setTimeout("printClientTime()",500);
	}
	
	//Ajax사용
	function requestTime(){
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
		XMLHttpRequest.open("GET","clock_ok.jsp?dummy="+new Date().getDate(),true);  //에러가 날 때가 있어서 가상의 데이터 하나를 그냥 보내줌
		XMLHttpRequest.onreadystatechange = printServerTime;
		XMLHttpRequest.send(null);
		setInterval("requestTime()",500);
	}
	
	function printServerTime(){
		if(XMLHttpRequest.readyState==4){
			if(XMLHttpRequest.status==200){
				var serverTimeSpan = document.getElementById("serverTimeSpan");
				serverTimeSpan.innerHTML = XMLHttpRequest.responseText;
			}else{
				
			}
		}
	}	
</script>

</head>
<body>

1. 현재 클라이언트 시간은 <font color="red"><b><span id="clientTimeSpan"></span></b></font> 입니다. (Ajax 사용 X)<br/>
1. 현재 서버 시간은 <font color="red"><b><span id="serverTimeSpan"></span></b></font> 입니다. (Ajax 사용 O)<br/>

</body>
</html>