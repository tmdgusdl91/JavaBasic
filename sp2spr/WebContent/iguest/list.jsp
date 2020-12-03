<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%
%>
<c:if test="${totalDataCount!=0 }">
	<table width="600" border="0" cellpadding="0" cellspacing="0" align="center">
		<c:forEach var="dto" items="${list }">
			<tr>
				<td colspan="2" bgcolor="pink" height="1"></td>
			</tr>
			<tr height="30" bgcolor="pink">
				<td width="300" style="padding-left:10px;"><b>No ${dto.listNum }.&nbsp;&nbsp;${dto.name }(<a href="mailto:${dto.email }">${dto.email }</a>)</b></td>
				<td width="300" align="right" style="padding-right: 10px;"> ${dto.created }&nbsp;
				<a href="javascript:deleteData('${dto.num }','${pageNum }')">삭제</a></td>
			</tr>
			<tr>
				<td height="50" style="padding-left:10px;" colspan="2">
					${dto.content }
				</td>
			</tr>
		</c:forEach>
	</table>	
	<tr>
		<td colspan="2" bgcolor="black" height="2"></td>
	</tr>
	
	<tr height="30">
		<td align="center" colspan="2">${pageIndexList }</td>
	</tr>
</c:if>