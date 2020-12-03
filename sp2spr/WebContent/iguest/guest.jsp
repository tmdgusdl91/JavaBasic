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
<script type="text/javascript">

	$(function(){
		listPage(1);
	});

	$(document).ready(function(){
		$("#sendButton").click(function(){
			var params = "name="+$("#name").val()+ "&email="+$("#email").val()+"&content="+$("#content").val();
			
			$.ajax({
				url:"<%=cp%>/guest/created.action",
				data:params,
				success:function(args){
					$("#listData").html(args);					
					//입력한 데이터 삭제 새로고침이 안되기때문에 지워줘야함
					$("#name").val("");
					$("#email").val("");
					$("#content").val("");
					$("#name").focus();
				},
				beforeSend : showRequest,
				error:function(e){
					alert(e.responseText);
				}		
			});
		});
	});
	
	function showRequest(){
		var name = $.trim($("#name").val()); //양쪽의 공백을 없앰
		var email = $.trim($("#email").val()); //양쪽의 공백을 없앰
		var content = $.trim($("#content").val()); //양쪽의 공백을 없앰
		
		if(!name){
			alert("이름입력");
			$("#name").focus();
			return false;
		}
		if(!email){
			alert("이메일입력");
			$("#email").focus();
			return false;
		}
		if(!content){
			alert("내용입력");
			$("#content").focus();
			return false;
		}
		if(content.length>200){
			alert("내용은200자까지만 가능");
			$("#content").focus();
			return false;
		}
		return true;
	}
	
	function listPage(page){
		var url ="<%=cp %>/guest/list.action";
		$.post(url,{pageNum:page},function(args){
			$("#listData").html(args);
		});
		
		$("#listData").show();
	}
	
	function deleteData(num,page){
		var url ="<%=cp %>/guest/deleted.action";
		$.post(url,{num:num,pageNum:page},function(args){
			$("#listData").html(args);
		});		
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
				<input type="text" id="name" size="35" maxlength="20" class="boxTF"/>
			</td>
			<td width="60" height="30" bgcolor="pink" align="center">이메일</td>
			<td width="240" height="30" style="padding-left: 10px;" bgcolor="pink">
				<input type="text" id="email" size="35" maxlength="50" class="boxTF"/>
			</td>			
		</tr>	
		<tr>
			<td width="600" colspan="4" height="1" bgcolor="pink"></td>
		</tr>
		<tr>
			<td width="60" height="30" bgcolor="pink" align="center">내용</td>
			<td width="540" colspan="3"style="padding-left: 10px;" bgcolor="pink">
				<textarea rows="10" cols="63" id="content" class="boxTA" style="height:50px;"></textarea>
			</td>			
		</tr>	
		<tr>
			<td width="600" colspan="4" height="10" bgcolor="pink"></td>
		</tr>
		<tr>
			<td width="600" colspan="4" height="30" align="right" style="padding-right: 15px;" bgcolor="pink">
				<input type="button" value="등록" id="sendButton"/>
			</td>
		</tr>
	</table>
	
	<br/>
	
	<span id="listData" style="display: none;"></span>
</div>
</body>
</html>