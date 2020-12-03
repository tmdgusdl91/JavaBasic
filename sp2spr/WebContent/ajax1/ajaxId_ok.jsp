<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%

	String userId = request.getParameter("userId");

	String str ="";
	
	if(!userId.equals("")){
		
		for(int i = 1 ; i <=3 ; i++){
			Thread.sleep(1000);
		}
		
		if(userId.startsWith("suzi")){
			str = userId + " 아이디 중복 ";
		}else{
			str = userId + " 중복되지 않음";
		}
		
	}


%>

<%=str %>