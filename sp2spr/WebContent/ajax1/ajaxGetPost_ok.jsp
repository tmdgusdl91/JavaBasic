<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%

String protocol = request.getProtocol();
System.out.println(protocol);

//세션 삭제 후 (로그아웃) 뒤로가기 방지
response.setDateHeader("Expires", 0);

//클라이언트가 보내는 캐쉬를 제거
response.setHeader("Pragma", "no-cache");
if(request.getProtocol().equals("HTTP/1.1")){
	response.setHeader("Cache-Control", "no-cache"); //HTTP1.1일때 사용
}else{
	response.setHeader("Cache-Control", "no-store"); //HTTP1.0일때 사용
}

String greeting = request.getParameter("greeting");

for(int i = 0 ; i <2 ; i++){
	Thread.sleep(1000);
}

%>

<%="Server: "+greeting %>