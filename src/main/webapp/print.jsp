<%@page import="com.project_process_automation.login.LoginAdmin" %>
<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setHeader("Expires", "0"); //Proxies
	LoginAdmin u=(LoginAdmin)session.getAttribute("admin");	
	if(u==null){
		response.sendRedirect("index.jsp");
	}
	int past_year = (int)session.getAttribute("past_year");
	
%>

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
	<button onclick="printFunction()">Print / Save as PDF</button>
	<button onclick="Export2Doc('exportContent');">Export as .doc</button>
    <script>
      function printFunction() { 
        window.print(); 
      }
    </script>
    <script>
	function Export2Doc(element, filename = '') {
	
	            var preHtml = "<html xmlns:o='urn:schemas-microsoft-com:office:office' xmlns:w='urn:schemas-microsoft-com:office:word' xmlns='http://www.w3.org/TR/REC-html40'><head><meta charset='utf-8'><title>Export HTML To Doc</title></head><body>";
	            var postHtml = "</body></html>";
	
	            var html = preHtml + document.getElementById(element).innerHTML + postHtml;
	
	            var blob = new Blob(['\ufeff', html], {
	                type: 'application/msword'
	            });
	
	            var url = 'data:application/vnd.ms-word;charset=utf-8,' + encodeURIComponent(html);
	
	
	            filename = filename ? filename + '.doc' : 'document.doc';
	
	
	            var downloadLink = document.createElement("a");
	
	            document.body.appendChild(downloadLink);
	
	            if (navigator.msSaveOrOpenBlob) {
	                navigator.msSaveOrOpenBlob(blob, filename);
	            } else {
	
	                downloadLink.href = url;
	                downloadLink.download = filename;
	                downloadLink.click();
	            }
	
	            document.body.removeChild(downloadLink);
	        }

		</script>
    	<div id="exportContent">
			<main>
				<!-- 
				
				<img src="images/heading2.png"  style="display:block; margin-left: auto; margin-right: auto; width: 50%;">
				 -->
				<sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://127.0.0.1:3306/project_process_automation?useSSl=false" user="root" password="Messidona#3"/>
                <sql:query var="rs" dataSource="${db}">select * from student_group where year = ${past_year} order by group_num;</sql:query>
                 
                 
                 	<div style="width: 70%; margin-left: auto; margin-right: auto;">
	                 	<h1 style="text-align: center;">Shri G.S. Institute of Technology and Science</h1>
	                 	<h2 style="text-align: center;">Guide Allotment for UG Major Project</h2>
	                 	<h2 style="text-align: center;">Session: ${past_year} </h2>
                 	</div>
                
                 
                                
                <table border="1px solid black" "cellpadding="5" style="width:100%; margin-left: auto; margin-right:auto;" >
		            <caption><h3><strong>List of Groups</strong></h3></caption>
		            <tr>
		                <th style="width:7%">Group no.</th>
		                <th style="width:17%">Members</th>
		                <th style="width:13%">Phone Numbers</th>
		                <th style="width:13%">Email ID</th>
		                <th style="width:10%">Area Preference 1</th>
		                <th style="width:10%">Area Preference 2</th>
		                <th style="width:10%">Area Preference 3</th>
		                <th style="width:10%">Guide Alloted</th>
		                <th style="width:10%">Co-Guide</th>
		            </tr>
		            <c:forEach items="${rs.rows}" var="group">
		            	<sql:query var="rs2" dataSource="${db}">SELECT * FROM student where group_id = "${group.group_id}" and role_id = 1;</sql:query>
		                <c:forEach items="${rs2.rows}" var="leader">
		                	<sql:query var="rs3" dataSource="${db}">SELECT * FROM teacher where teacher_id = "${group.guide_alloted}";</sql:query>
			                <c:forEach items="${rs3.rows}" var="guide">
			                	<sql:query var="rs2" dataSource="${db}">SELECT * FROM areas where area_id = "${group.area_pref_1}";</sql:query>
				                <c:forEach items="${rs2.rows}" var="pref_1">
				                	<sql:query var="rs3" dataSource="${db}">SELECT * FROM areas where area_id = "${group.area_pref_2}";</sql:query>
				                	<c:forEach items="${rs3.rows}" var="pref_2">
				                		<sql:query var="rs4" dataSource="${db}">SELECT * FROM areas where area_id = "${group.area_pref_3}";</sql:query>
				                		<c:forEach items="${rs4.rows}" var="pref_3">
				                			<c:if test="${empty group.guide_alloted_2}" var="condition">
						                		<tr>
							                		<th rowspan="5" style="font-size: 20px"><c:out value="B${group.group_num}" /></td>
							                    	<td><c:out value="${leader.enroll_num}" /></td>
							                    	<td><c:out value="${leader.phone_num}" /></td>
							                    	<td><c:out value="${leader.email_id}" /></td>
							                    	<td rowspan="5"><c:out value="${pref_1.area}" /></td>
											        <td rowspan="5"><c:out value="${pref_2.area}" /></td>
											        <td rowspan="5"><c:out value="${pref_3.area}" /></td>
							                    	<td rowspan="5"><c:out value="${guide.full_name}" /></td>
							                    </tr>
							                    <sql:query var="rs2" dataSource="${db}">SELECT * FROM student where group_id = "${group.group_id}" and role_id = 2;</sql:query>
					               	 			<c:forEach items="${rs2.rows}" var="mem">
					               	 				<tr>
								                    	<td><c:out value="${mem.enroll_num}" /></td>
								                    	<td><c:out value="${mem.phone_num}" /></td>
								                    	<td><c:out value="${mem.email_id}" /></td>
								                    </tr>
		               	 						</c:forEach>
				                			</c:if>
							                <c:if test="${!condition}">
							                	<sql:query var="rs4" dataSource="${db}">SELECT * FROM teacher where teacher_id = "${group.guide_alloted_2}";</sql:query>
							               		<c:forEach items="${rs4.rows}" var="co_guide">
							            		<tr>
							                    	<th rowspan="5" style="font-size: 20px"><c:out value="B${group.group_num}" /></td>
							                    	<td><c:out value="${leader.enroll_num}" /></td>
							                    	<td><c:out value="${leader.phone_num}" /></td>
							                    	<td><c:out value="${leader.email_id}" /></td>
							                    	<td rowspan="5"><c:out value="${pref_1.area}" /></td>
											        <td rowspan="5"><c:out value="${pref_2.area}" /></td>
											        <td rowspan="5"><c:out value="${pref_3.area}" /></td>
							                    	<td rowspan="5"><c:out value="${guide.full_name}" /></td>	
							                    	<td rowspan="5"><c:out default="" value="${co_guide.full_name}" /></td>	                    	
							                	</tr>
							                	<sql:query var="rs2" dataSource="${db}">SELECT * FROM student where group_id = "${group.group_id}" and role_id = 2;</sql:query>
					               	 			<c:forEach items="${rs2.rows}" var="mem">
					               	 				<tr>
								                    	<td><c:out value="${mem.enroll_num}" /></td>
								                    	<td><c:out value="${mem.phone_num}" /></td>
								                    	<td><c:out value="${mem.email_id}" /></td>
								                    </tr>
					               	 			</c:forEach>
							                	</c:forEach>				                	
							                </c:if>	
										</c:forEach>
									</c:forEach>
								</c:forEach>   
			                				            				            		
			            	</c:forEach>
		            	</c:forEach>
		            </c:forEach>
        		</table>
        		<br>
        		<br>
        		<br>
        		<br>
        		<br>
                 
                 	<div style="width: 70%; margin-left: auto; margin-right: auto;">
				        <div style="width: 50%; height: 100px; float: left; margin-left: auto; margin-right: auto;"> 			     
				        	<h2 style="text-align: center;">Head</h2> 
				            <h2 style="text-align: center;">Computer Engg. Department</h2>	        			            
				        </div>
				        <div style="margin-left: 50%; height: 100px; margin-left: auto; margin-right: auto;">
				        	<br>
				        	<h2 style="text-align: center;">Professor In-charge </h2>			       			            
				        </div>
			    	</div>
                 
			</main>
		</div>		
</body>
</html>