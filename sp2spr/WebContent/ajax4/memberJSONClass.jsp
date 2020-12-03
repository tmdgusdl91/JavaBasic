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
<script type="text/javascript" src="js/log.js"></script>
<script type="text/javascript" src="js/member_json.js"></script>
<script type="text/javascript">

	function memberClass(){
		//1.
		var member = new com.util.Member("bo-young","박보영","군산");
		log("1"+member.id+","+member.name+","+member.addr);
		
		//2.
		member.setValue("Rose","로제","군산");
		log("2"+member.id+","+member.name+","+member.addr);
		
		//3.
		var memberInfo = member.getValue();
		log("3"+memberInfo);
		
		//4
		member.setId("tmdgusdl91");
		var memberInfo = member.toString();
		log("4"+member.toString());
	}
	window.onload = function(){
		memberClass();
	}

</script>
</head>
<body>

<h1>JavaScript 클래스 사용 [JSON]</h1>
<hr/>
<div id="console"></div>

</body>
</html>