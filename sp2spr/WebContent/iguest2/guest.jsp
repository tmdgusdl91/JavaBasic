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
<link rel="stylesheet" href="<%=cp %>/data/css/style.css" type="text/css"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="<%=cp %>/data/js/ajaxUtil2.js"></script>
<script type="text/javascript">

	function listPage(pageNum){	
		var params = "pageNum="+pageNum;
		document.getElementById("name").value="";
		document.getElementById("email").value="";
		document.getElementById("content").value="";
		sendRequest("<%=cp %>/guest2/list.action",params,displayNewsTitle,"GET");		
	}
	
	function displayNewsTitle(){
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
				var str = httpRequest.responseText;
				var listData = document.getElementById("listData");
				listData.innerHTML = str;				
			}
		} 
	}
	
	function send(){
		var name = document.getElementById("name").value;
		var email = document.getElementById("email").value;
		var content = document.getElementById("content").value;
		if(!name){
			alert("이름입력하셈");
			document.getElementById("name").focus();
			return;
		}
		if(!email){
			alert("주소입력하셈");
			document.getElementById("email").focus();
			return;
		}
		if(!content){
			alert("내용입력하셈");
			document.getElementById("content").focus();
			return;
		}
		
		var params = "name="+name+"&email="+email+"&content="+content;
		sendRequest("<%=cp %>/guest2/created.action",params,displayNewsTitle,"GET");
	}
	
	function deleteData(num,pageNum){
		var params = "num="+num+"&pageNum="+pageNum;
		sendRequest("<%=cp %>/guest2/deleted.action",params,displayNewsTitle,"GET");
	}
	
	window.onload = function(){
		var pageNum = 1
		listPage(pageNum);
	}
	
</script>
</head>
<body>
<div align="center">
	<table width="600" border="5" cellpadding="0" cellspacing="0" bordercolor="pink" align="center">
		<tr height = "40">
			<td style="padding-left: 20px"><b>방　명　록</b></td>
		</tr>	
	</table>
	<br/><br/>
	<table width="600" border="0" cellpadding="0" cellspacing="0" align="center">
		<tr>
			<td width="600" colspan="4" height="3" bgcolor="pink"></td>
		</tr>
		
		<tr>
			<td width="60" height="30" bgcolor="pink" align="center">작성자</td>
			<td width="240" height="30" style="padding-left: 10px;" bgcolor="pink">
				<input type="text" id="name" name="name" size="35" maxlength="20" class="boxTF"/>
			</td>
			<td width="60" height="30" bgcolor="pink" align="center">이메일</td>
			<td width="240" height="30" style="padding-left: 10px;" bgcolor="pink">
				<input type="text" id="email" name="email"size="35" maxlength="50" class="boxTF"/>
			</td>			
		</tr>	
		<tr>
			<td width="600" colspan="4" height="1" bgcolor="pink"></td>
		</tr>
		<tr>
			<td width="60" height="30" bgcolor="pink" align="center">내용</td>
			<td width="540" colspan="3"style="padding-left: 10px;" bgcolor="pink">
				<textarea rows="10" cols="63" id="content" name="content" class="boxTA" style="height:50px;"></textarea>
			</td>			
		</tr>	
		<tr>
			<td width="600" colspan="4" height="10" bgcolor="pink"></td>
		</tr>
		<tr>
			<td width="600" colspan="4" height="30" align="right" style="padding-right: 15px;" bgcolor="pink">
				<input type="button" value="등록" id="sendButton" onclick="send();"/>
			</td>
		</tr>
	</table>
	
	<br/>
	
	<span id="listData" style="display: block;"></span>
</div>
</body>
</html>