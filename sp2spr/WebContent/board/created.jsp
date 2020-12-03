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
<title>게 시 판 (Struts2 + Spring2.5)</title>
<link rel="stylesheet" href="<%=cp%>/board/css/style.css" type="text/css"/>
 <link rel="stylesheet" href="<%=cp%>/board/css/created.css" type="text/css"/>
<script type="text/javascript" src="<%=cp%>/board/js/util.js"></script>


</head>
<body>
<div id="bbs">
	<div id="bbs_title">
	게 시 판 (Struts2 + Spring 2.5)
	</div>
	
	<form action="" name="myForm" method="post">
	<div id="bbsCreated">
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>제&nbsp;&nbsp;&nbsp;&nbsp;목</dt>
				<dd>
					<input type="text" name="subject" size="65" maxlength="100" class="boxTF/">
				</dd>
			</dl>
		</div>
		
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>작성자</dt>
				<dd>
					<input type="text" name="name" size="35" maxlength="20" class="boxTF"/>
				</dd>
			</dl>
		</div>
	
		<div class="bbsCreated_bottomLine">
			<dl>
				<dt>E-Mail</dt>
				<dd>
					<input type="text" name="email" size="35" maxlength="50" class="boxTF"/>
				</dd>
			</dl>
		</div>
	
		<div id="bbsCreated_content">
			<dl>
				<dt>내&nbsp;&nbsp;&nbsp;&nbsp;용</dt>
				<dd>
					<textarea name="content" rows="12" cols="63" class="boxTA"></textarea>
				</dd>
			</dl>
		</div>
		
		<div id="bbsCreated_noLine">
			<dl>
				<dt>패스워드</dt>
				<dd>
					<input type="password" name="pwd" size="35" maxlength="7" class="boxTF"/>&nbsp;(게시물 수정 및 삭제시 필요!)
				</dd>
			</dl>
		</div>
	</div>
	
	
		<div id="bbsCreated_footer">
			<input type="hidden" name="mode" value="created"/>
			<input type="button" value=" 등록하기 " class="btn2" onclick="asdf();"/>
			<input type="reset" value=" 다시입력 " class="btn2" onclick="document.myForm.subject.focus();"/>
			<input type="button" value=" 작성취소 " class="btn2" onclick="location='<%=cp %>/bbs/list.action';"/>
		</div>
	
	
	</form>


</div>

</body>

<script type="text/javascript">

	function asdf() {
		document.myForm.action = "<%=cp%>/bbs/created.action";
		document.myForm.submit();		
	}
</script>
</html>