<%@page import="com.project_process_automation.login.Login" %>
<% 
	Login u=(Login)session.getAttribute("user");	
	if(u==null){
		response.sendRedirect("index.jsp");
	}
	
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	

	login successful <br/>
	Welcome <%= u.getUsername() %>
	
</body>
</html>