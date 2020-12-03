<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<%!

	String[] keywords={"ajax","Ajax","Ajax 실전 프로래밍","AJAA","AVC","ABC","자바","Adobe","BBBBB","BB크림",
			"블랙핑크","blackPink"};

	public List<String> search(String userKeyword){
		if(userKeyword==null || userKeyword.equals("")){
			return null;
		}
		
		//무조건 소문자로
		userKeyword = userKeyword.toLowerCase();
		
		List<String> list = new ArrayList<>();
		for(int i = 0 ; i < keywords.length ; i++){
			if(keywords[i].toLowerCase().startsWith(userKeyword)){
				list.add(keywords[i]);
			}
		}		
		return list;		
	}

%>
<%

	String userKeyword = request.getParameter("userKeyword");
	List<String> keywordList = search(userKeyword);
	out.print(keywordList.size());
	out.print("|");
	Iterator<String> lit = keywordList.iterator();
	while(lit.hasNext()){
		String value = (String)lit.next();
		out.print(value);
		if(keywordList.size()-1>0){
			out.print(",");
		}
	}
%>