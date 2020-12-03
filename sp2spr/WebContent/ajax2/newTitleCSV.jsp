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
<style type="text/css">

.news{
	font-size: 9pt;
	display: block;
	margin: 0 auto;
	background: yellow;
	color : blue;
	border : 1px dashed black;
	width: 50%;
}

.newsErr{
	font-size: 9pt;
	display: block;
	margin: 0 auto;
	background: orange;
	color : red;
	border : 5px dashed black;
	width: 50%;
}

</style>

<script type="text/javascript" src="<%=cp %>/data/js/ajaxUtil2.js"></script>
<script type="text/javascript">

	function newsTitle(){
		//hideNewsDIV();		
		showNewsDIV();
		sendRequest("newTitleCSV_ok.jsp",null,disPlayNewsTitle,"GET");
		setTimeout("newsTitle()", 3000);
	}
	
	//뉴스 보임
	function showNewsDIV(){
		var newsDiv = document.getElementById("newsDIV");
		newsDiv.style.display = "block";
	}
	
	//뉴스 숨김
	function hideNewsDIV(){
		var newsDiv = document.getElementById("newsDIV");
		newsDiv.style.display = "none";
	}
	
	window.onload = function(){
		newsTitle();
	}
	
	function disPlayNewsTitle(){
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
				var csvStr = httpRequest.responseText;
				var csvArray = csvStr.split("|");   //배열의 길이만 따로 분리.
				var countStr = csvArray[0];
				if(countStr==0){
					alert("데이터없음");
					return;
				}
				csvStr = csvArray[1];
				csvArray = csvStr.split("*");
				
				var html = "";
				
				html+="<ol>";
				for(var i = 0 ; i < csvArray.length ; i++){
					var newsTitle = csvArray[i];
					html+="<li>"+newsTitle+"</li>";
				}
				
				html +="</ol>";
				
				var newsDIV = document.getElementById("newsDIV");
				newsDIV.innerHTML = html;
				
			}
			else{
				var newsDIV = document.getElementById("newsDIV");
				newsDIV.innerHTML = httpRequest.status + " 에러";
				
				//IE
				newsDIV.className = "newsError";
				//none-IE
				newsDIV.setAttribute("class","newsError");
			}
		}
	}

</script>
</head>
<body>

<h1>헤드라인 늬우쓰</h1>
<hr/>
<br/>
<div onmouseover="showNewsDIV();" onmouseout="hideNewsDIV();" style="display: block;border: 3px solid; width: 50%; margin: 0 auto;">뉴스보기</div>
<div id="newsDIV" class="news"></div>
<hr/>

</body>
</html>