<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();

String userId = request.getParameter("userId");
String userPwd = request.getParameter("userPwd");

String result = "";

for (int i = 1; i <= 3; i++) {
	result += "{\"id\":\"" + i;
	result += "\",\"userId\":\"" + userId;
	result += "\",\"userPwd\":\"" + userPwd + "\"},";
}

result = result.substring(0, result.length() - 1); //맨뒤의 , 빼줌

result = "[" + result + "]";
out.print(result);
%>
<%
	
%>