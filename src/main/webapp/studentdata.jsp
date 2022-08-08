<%@page import="com.project_process_automation.login.LoginAdmin" %>
<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setHeader("Expires", "0"); //Proxies
	LoginAdmin u=(LoginAdmin)session.getAttribute("admin");	
	if(u==null){
		response.sendRedirect("index.jsp");
	}
	
%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html  x-data="data()" lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Group Data</title>
    
</head>

<body>
    <button onclick="printFunction()">Print</button>
	
    <script>
      function printFunction() { 
        window.print(); 
      }
    </script>
			<main>
				<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://127.0.0.1:3306/project_process_automation?useSSl=false" user="root" password="Messidona#3"/>
                <sql:query var="rs" dataSource="${db}">select * from student_group order by group_num;</sql:query>
                                
                <table border="1px solid black" "cellpadding="5" style="width:100%; margin-left: auto; margin-right:auto;" >
		            <caption><strong>List of Groups</strong></caption>
		            <tr>
		                <th style="width:10%">Group no.</th>
		                <th style="width:20%">Area Preference 1</th>
		                <th style="width:20%">Area Preference 2</th>
		                <th style="width:20%">Area Preference 3</th>
		            </tr>
		            <c:forEach items="${rs.rows}" var="group">
		            	<sql:query var="rs2" dataSource="${db}">SELECT * FROM areas where area_id = "${group.area_pref_1}";</sql:query>
		                <c:forEach items="${rs2.rows}" var="pref_1">
		                	<sql:query var="rs3" dataSource="${db}">SELECT * FROM areas where area_id = "${group.area_pref_2}";</sql:query>
		                	<c:forEach items="${rs3.rows}" var="pref_2">
		                		<sql:query var="rs4" dataSource="${db}">SELECT * FROM areas where area_id = "${group.area_pref_3}";</sql:query>
		                		<c:forEach items="${rs4.rows}" var="pref_3">
									<tr>
								        <th style="font-size: 17px"><c:out value="B${group.group_num}" /></td>
								        <td><c:out value="${pref_1.area}" /></td>
								        <td><c:out value="${pref_2.area}" /></td>
								        <td><c:out value="${pref_3.area}" /></td>
								    </tr>
								</c:forEach>
							</c:forEach>
						</c:forEach>     		                	
				    </c:forEach>
        		</table>
			</main>
</body>

</html>