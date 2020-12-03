<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();

String subject = request.getParameter("subject");
String content = request.getParameter("content");
%>
<%
%>
<root>
	<status>권장도서</status>
	<record id="1">
		<subject><%=subject %></subject>
		<content><%=content %></content>
	</record>
	<record id="2">
		<subject>탱구와울라숑</subject>
		<content>울라리얄라얄라리울라</content>
	</record>
</root>
