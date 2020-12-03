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

<script type="text/javascript" src="js/member.js"></script>
<script type="text/javascript" src="js/log.js"></script>
<script type="text/javascript">
	
	function memberClass(){
		//1.member.js 없이 객체생성 (Member클래스 X)
		var object1={};
		object1.id = "bo-young";
		object1.name ="보영";		
		log("log1:" + object1.id + ","+ object1.name);
		
		//2.memberjs 없이 객체생성 (Member클래스 X)
		var object2 = new Object();
		object2.id = "in-na";
		object2.name = "인나";
		log("log2:" + object2.id + ","+ object2.name);
		
		//3.Member 클래스로 객체생성
		var member = new Member("suzi","수지","소울");
		log("member1:"+member.id+","+member.name+","+member.addr);
		
		//4.Member 클래스 setter, getter사용
		member.setValue("Rose","로제","쿤산");
		var memberInfo = member.getValue();
		log("member2:"+memberInfo);
	}
	
	window.onload = function(){
		memberClass();
	}
	
</script>
</head>
<body>

<h1>JavaScript 클래스 사용</h1>
<hr/>
<div id="console"></div>

</body>
</html>