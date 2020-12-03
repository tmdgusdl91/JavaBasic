<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%
	
%>
<%!String[] newsTitle = {

			"[속보] 목도리 도마뱀 목도리 벗고 파격노출..",

			"사람 살해.. 체험살해현장되나...",

			"대추나무에 사람걸려....",

			"부인 순풍산씨.....",

			"롯데파산.... 좃데겠네....."

	};

	String[] newsPublisher = {
		"동물의왕국","체험삶의현장","대추나무 사랑걸렸네","순풍산부인과","메일경제"
	};
	
%>

{
	"count":<%=newsTitle.length %>,
	"title":[
	<%
		for(int i = 0 ; i<newsTitle.length;i++){
			out.print("{");
			out.print("headline:\""+newsTitle[i]+"\"");
			out.print(",");
			out.print("publisher:\""+newsPublisher[i]+"\"");
			out.print("}");
			
			if(i!=(newsTitle.length-1)){
				out.print(",");
			}
		}
	 %>
	]
}