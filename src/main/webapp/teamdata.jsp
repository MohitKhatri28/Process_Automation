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
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Teams Data</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
        rel="stylesheet" />
    <link rel="stylesheet" href="css/tailwind.output.css" />
    <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
    <script src="js/init-alpine.js"></script>
    <!-- You need focus-trap.js to make the modal accessible -->
    <script src="js/focus-trap.js" defer></script>
    <!-- CSS only -->
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous"> -->
</head>

<body>
    <div class="flex h-screen bg-gray-50 dark:bg-gray-900" :class="{ 'overflow-hidden': isSideMenuOpen }">
        
        
        <div class="flex flex-col flex-1 w-full">
            <header class="z-10 py-4 bg-white shadow-md dark:bg-gray-800">
                <div
                    class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300">
                    

                    <ul class="flex items-center flex-shrink-0 space-x-6" style="margin-left: 85%;">
                        
                        <!-- Notifications menu -->

                        <!-- Profile menu -->
                        <li class="relative">
                            <button class="align-middle rounded-full focus:shadow-outline-purple focus:outline-none"
                                @click="toggleProfileMenu" @keydown.escape="closeProfileMenu" aria-label="Account"
                                aria-haspopup="true">
                                <img class="object-cover w-8 h-8 rounded-full"
                                    src="https://cdn-icons-png.flaticon.com/512/1946/1946429.png"
                                    alt="" aria-hidden="true" />
                            </button>
                            <template x-if="isProfileMenuOpen">
                                <ul x-transition:leave="transition ease-in duration-150"
                                    x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0"
                                    @click.away="closeProfileMenu" @keydown.escape="closeProfileMenu"
                                    class="absolute right-0 w-56 p-2 mt-2 space-y-2 text-gray-600 bg-white border border-gray-100 rounded-md shadow-md dark:border-gray-700 dark:text-gray-300 dark:bg-gray-700"
                                    aria-label="submenu">
                                    <li class="flex">
                                        <a class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
                                            href="admin.jsp">
                                            <svg class="w-4 h-4 mr-3" aria-hidden="true" fill="none"
                                                stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                viewBox="0 0 24 24" stroke="currentColor">
                                                <path
                                                    d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z">
                                                </path>
                                            </svg>
                                            <span><%= u.getTeacher_name() %></span>
                                        </a>
                                    </li>
                                    <li class="flex">
                                        <form action="logout_admin" method="POST">
					                    	<button type="submit">
					                          <svg class="w-4 h-4 mr-3" aria-hidden="true" fill="none" stroke-linecap="round"
					                        stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
					                        <path
					                          d="M11 16l-4-4m0 0l4-4m-4 4h14m-5 4v1a3 3 0 01-3 3H6a3 3 0 01-3-3V7a3 3 0 013-3h7a3 3 0 013 3v1">
					                        </path>
					                        </svg>
					                        <span>Log out</span>
					                        </button>
					                    </form>
                                    </li>
                                </ul>
                            </template>
                        </li>
                    </ul>
                </div>
            </header>
            
            <main class="h-full overflow-y-auto">
            
            <form action="<%= request.getContextPath() %>/print" method=POST>  
            	<strong> Session: ${past_year} </strong>                         
	            <div>
	               <button type="submit"
	                  class="flex items-center justify-center px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple ">
	                  Print
	               </button>
	            </div>
				</form>
				
				
                <!--Code for making the table-->
                <sql:setDataSource var="db" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://127.0.0.1:3306/project_process_automation?useSSl=false" user="root" password="Messidona#3"/>
                <sql:query var="rs" dataSource="${db}">select * from student_group where year = ${past_year} order by avg_cgpa desc;</sql:query>
                                
                <table border="1" cellpadding="5" style="display:block; margin-left: auto; margin-right: auto; width: 80%;">
		            <caption><strong>List of Groups</strong></caption>
		            <tr>
		                <th>Group no.</th>
		                <th>Leader Name</th>
		                <th>Leader Enrollment</th>
		                <th>Avg. CGPA</th>
		                <th>Area Preference 1</th>
		                <th>Area Preference 2</th>
		                <th>Area Preference 3</th>
		                <th>Guide Alloted</th>
		                <th>Co-Guide</th>
		            </tr>
		            <c:forEach items="${rs.rows}" var="group">
		            	<sql:query var="rs2" dataSource="${db}">SELECT * FROM student where group_id = "${group.group_id}" and role_id = 1;</sql:query>
		                <c:forEach items="${rs2.rows}" var="leader">
		                <sql:query var="rs2" dataSource="${db}">SELECT * FROM areas where area_id = "${group.area_pref_1}";</sql:query>
		                <c:forEach items="${rs2.rows}" var="pref_1">
		                	<sql:query var="rs3" dataSource="${db}">SELECT * FROM areas where area_id = "${group.area_pref_2}";</sql:query>
		                	<c:forEach items="${rs3.rows}" var="pref_2">
		                		<sql:query var="rs4" dataSource="${db}">SELECT * FROM areas where area_id = "${group.area_pref_3}";</sql:query>
		                		<c:forEach items="${rs4.rows}" var="pref_3">
		                			<c:if test="${empty group.guide_alloted}" var="condition_1">
				                		<tr>
					                		<td><c:out value="${group.group_num}" /></td>
					                    	<td><c:out value="${leader.full_name}" /></td>
					                    	<td><c:out value="${leader.enroll_num}" /></td>
					                    	<td><c:out value="${group.avg_cgpa}" /></td>
					                    	<td><c:out value="${pref_1.area}" /></td>
								        	<td><c:out value="${pref_2.area}" /></td>
								        	<td><c:out value="${pref_3.area}" /></td>
					                    </tr>
				               		</c:if>
									<c:if test="${!condition_1}">
				               	<sql:query var="rs3" dataSource="${db}">SELECT * FROM teacher where teacher_id = "${group.guide_alloted}";</sql:query>
			                	<c:forEach items="${rs3.rows}" var="guide">
			                	<c:if test="${empty group.guide_alloted_2}" var="condition">
			                		<tr>
				                		<td><c:out value="${group.group_num}" /></td>
				                    	<td><c:out value="${leader.full_name}" /></td>
				                    	<td><c:out value="${leader.enroll_num}" /></td>
				                    	<td><c:out value="${group.avg_cgpa}" /></td>
				                    	<td><c:out value="${pref_1.area}" /></td>
								        <td><c:out value="${pref_2.area}" /></td>
								        <td><c:out value="${pref_3.area}" /></td>
				                    	<td><c:out value="${guide.full_name}" /></td>
				                    </tr>
				                </c:if>
				                <c:if test="${!condition}">
				                	<sql:query var="rs4" dataSource="${db}">SELECT * FROM teacher where teacher_id = "${group.guide_alloted_2}";</sql:query>
				               		<c:forEach items="${rs4.rows}" var="co_guide">
				            		<tr>
				                    	<td><c:out value="${group.group_num}" /></td>
				                    	<td><c:out value="${leader.full_name}" /></td>
				                    	<td><c:out value="${leader.enroll_num}" /></td>
				                    	<td><c:out value="${group.avg_cgpa}" /></td>
				                    	<td><c:out value="${pref_1.area}" /></td>
								        <td><c:out value="${pref_2.area}" /></td>
								        <td><c:out value="${pref_3.area}" /></td>
				                    	<td><c:out value="${guide.full_name}" /></td>	
				                    	<td><c:out default="" value="${co_guide.full_name}" /></td>	                    	
				                	</tr>
				                	</c:forEach>				                	
				                </c:if>				            				            		
			            		</c:forEach>				                	
				               </c:if>
								
								
								
								</c:forEach>
							</c:forEach>
						</c:forEach> 
		                		
				               			
		            	</c:forEach>
		            </c:forEach>
        		</table>
            </main>
        </div>

    </div>

    <!-- Modal backdrop. This what you want to place close to the closing body tag -->
    <div x-show="isModalOpen" x-transition:enter="transition ease-out duration-150" x-transition:enter-start="opacity-0"
        x-transition:enter-end="opacity-100" x-transition:leave="transition ease-in duration-150"
        x-transition:leave-start="opacity-100" x-transition:leave-end="opacity-0"
        class="fixed inset-0 z-30 flex items-end bg-black bg-opacity-50 sm:items-center sm:justify-center">
        <!-- Modal -->
        <div x-show="isModalOpen" x-transition:enter="transition ease-out duration-150"
            x-transition:enter-start="opacity-0 transform translate-y-1/2" x-transition:enter-end="opacity-100"
            x-transition:leave="transition ease-in duration-150" x-transition:leave-start="opacity-100"
            x-transition:leave-end="opacity-0  transform translate-y-1/2" @click.away="closeModal"
            @keydown.escape="closeModal"
            class="w-full px-6 py-4 overflow-hidden bg-white rounded-t-lg dark:bg-gray-800 sm:rounded-lg sm:m-4 sm:max-w-xl"
            role="dialog" id="modal">
            <!-- Remove header if you don't want a close icon. Use modal body to place modal tile. -->
            <header class="flex justify-end">
                <button
                    class="inline-flex items-center justify-center w-6 h-6 text-gray-400 transition-colors duration-150 rounded dark:hover:text-gray-200 hover: hover:text-gray-700"
                    aria-label="close" @click="closeModal">
                    <svg class="w-4 h-4" fill="currentColor" viewBox="0 0 20 20" role="img" aria-hidden="true">
                        <path
                            d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                            clip-rule="evenodd" fill-rule="evenodd"></path>
                    </svg>
                </button>
            </header>
            <!-- Modal body -->
            <div class="mt-4 mb-6">
                <!-- Modal title -->
                <p class="mb-2 text-lg font-semibold text-gray-700 dark:text-gray-300">
                    Confirm Submission
                </p>
                <!-- Modal description -->
                <p class="text-sm text-gray-700 dark:text-gray-400">

                </p>
            </div>
            <footer
                class="flex flex-col items-center justify-end px-6 py-3 -mx-6 -mb-4 space-y-4 sm:space-y-0 sm:space-x-6 sm:flex-row bg-gray-50 dark:bg-gray-800">
                <button @click="closeModal"
                    class="w-full px-5 py-3 text-sm font-medium leading-5 text-white text-gray-700 transition-colors duration-150 border border-gray-300 rounded-lg dark:text-gray-400 sm:px-4 sm:py-2 sm:w-auto active:bg-transparent hover:border-gray-500 focus:border-gray-500 active:text-gray-500 focus:outline-none focus:shadow-outline-gray">
                    Go Back
                </button>
                <button
                    class="w-full px-5 py-3 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg sm:w-auto sm:px-4 sm:py-2 active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
                    Yes!!
                </button>
            </footer>
        </div>
    </div>
    <!-- End of modal backdrop -->

    <!-- JavaScript Bundle with Popper -->
    <!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
      crossorigin="anonymous"></script> -->
</body>

</html>