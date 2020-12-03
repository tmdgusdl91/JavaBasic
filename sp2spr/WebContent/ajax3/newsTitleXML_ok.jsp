<%@page import="java.util.Date"%> <% //text/html 아니라 html/xml로 바꿔줘야함 %>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%!

String[] newsTitle = {
		"KPS", "아시아경제", "경향신문", "YTN", "JTBC", "SBS", "중앙에일리", "이간스포츠", "뉴스타가다", "KBS World wild web", "섹계일보", "조선버즈", "격일경제",
		"서울신문고", "버즈한국", "안경잡이앤조이", "대비자가만드는신문", "IU조선", "매경이코노미석", "EBS", "불어펜", "독사신문"
};

%>

<result>
	<count><%=newsTitle.length %></count>
	<data>
		<%for(int i = 0 ; i < newsTitle.length ; i++){ %>
			<title><%=newsTitle[i] + " | " + new Date() %></title>
			<%} %>
	</data>
</result>