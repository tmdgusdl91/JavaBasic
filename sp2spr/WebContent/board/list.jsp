<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게 시 판</title>
<link rel="stylesheet" href="<%=cp%>/board/css/style.css" type="text/css"/>
<link rel="stylesheet" href="<%=cp%>/board/css/list.css" type="text/css"/>
</head>
<body>
<div id="bbsList">	
	<div id="bbsList_title">
	게 시 판 (Struts2 + Spring 2.5)
	</div>
	
	<div id="bbsList_header">
		<div id="leftHeader">
			<form action="" name="searchForm" method="post">
				<select name="searchKey" class="selectFiled">
					<option value="subject">제목</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
				</select>
				<input type="text" name="searchValue" class="textFiled"/>
				<input type="button" value=" 검 색 " class="btn2" onclick="searchData();"/>
			</form>
		</div>
		
		<div id="rightHeader">
			<input type="button" value=" 글올리기 " class="btn2"  onclick="location='<%=cp %>/bbs/created.action';"/>
		</div>
	
	</div>

	<div id="bbsList_list">
		<div id="title">
			<dl><!-- 용어를 설명하는목록을 만듬 -->
				<dt class="num">번호</dt> <!-- 용어의 제목을 넣을때 -->
				<dt class="subject">제목</dt>
				<dt class="name">이름</dt>
				<dt class="created"	>작성일</dt>
				<dt class="hitCount">조회수</dt>
			</dl>
		
		</div>
		<div id="lists">
		<c:forEach var="dto" items="${list }">
			<dl>
				<dd class="num">${dto.listNum }</dd><!-- 용어를 설명하는데 사용 -->
				<dd class="subject">
				<a href="${urlArticle}&num=${dto.num}">
				${dto.subject }
				</a></dd>
				<dd class="name">${dto.name }</dd>
				<dd class="created"	>${dto.created }</dd>
				<dd class="hitCount">${dto.hitCount }</dd>
			</dl>
		</c:forEach>
		</div>
		
		<div id="footer">
			<c:if test="${totalDataCount!=0 }">
				${pageIndexList }
			</c:if>
			<c:if test="${totalDataCount==0 }">
				<p>등록된 게시물이 없습니다.</p>
			</c:if>
		</div>

	</div>

</div>


</body>

<script type="text/javascript">

	function searchData(){
		var f = document.searchForm;
		f.action = "<%=cp %>/bbs/list.action";
		f.submit();
	}
</script>

</html>