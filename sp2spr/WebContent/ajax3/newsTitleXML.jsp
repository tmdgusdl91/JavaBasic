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

	div{
		margin : auto;
		border : 1px solid #0000ff;
		width : 600px;
		height : 70%;
		padding : 10px;
	}

</style>

<script type="text/javascript" src="<%=cp %>/data/js/ajaxUtil2.js"></script>
<script type="text/javascript">
	function newsTitle(){
		sendRequest("newsTitleXML_ok.jsp",null,displayNewsTitle,"GET");
		setTimeout("newsTitle()",3000)
	}
	function displayNewsTitle(){
		if(httpRequest.readyState == 4){
			if(httpRequest.status == 200){
				var doc = httpRequest.responseXML;
				//alert(doc);
				
				var count = doc.getElementsByTagName("count").item(0).firstChild.nodeValue;
				//alert(count);
				
				if(count > 0 ){
					var titleNL = doc.getElementsByTagName("title");
					var htmlData = "<ol>";
					for(var i = 0 ; i < titleNL.length ; i++){
						htmlData += "<li>" +  titleNL.item(i).firstChild.nodeValue;
					}
					htmlData +="</ol>";
					var newsDIV = document.getElementById("news");
					newsDIV.innerHTML = htmlData;
				}
			}else{
			}
		}else{
		}
	}
	
	window.onload = function(){
		newsTitle();
	}
</script>

</head>
<body>

<h1> 실시간 뉴스 </h1>
<hr/>
<br/>
<div id="news"></div>

</body>
</html>