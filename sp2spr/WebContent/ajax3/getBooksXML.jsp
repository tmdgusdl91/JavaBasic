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
<script type="text/javascript" src="<%=cp %>/data/js/ajaxUtil2.js"></script>
<script type="text/javascript">
	function getBookList(){
		sendRequest("books.xml",null,displayBookList,"GET");		
	}
	
	function displayBookList(){
		if(httpRequest.readyState==4){
			if(httpRequest.status==200){
				//전달받은 XML을 DOM객체에 넣음
				var Document = httpRequest.responseXML;
				
				//DOM객체에서 Element 추출
				var booksE = Document.documentElement;   //XML의 테그들을 Element라고함
				
				//book의 갯수 추출
				var bookNL = booksE.getElementsByTagName("book");
				
				var html = "";
				html += "<ol>";
				
				if(bookNL.length < 1){
					return;
				}
				
				for(var i = 0 ; i < bookNL.length ;i++){
					//한개의 book을 읽음
					var bookE = bookNL.item(i);
														//title을 읽음
					var titleStr = bookE.getElementsByTagName("title").item(0).firstChild.nodeValue;
														
														//author를 읽음
					var authorStr = bookE.getElementsByTagName("author").item(0).firstChild.nodeValue;
														
					html += "<li>" + titleStr + "&nbsp;&nbsp;&nbsp;" + authorStr + "</li>";
				}
				html += "</ol>";
				
				var bookDIV = document.getElementById("bookDIV");
				bookDIV.innerHTML = html;
			}
		}
	}
	
	window.onload = function(){
		getBookList();
	}
</script>
</head>
<body>

<h1 id="list">Book List</h1>
<hr/>
<div id="bookDIV" style="display: block; margin: 0 auto;"></div>

</body>
</html>