<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%!
	//느낌표가 있으면 전역변수
    String[] newsTitle = {
			"KBS", "아시아경제", "경향신문", "YTN", "JTBC", "SBS", "중앙데일리", "일간스포츠", "뉴스타파", "KBS World", "세계일보", "조선비즈", "매일경제",
			"서울신문", "버즈한국", "한경잡앤조이", "소비자가만드는신문", "IT조선", "매경이코노미석", "EBN", "미디어펜", "독사신문"
	};
%>
<%
	//느낌표가 없으면 지역변수
out.print(newsTitle.length+"|");

for(int i = 0 ; i <newsTitle.length; i++){
	out.print(newsTitle[i] + " ["+new Date()+"]");
	if(i!=(newsTitle.length-1)){
		out.print("*");
	}
}

%>
