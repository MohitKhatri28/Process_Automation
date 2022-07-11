<%@page import="com.project_process_automation.login.Login" %>
<% 

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
	response.setHeader("Expires", "0"); //Proxies

	Login u=(Login)session.getAttribute("user");	
	if(u==null){
		response.sendRedirect("index.jsp");
	}
	
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Automation</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="css/tailwind.output.css" />
  <script src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js" defer></script>
  <script src="js/init-alpine.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" defer></script>
  <script src="js/charts-lines.js" defer></script>
  <script src="js/charts-pie.js" defer></script>
</head>

<body>
  <div class="flex h-screen bg-gray-50 dark:bg-gray-900" :class="{ 'overflow-hidden': isSideMenuOpen }">
    <!-- Desktop sidebar -->
    <aside class="z-20 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block flex-shrink-0">
      <div class="py-4 text-gray-500 dark:text-gray-400">
        <a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200" href="#">
          Project Allotment
        </a>
        <ul class="mt-6">
          <li class="relative px-6 py-3">
           
            <a class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
              href="profile.jsp">
              <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round"
                stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path
                  d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6">
                </path>
              </svg>
              <span class="ml-4">Profile</span>
            </a>
          </li>
        </ul>
        <ul>
          <li class="relative px-6 py-3">
            <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
              href="phase1.jsp">
              <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round"
                stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path
                  d="M8 16H6a2 2 0 01-2-2V6a2 2 0 012-2h8a2 2 0 012 2v2m-6 12h8a2 2 0 002-2v-8a2 2 0 00-2-2h-8a2 2 0 00-2 2v8a2 2 0 002 2z">
                </path>
              </svg>
              <span class="ml-4">Phase 1 Submission</span>
            </a>
          </li>

          <li class="relative px-6 py-3">
            <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
              href="updates.jsp">
              <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round"
                stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path
                  d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10">
                </path>
              </svg>
              <span class="ml-4">Updates</span>
            </a>
          </li>
          <li class="relative px-6 py-3">
            <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
              href="final_submission.jsp">
              <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round"
                stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"></path>
                <path d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path>
              </svg>
              <span class="ml-4">Final Submission</span>
            </a>
          </li>
          <li class="relative px-6 py-3">
            <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
              href="marks_obtained.jsp">
              <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round"
                stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path
                  d="M15 15l-2 5L9 9l11 4-5 2zm0 0l5 5M7.188 2.239l.777 2.897M5.136 7.965l-2.898-.777M13.95 4.05l-2.122 2.122m-5.657 5.656l-2.12 2.122">
                </path>
              </svg>
              <span class="ml-4">Marks Obtained</span>
            </a>
          </li>



      </div>
    </aside>
    <!-- Mobile sidebar -->
    <!-- Backdrop -->
    <div x-show="isSideMenuOpen" x-transition:enter="transition ease-in-out duration-150"
      x-transition:enter-start="opacity-0" x-transition:enter-end="opacity-100"
      x-transition:leave="transition ease-in-out duration-150" x-transition:leave-start="opacity-100"
      x-transition:leave-end="opacity-0"
      class="fixed inset-0 z-10 flex items-end bg-black bg-opacity-50 sm:items-center sm:justify-center"></div>
    <aside class="fixed inset-y-0 z-20 flex-shrink-0 w-64 mt-16 overflow-y-auto bg-white dark:bg-gray-800 md:hidden"
      x-show="isSideMenuOpen" x-transition:enter="transition ease-in-out duration-150"
      x-transition:enter-start="opacity-0 transform -translate-x-20" x-transition:enter-end="opacity-100"
      x-transition:leave="transition ease-in-out duration-150" x-transition:leave-start="opacity-100"
      x-transition:leave-end="opacity-0 transform -translate-x-20" @click.away="closeSideMenu"
      @keydown.escape="closeSideMenu">
      <div class="py-4 text-gray-500 dark:text-gray-400">
        <a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200" href="#">
          Project Allotment
        </a>
        
        <ul class="mt-6">
          <li class="relative px-6 py-3">
            <a class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
              href="profile.jsp">
              <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round"
                stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path
                  d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6">
                </path>
              </svg>
              <span class="ml-4">Profile</span>
            </a>
          </li>
        </ul>
        
        
          <li class="relative px-6 py-3"> 
            <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
              href="phase1.jsp">
              <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round"
                stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path
                  d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01">
                </path>
              </svg>
              <span class="ml-4">Phase 1 Submission</span>
            </a>
          </li>
       
          <li class="relative px-6 py-3">
            <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
              href="updates.jsp">
              <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round"
                stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path
                  d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10">
                </path>
              </svg>
              <span class="ml-4">Updates</span>
            </a>
          </li>
          <li class="relative px-6 py-3">
            <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
              href="final_submission.jsp">
              <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round"
                stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"></path>
                <path d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path>
              </svg>
              <span class="ml-4">Final Submission</span>
            </a>
          </li>
          <li class="relative px-6 py-3">
            <a class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
              href="marks_obtained.jsp">
              <svg class="w-5 h-5" aria-hidden="true" fill="none" stroke-linecap="round" stroke-linejoin="round"
                stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                <path
                  d="M15 15l-2 5L9 9l11 4-5 2zm0 0l5 5M7.188 2.239l.777 2.897M5.136 7.965l-2.898-.777M13.95 4.05l-2.122 2.122m-5.657 5.656l-2.12 2.122">
                </path>
              </svg>
              <span class="ml-4">Marks Obtained</span>
            </a>
          </li>
         
          
          
        </ul>
        
    </aside>
    <div class="flex flex-col flex-1 w-full">
      <header class="z-10 py-4 bg-white shadow-md dark:bg-gray-800">
        <div
          class="container flex items-center justify-between h-full px-6 mx-auto text-purple-600 dark:text-purple-300">
          <!-- Mobile hamburger -->
          <button class="p-1 mr-5 -ml-1 rounded-md md:hidden focus:outline-none focus:shadow-outline-purple"
            @click="toggleSideMenu" aria-label="Menu">
            <svg class="w-6 h-6" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
              <path fill-rule="evenodd"
                d="M3 5a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 10a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1zM3 15a1 1 0 011-1h12a1 1 0 110 2H4a1 1 0 01-1-1z"
                clip-rule="evenodd"></path>
            </svg>
          </button>
          
          <ul class="flex items-center flex-shrink-0 space-x-6" style="margin-left: 75%;">
            <!-- Theme toggler -->
            <li class="flex">
              <button class="rounded-md focus:outline-none focus:shadow-outline-purple" @click="toggleTheme"
                aria-label="Toggle color mode">
                <template x-if="!dark">
                  <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M17.293 13.293A8 8 0 016.707 2.707a8.001 8.001 0 1010.586 10.586z"></path>
                  </svg>
                </template>
                <template x-if="dark">
                  <svg class="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd"
                      d="M10 2a1 1 0 011 1v1a1 1 0 11-2 0V3a1 1 0 011-1zm4 8a4 4 0 11-8 0 4 4 0 018 0zm-.464 4.95l.707.707a1 1 0 001.414-1.414l-.707-.707a1 1 0 00-1.414 1.414zm2.12-10.607a1 1 0 010 1.414l-.706.707a1 1 0 11-1.414-1.414l.707-.707a1 1 0 011.414 0zM17 11a1 1 0 100-2h-1a1 1 0 100 2h1zm-7 4a1 1 0 011 1v1a1 1 0 11-2 0v-1a1 1 0 011-1zM5.05 6.464A1 1 0 106.465 5.05l-.708-.707a1 1 0 00-1.414 1.414l.707.707zm1.414 8.486l-.707.707a1 1 0 01-1.414-1.414l.707-.707a1 1 0 011.414 1.414zM4 11a1 1 0 100-2H3a1 1 0 000 2h1z"
                      clip-rule="evenodd"></path>
                  </svg>
                </template>
              </button>
            </li>
            <!-- Notifications menu -->
            
            <!-- Profile menu -->
            <li class="relative">
              <button class="align-middle rounded-full focus:shadow-outline-purple focus:outline-none"
                @click="toggleProfileMenu" @keydown.escape="closeProfileMenu" aria-label="Account" aria-haspopup="true">
                <img class="object-cover w-8 h-8 rounded-full"
                  src="https://images.unsplash.com/photo-1502378735452-bc7d86632805?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=aa3a807e1bbdfd4364d1f449eaa96d82"
                  alt="" aria-hidden="true" />
              </button>
              <template x-if="isProfileMenuOpen">
                <ul x-transition:leave="transition ease-in duration-150" x-transition:leave-start="opacity-100"
                  x-transition:leave-end="opacity-0" @click.away="closeProfileMenu" @keydown.escape="closeProfileMenu"
                  class="absolute right-0 w-56 p-2 mt-2 space-y-2 text-gray-600 bg-white border border-gray-100 rounded-md shadow-md dark:border-gray-700 dark:text-gray-300 dark:bg-gray-700"
                  aria-label="submenu">
                  <li class="flex">
                    <a class="inline-flex items-center w-full px-2 py-1 text-sm font-semibold transition-colors duration-150 rounded-md hover:bg-gray-100 hover:text-gray-800 dark:hover:bg-gray-800 dark:hover:text-gray-200"
                      href="#">
                      <svg class="w-4 h-4 mr-3" aria-hidden="true" fill="none" stroke-linecap="round"
                        stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                        <path d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                      </svg>
                      <span><%= u.getUsername() %></span>
                    </a>
                  </li>
                  <li class="flex">
                    <form action="logout_student" method="POST">
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
        <div class="container px-6 mx-auto grid">
          <h2 class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
            Profile
          </h2>
          <!-- CTA -->

          <!-- Cards -->
          <div class="grid gap-6 mb-8 md:grid-cols-2 xl:grid-cols-4">
            <!-- Card -->
            <div class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
              <div class="p-3 mr-4 text-orange-500 bg-orange-100 rounded-full dark:text-orange-100 dark:bg-orange-500">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path
                    d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3zM6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z">
                  </path>
                </svg>
              </div>
              <div>
                <p class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">
                  Group No.
                </p>
                <p class="text-lg font-semibold text-gray-700 dark:text-gray-200">
                  <%= u.getGroup_id() %>
                </p>
              </div>
            </div>
            <!-- Card -->
            <div class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
              <div class="p-3 mr-4 text-green-500 bg-green-100 rounded-full dark:text-green-100 dark:bg-green-500">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd"
                    d="M4 4a2 2 0 00-2 2v4a2 2 0 002 2V6h10a2 2 0 00-2-2H4zm2 6a2 2 0 012-2h8a2 2 0 012 2v4a2 2 0 01-2 2H8a2 2 0 01-2-2v-4zm6 4a2 2 0 100-4 2 2 0 000 4z"
                    clip-rule="evenodd"></path>
                </svg>
              </div>
              <div>
                <p class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">
                  Guide Alloted
                </p>
                <p class="text-lg font-semibold text-gray-700 dark:text-gray-200">
                  <%= u.getGuide_alloted() %>
                </p>
              </div>
            </div>
            <!-- Card -->
            <div class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
              <div class="p-3 mr-4 text-blue-500 bg-blue-100 rounded-full dark:text-blue-100 dark:bg-blue-500">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path
                    d="M3 1a1 1 0 000 2h1.22l.305 1.222a.997.997 0 00.01.042l1.358 5.43-.893.892C3.74 11.846 4.632 14 6.414 14H15a1 1 0 000-2H6.414l1-1H14a1 1 0 00.894-.553l3-6A1 1 0 0017 3H6.28l-.31-1.243A1 1 0 005 1H3zM16 16.5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zM6.5 18a1.5 1.5 0 100-3 1.5 1.5 0 000 3z">
                  </path>
                </svg>
              </div>
              <div>
                <p class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">
                  Area Alloted
                </p>
                <p class="text-lg font-semibold text-gray-700 dark:text-gray-200">
                  Name of area
                </p>
              </div>
            </div>
            <!-- Card -->
            <div class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
              <div class="p-3 mr-4 text-teal-500 bg-teal-100 rounded-full dark:text-teal-100 dark:bg-teal-500">
                <svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                  <path fill-rule="evenodd"
                    d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z"
                    clip-rule="evenodd"></path>
                </svg>
              </div>
              <div>
                <p class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">
                  Project Name
                </p>
                <p class="text-lg font-semibold text-gray-700 dark:text-gray-200">
                  Name of Project
                </p>
              </div>
            </div>
          </div>

          <!-- New Table -->
          <div class="w-full overflow-hidden rounded-lg shadow-xs">
            <div class="w-full overflow-x-auto">
              <table class="w-full whitespace-no-wrap">
                <thead>
                  <tr
                    class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
                    <th class="px-4 py-3">Member</th>
                    <th class="px-4 py-3">Enrollment no.</th>

                  </tr>
                </thead>
                <tbody class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">
                  <tr class="text-gray-700 dark:text-gray-400">
                    <td class="px-4 py-3">
                      <div class="flex items-center text-sm">
                        <!-- Avatar with inset shadow -->
                        <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                          <img class="object-cover w-full h-full rounded-full"
                            src="data:image/png;base64,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"
                            alt="" loading="lazy" />
                          <div class="absolute inset-0 rounded-full shadow-inner" aria-hidden="true"></div>
                        </div>
                        <div>
                          <p class="font-semibold"><%= u.getLeaderName() %></p>
                          <p class="text-xs text-gray-600 dark:text-gray-400">
                            Leader
                          </p>
                        </div>
                      </div>
                    </td>
                    <td class="px-4 py-3 text-sm">
                      <%= u.getLeaderEnrollment() %>
                    </td>

                  </tr>
                  <tr class="text-gray-700 dark:text-gray-400">
                    <td class="px-4 py-3">
                      <div class="flex items-center text-sm">
                        <!-- Avatar with inset shadow -->
                        <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                          <img class="object-cover w-full h-full rounded-full"
                            src="data:image/png;base64,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"
                            alt="" loading="lazy" />
                          <div class="absolute inset-0 rounded-full shadow-inner" aria-hidden="true"></div>
                        </div>
                        <div>
                          <p class="font-semibold"><%= u.getMem_1_Name() %></p>
                          <p class="text-xs text-gray-600 dark:text-gray-400">
                            Member
                          </p>
                        </div>
                      </div>
                    </td>
                    <td class="px-4 py-3 text-sm">
                      <%= u.getMem_1_Enrollment() %>
                    </td>

                  </tr>
                  <tr class="text-gray-700 dark:text-gray-400">
                    <td class="px-4 py-3">
                      <div class="flex items-center text-sm">
                        <!-- Avatar with inset shadow -->
                        <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                          <img class="object-cover w-full h-full rounded-full"
                            src="data:image/png;base64,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"
                            alt="" loading="lazy" />
                          <div class="absolute inset-0 rounded-full shadow-inner" aria-hidden="true"></div>
                        </div>
                        <div>
                          <p class="font-semibold"><%= u.getMem_2_Name() %></p>
                          <p class="text-xs text-gray-600 dark:text-gray-400">
                            Member
                          </p>
                        </div>
                      </div>
                    </td>
                    <td class="px-4 py-3 text-sm">
                      <%= u.getMem_2_Enrollment() %>
                    </td>

                  </tr>
                  <tr class="text-gray-700 dark:text-gray-400">
                    <td class="px-4 py-3">
                      <div class="flex items-center text-sm">
                        <!-- Avatar with inset shadow -->
                        <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                          <img class="object-cover w-full h-full rounded-full"
                            src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAe1BMVEXu7u4AAAD8/Pzt7e3q6urn5+f////k5OTy8vL5+fn19fWnp6f6+vqxsbHZ2dnJycnR0dGfn5/AwMCSkpLe3t5MTEy5ublra2u3t7d0dHTExMRFRUWDg4OFhYU1NTWrq6s8PDwqKipUVFQiIiKOjo5wcHBiYmIZGRkRERHv4rI8AAAJtUlEQVR4nOXdB3uqOgAGYBCFDAmzDqTFjtPb//8LbwARrCwzMEm/544e7dG8T0JCwrJs+Tnt8wQf4oCQ1NtYGy8lJIgPOMn3pwW+3ZL54edjFBMLQoQQKGM1qf5EX4XQInF0PMsshCzhOfcJgqXMGk8phYj4uSymDOH5K3bgtO2XEzrxlwylcOHe31DdA7gOE8GNvxddILHCPEOMulaJslxomQQKjxlr5d1VZXYUVyxRwhcfCOE1SOC/CCqZGOErgeJ4FyQkr0LKJkD4jkVWX8eIAH7nLx638BQLr74OEsbcuz2cwpdAoq82BpwbJJdQuk+EkUP4li3gq43Z2zOE/kK+2ugvLvx6aLdTgBF8LSr88NCivjLI+1hOuFuwgbYBcLeQ8J/1DF9ltP4tIYzhk3xlYCxd+P20CqwDnG+5wmL7VF+ZbSFR+J4u34XeB6XvsoT7hcfAoQDwyFLHA8Lo+S20yTaSIQxUaKFNUCBc+Omp0UKbAO9TrPBFkU2wDQAz51TzhPtnjvJDgfP6m1nCXJ0+ppvtrIXVOcJExRosAxMxwkhVICXOGDWmhVhdICVifqHSwDnEKaHCTbTOZEOdECrbybSZ6m7Ghbn6QEocHzRGhXs1x8Hf2Y4O/WPCFx1qsAwc24EbEX6qtis6HDCyGz4iVGw2MRbgsQgDfYCUODxfHBQqPxDeZnhYHBJq0o22GexQB4Qa9TJNhnqbASHRUEgeEWKVVp3mBvXvhPcKv/XqZZrA3gX/XqHz7LIyxpkrjPXbCOuAviNTPUIlF9bmpW/5rUeoaxst09NO74UHXdtoGXCYFn7o20bLwLvTGe6Eqc5VSCsxnRJ+6TjWd4N+n3fzW6h3DZYB40LfAKE/JnzTu5upA99GhJn+VUgrMRsWarO4Np7bpbcbYWhCFdJKDIeEmg/2bW6G/a5Qq9W1sdysvHWEhmyFZeCpV6jttPA+3YliK3w3pwppJb73CAtzqpBWYtEjNAnY3Tu9Cl91n1TcBr3eCTVcAx5Luz7cCA0aKupcd90aoQHTpttcJ1GN0DRg29dchEez+pky6HgjNGJieJtmmngRmleFtBK7wtxIYd4RGthIr83UMraRNs20Eu4NFe6vQuOG+zr1oF8JN88ui6RsGqER68B9qdaGLfMmTm2qKVQpNGiB5jbVck0p1Pmw9nicWmjsZlhviJaoeYUjPAIKVc4vLO5FNvE0cc5yyc3iOx4jmceLLI/RWDzT+0V8XEZQCs/MHc1iQHYiPFMha0ezoI+dSLsay47YWmn369eywm0EERUy7tHI5/1CsgljKmRb7F7I1zUyCQkVsvzFDtCRukXSD+cjUt8PU1d6BYKV7IArkaWg8Mc6sQjbJioduFqteYjwZDGt0VyBCwnXzEK0t5imvxoJcyth6Epb4FJCZiJILMwj3GwWEG42PEJs7QwX7iyWXZprI11OuGYVxhbL7LCtwh6hS0JXsHDDIQwshp02Z1SIggxBAAAU5dzwNFNALPLwXxoXIlwURRphXDhwe33Vpan/615/bt64vl+/LVZIfalg4coNQ5JhKqT/oMtrwPcPIW2/vl+E7s73M+SGh+qX0yIouaQo4m39tmBhannChZu1j/0woFWJN5fyOskuTgI3SIIgdXERRNjNouqX/SiCK/pGHPqXtwULPWstXEgKvFulHroRem5REspmiGM3TFa1ECVpkrowicsGGkQSWinTUaepVorxOsA4pf+/qUNChVFEXOyn+FKHbhjRRuuuk7LqLm8LFjoS6pDKwA7jMO0K/WhHKylJU+DiKDqAi7CIAj9CICGVMKJvi69D8dshFYaWv4NxV+ilybptpbTfzMomCZLC9ykvOpQvSWmlnoy+lHajBIEAt9vh+iulfcoqSAocuLQ26W9l9OddkCCX9jwuSbAfufXbgoWp8PGQ9jS4SdRMPVBouSB0NmEYei6pNjqP/kxS2jrpT1t3HdJetH5bsJCI36dZwbAJadnVv82IX73iNgN8sy8gZcSn+zQMlyBMCJvC9xaXIXzCgGVuMSUUHD5hzDI/1Eq4Y5njayXE7Os0zxA+XlSQMK21NUIN5vgoZ1ov7TTTpYSswyHaM615aySEJ6bjFk7bTBc4btE2UhbhD9uxp04lruvtUUoun82z5m0xHj/sVCKNJy+Nk1VYHT9kXjBtiZKQbUU6zMKY9Th+hyiriXYaKjOwPo7PdC6G0yXKM3If5q7OxWA7n+aWKDUcwPp8GrZzohxnIWP7RSzFBBzntTnOEkiHExjynJvo3EUSjR3YnJuoxWlfbEW8nF/Kfo6w4r7rOcIc53mr7bue5813rr7CvvZcfRHXWyhmq3O93sLYk/Wv18yYf93TH7h2zfzrD82/hvQPXAds/rXctonjBfxj91Qw/74Y5t/bxLxB/+7+NObfY8j8+0SZdsl6z72+DOtreu7XZrOctK9sAO4Rmn/fRJNurdB/70ub6RovNTNw/1Lz70Frzqh/czPom3tBG1KJtw/wMvJ+3qdBoRnTxLF7spuxNjx6X30TJlHjz0YwYe904vkWf+AZJTo9ubIv90+z/IPPCjL/eU9639xs1jO7/sBz12yWC9iVCNj1aIx6/uG6D/NHn2Fp/nNItVwffuxZsn/gecD2t3bPdO7dCEeE5j+XW7NFG5Znq2s1y7ifUcwSatTbDPUyE0L7RZdR8XZx7QGhvdejQx3sRqeFdq5DhwrzUcO40E7UJ8JknDAhVH9YHB4IZwptrDYR9u9uPyJUmzgNnCFUuaFONtF5QnW7m6lOZrbQztUcF7fjw8QjQjWX3/oW1piF9gtQbScVgJfpYj8gtD8Vm2kAb2Rnm0lI54sqtVQ4PB9kF9qROv3NdsYowSC094psjADM62MeF9qfRIUZIyJzN8HHhUrsws3YUeMR2t/Oc1sqcEanuwKEth0/sxphPF1AbqH9z3pWNQLr3+PFZRDa9g4+wwhg3+FBOUL7w1u+U0Xe3UkIEoV0RrXw2AjAnJmSSKH94y/YVAH0f1gLyiy07bdsISOA2dt0cSQI6ZwqXMAIYDhzniRBSLucQLIRwICtgxElpPUYSzQCGHPVnxChbb8XAMlA0k8t3vmLJ0BI80qEVySA5HX6i2dEjJA2Vl9kRdLP8rmb5yWihDTHDAlBAoSyo7hiCRTS5NzIkjdrGXR2xApp9r4HGZUAQc9/ZIFiVoQLad5e4zVVPsIEVLeOXzl2XQYjQ1jm7egTVDKnnKDEIVIcZejKyBJWOR+jmAAIESqpHWz1J/oqhIDE0fEssxBShXX+O+3zBB/igJDU21gbLyUkiA84yfen/+R//f9OJ8dEfbyPQQAAAABJRU5ErkJggg=="
                            alt="" loading="lazy" />
                          <div class="absolute inset-0 rounded-full shadow-inner" aria-hidden="true"></div>
                        </div>
                        <div>
                          <p class="font-semibold"><%= u.getMem_3_Name() %></p>
                          <p class="text-xs text-gray-600 dark:text-gray-400">
                            Member
                          </p>
                        </div>
                      </div>
                    </td>
                    <td class="px-4 py-3 text-sm">
                      <%= u.getMem_3_Enrollment() %>
                    </td>

                  </tr>
                  <tr class="text-gray-700 dark:text-gray-400">
                    <td class="px-4 py-3">
                      <div class="flex items-center text-sm">
                        <!-- Avatar with inset shadow -->
                        <div class="relative hidden w-8 h-8 mr-3 rounded-full md:block">
                          <img class="object-cover w-full h-full rounded-full"
                            src="data:image/png;base64,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"
                            alt="" loading="lazy" />
                          <div class="absolute inset-0 rounded-full shadow-inner" aria-hidden="true"></div>
                        </div>
                        <div>
                          <p class="font-semibold"><%= u.getMem_4_Name() %></p>
                          <p class="text-xs text-gray-600 dark:text-gray-400">
                            Member
                          </p>
                        </div>
                      </div>
                    </td>
                    <td class="px-4 py-3 text-sm">
                      <%= u.getMem_4_Enrollment() %>
                    </td>

                  </tr>


                </tbody>
              </table>
            </div>
          </div>
        </div>
      </main>
    </div>
  </div>

</body>

</html>