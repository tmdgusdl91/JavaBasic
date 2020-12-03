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
<title>JSON DATA</title>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
	
	$(document).ready(function(){
		$("#saveButton").click(function(){
			var params = "userId="+$("#userId").val() +"&userPwd="+$("#userPwd").val();
			
			$.ajax({
				type:"post",
				url:"test4_ok.jsp",
				data:params,
				dataType:"json",
				success:function(args){
					var str = "";
					for(var i = 0 ; i<args.length ; i++){
						str += "id="+args[i].id;
						str += ",userId="+args[i].userId;
						str += ",userPwd="+args[i].userPwd + "<br/>";
					}
					
					$("#resultDiv").html(str);
				},
				error:function(e){
					alert(e.responseText);
				}
			});
		});
	});

</script>
</head>
<body>

아이디 : <input type="text" id="userId"/><br/>
패스워드 : <input type="text" id="userPwd"/><br/>

<button id="saveButton">전송</button><br/>


<br/>
<br/>
<div id="resultDiv">

</div>
</body>
</html>