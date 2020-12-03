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
	font-size: 10pt;
	display : block;
	margin : 0 auto;
	background : pink;
	color : blue;
	border : 1px dashed black;
	width: 50%;
}

.newsError{

	font-size: 10pt;
	display : block;
	margin : 0 auto;
	background : orange;
	color : red;
	border : 1px dashed black;
	width: 50%;
}
</style>
<script type="text/javascript" src="<%=cp%>/data/js/ajaxUtil2.js"></script>
<script type="text/javascript">

	function newsTitle(){
		sendRequest("newsTitleJSON_ok.jsp",null,displayNewsTitle,"GET");
		setTimeout("newsTitle()",3000);
	}
	//JSON은 TEXT로 넘어옴
	function displayNewsTitle(){
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
				var jsonStr = httpRequest.responseText;
				var jsonObject = window.eval('('+jsonStr+')');  //TEXT를 읽어서 JSON형태로 객체화 시킴.
				/*
				jsonObject -> object;
				jsonObject.count -> 4;
				jsonObject.title[0].publisher -> 동물의왕국
				*/
				var count = jsonObject.count;
				var htmlData = "<ol>";
				if(count>0){
					for(var i = 0 ; i <count ; i++){
						var publisherStr = jsonObject.title[i].publisher;
						var headLineStr = jsonObject.title[i].headline;						
						htmlData += "<li>" + headLineStr + " ["+publisherStr+"]</li>";	
					}
				}
				htmlData+= "</ol>";
				var newsDIV = document.getElementById("newsDIV");
				newsDIV.innerHTML = htmlData;
			}
		}
	}
	
	window.onload = function(){
		newsTitle();
	}

</script>
</head>
<body>

<h1>NewsTitleJSON</h1>
<h2>헤드라인 뉴스</h2>
<hr/>
<br/>

<div style="width: 50%; margin: 0 auto;">뉴스보기</div>
<div id="newsDIV" class="news"></div>

</body>
</html>