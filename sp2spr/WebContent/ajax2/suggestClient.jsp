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
	
	.suggest{
		display:none;
		position: absolute;
		left: 11px;
		top: 131px;
	}	
</style>

<script type="text/javascript" src="<%=cp %>/data/js/ajaxUtil2.js"></script>

<script type="text/javascript">
	function sendKeyword(){
		var userKeyword = document.myForm.userKeyword.value;
		
		//검색창 값이 null이라면.
		if(userKeyword=="null"){
			hide();
			return;
		}
		
		var params = "userKeyword="+userKeyword;
		
		sendRequest("suggestClient_ok.jsp",params,displaySuggest,"POST");
	}	
	
	function displaySuggest(){
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
				var resultText = httpRequest.responseText;
				var strLength = resultText.split("|");
				strLength = parseInt(strLength[0]);
				var keywordList = null;
				if(strLength>0){
					keywordList = resultText.split("|");
					keywordList = keywordList[1].split(",");
					var html = "";
					
					for(var i=0 ; i< keywordList.length; i++){
						html +="<a href=\"javascript:select('"+keywordList[i]+"');\">"+keywordList[i] + "</a><br/>";
					}
					
					var suggestListDIV = document.getElementById("suggestListDIV");
					suggestListDIV.innerHTML = html;
					show();
				}else{
					hide();
				}
			}
			else{
				hide();
			}
		}else{
			hide();
		}
		
	}
	
	//검색리스트 보이기
	function show(){
		var suggestDIV = document.getElementById("suggestDIV");
		suggestDIV.style.display = "block";
	}
	
	//검색리스트 숨기기
	function hide(){
		var suggestDIV = document.getElementById("suggestDIV");
		suggestDIV.style.display = "none";
	}
	
	function select(selectKeyword){
		document.myForm.userKeyword.value = selectKeyword;
		hide();
	}
	
	window.onload = function(){
		hide();
	}
	
	
</script>

</head>
<body>

<h1>제시어</h1>
<hr/>
<br/>

<form action="" name="myForm">

<input type="text" name="userKeyword" onkeyup="sendKeyword();"/>
<input type="button" value="검색"/>
<br/>

<div id="suggestDIV" class="suggest">

	<div id="suggestListDIV"></div> 

</div>

</form>

</body>
</html>