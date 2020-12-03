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
<title>jQuery로 구현한 Ajax</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">

	$(function(){
		$("#sendButton").click(function(){
			var params = "subject="+$("#subject").val()+"&content="+$("#content").val();
			
			$.ajax({
				type:"POST",
				url:"test2_ok.jsp",
				data:params,
				dataType:"xml",
				success:function(args){
					$(args).find("status").each(function(){
						alert($(this).text());
					});
					var str ="";
					$(args).find("record").each(function(){
						var id = $(this).attr("id");
						var subject = $(this).find("subject").text();
						var content = $(this).find("content").text();
						
						str+="id="+id+", subject="+subject+",content="+content+"<br/>";
					});
					
					$("#resultDiv").html(str);
				},
				beforeSend:showRequest,
				error:function(e){
					alert(e.responseText);
				}
			});
		});
	});

	function showRequest(){
		var flag = true;
		if(!$("#subject").val()){
			alert("제목을 입력해주세요");
			$("#subject").focus();
			return false;
		}
		if(!$("#content").val()){
			alert("내용을 입력해주세요");
			$("#content").focus();
			return false;
		}
		return flag;
	}
	
</script>
</head>
<body>
제목 : <input type="text" id="subject"/><br/>
내용 : <input type="text" id="content"/><br/>
<input type="button" id="sendButton" value="보내기"/><br/>
<br/>
<div id="resultDiv"></div>
</body>
</html>