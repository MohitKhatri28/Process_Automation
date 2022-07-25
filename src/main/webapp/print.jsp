<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
                <sql:query var="rs" dataSource="${db}">select * from student_group order by avg_cgpa desc;</sql:query>
                                
                <table border="1px solid black" "cellpadding="5" style="width:80%; margin-left: auto; margin-right:auto;" >
		            <caption><strong>List of Groups</strong></caption>
		            <tr>
		                <th style="width:30%">Group no.</th>
		                <th style="width:30%">Members</th>
		                <th >Guide Alloted</th>
		                <th >Co-Guide</th>
		            </tr>
		            <c:forEach items="${rs.rows}" var="group">
		            	<sql:query var="rs2" dataSource="${db}">SELECT * FROM student where group_id = "${group.group_id}" and role_id = 1;</sql:query>
		                <c:forEach items="${rs2.rows}" var="leader">
		                	<sql:query var="rs3" dataSource="${db}">SELECT * FROM teacher where teacher_id = "${group.guide_alloted}";</sql:query>
			                <c:forEach items="${rs3.rows}" var="guide">
			                	<c:if test="${empty group.guide_alloted_2}" var="condition">
			                		<tr>
				                		<th rowspan="5" style="font-size: 20px"><c:out value="B${group.group_num}" /></td>
				                    	<td><c:out value="${leader.enroll_num}" /></td>
				                    	<td><c:out value="${guide.full_name}" /></td>
				                    </tr>
				                    <sql:query var="rs2" dataSource="${db}">SELECT * FROM student where group_id = "${group.group_id}" and role_id = 2;</sql:query>
		               	 			<c:forEach items="${rs2.rows}" var="mem">
		               	 				<tr>
					                    	<td><c:out value="${mem.enroll_num}" /></td>
					                    </tr>
		               	 			</c:forEach>
				                </c:if>
				                <c:if test="${!condition}">
				                	<sql:query var="rs4" dataSource="${db}">SELECT * FROM teacher where teacher_id = "${group.guide_alloted_2}";</sql:query>
				               		<c:forEach items="${rs4.rows}" var="co_guide">
				            		<tr>
				                    	<th rowspan="5" style="font-size: 20px"><c:out value="B${group.group_num}" /></td>
				                    	<td><c:out value="${leader.enroll_num}" /></td>
				                    	<td><c:out value="${guide.full_name}" /></td>	
				                    	<td><c:out default="" value="${co_guide.full_name}" /></td>	                    	
				                	</tr>
				                	<sql:query var="rs2" dataSource="${db}">SELECT * FROM student where group_id = "${group.group_id}" and role_id = 2;</sql:query>
		               	 			<c:forEach items="${rs2.rows}" var="mem">
		               	 				<tr>
					                    	<td><c:out value="${mem.enroll_num}" /></td>
					                    </tr>
		               	 			</c:forEach>
				                	</c:forEach>				                	
				                </c:if>				            				            		
			            	</c:forEach>
		            	</c:forEach>
		            </c:forEach>
        		</table>
			</main>
				
</body>
</html>