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
#resultDIV{

	border : 1px dotted #00ff00;

}

div {

	margin : auto;
	width : 600;
	height : 100%;
	
}
</style>

<script type="text/javascript">

	function useJson(){		
		var userArray = [			
			{
				userId : "suzi",
				name : "숮이",
				age : 25,
				phone : [
					{home:["063-445-7278","063-445-7878"]},
					{office:["063-445-7878","062-123-7897"]},
					{phone:"010-8311-7274"}					
				]			
			},  //여기까지가 한명의 데이터
			{
				userId : "bo-young",	
				name: "박보영",
				age : 31,
				phone : [
					{home:["063-445-7278","063-445-7878"]},
					{office:["063-445-7878","062-123-7897"]},
					{phone:"010-8311-7274"}					
				]			
			},
			{
				userId : "Rose",	
				name: "로제",
				age : 25,
				phone : [
					{home:["063-445-7278","063-445-7878"]},
					{office:["063-445-7878","062-123-7897"]},
					{phone:"010-8311-7274"}					
				]			
			}
		];
		
		//한개의 데이터 가져오기
		var id = userArray[0].userId;
		var name = userArray[0].name;
		var age = userArray[0].age;
		var homephone1 = userArray[0].phone[0].home[0];
		var homephone2 = userArray[0].phone[0].home[1];
		var officephone1 = userArray[0].phone[1].office[0];
		var officephone2 = userArray[0].phone[1].office[1];
		var phone = userArray[0].phone[2].phone;
		
		
		var printData = id + "," + name +","+age +",<br/>";
		printData+="집1"+homephone1+"<br/>";
		printData+="집2"+homephone2+"<br/>";
		printData+="회사1"+officephone1+"<br/>";
		printData+="회사2"+officephone2+"<br/>";
		printData+="개인폰"+phone;
		
		var resultDIV = document.getElementById("resultDIV");
		resultDIV.innerHTML = printData;
	}

	window.onload = function(){
		useJson();
	}
	
</script>

</head>
<body>

<h1>JSON(Javascript Object Notation)</h1>

<hr/>

<div id="resultDIV"></div>

</body>
</html>