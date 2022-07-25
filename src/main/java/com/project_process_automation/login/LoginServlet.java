package com.project_process_automation.login;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private LoginDao loginDao = new LoginDao();
	private LoginTeacherDao login_teacher_dao = new LoginTeacherDao();
	private LoginAdminDao login_admin_dao = new LoginAdminDao();
//	private LoginDao loginDao = new LoginDao();
       
//    
//    public LoginServlet() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int who = Integer.parseInt(request.getParameter("who"));
		
		if(who==1) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
					
			try {
				Login user = loginDao.getUser(username, password);
				
				if(user == null) {
					response.sendRedirect("index.jsp");
				}
				else {
					HttpSession session = request.getSession();
					session.setAttribute("user", user);				
					response.sendRedirect("profile.jsp");
				}
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(who==2) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
					
			try {
				LoginTeacher teacher = login_teacher_dao.getTeacher(username, password);
				
				if(teacher == null) {
					response.sendRedirect("index.jsp");
				}
				else {
					HttpSession session = request.getSession();
					session.setAttribute("teacher", teacher);				
					response.sendRedirect("group1.jsp");
				}
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if (who==3) {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
					
			try {
				LoginAdmin admin = login_admin_dao.getTeacher(username, password);
				
				if(admin == null) {
					response.sendRedirect("index.jsp");
				}
				else {
					HttpSession session = request.getSession();
					session.setAttribute("admin", admin);				
					response.sendRedirect("admin.jsp");
				}
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
}
