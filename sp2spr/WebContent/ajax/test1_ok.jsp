<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();

int su1 =Integer.parseInt(request.getParameter("su1"));
int su2 =Integer.parseInt(request.getParameter("su2"));
String oper = request.getParameter("oper");

int sum = 0;

switch(oper){
case "hap":
	sum = su1 + su2;
	break;
case "sub":
	sum = su1 - su2;
	break;
case "mul":
	sum = su1 * su2;
	break;
case "div":
	sum = su1 / su2;
	break;
}
StringBuffer sb = new StringBuffer();
sb.append("<?xml version='1.0' encoding='UTF-8'?>\n");
sb.append("<root>"+sum+"</root>");
response.setContentType("text/xml;charset=UTF-8");
response.getWriter().write(sb.toString());

%>
<%
%>