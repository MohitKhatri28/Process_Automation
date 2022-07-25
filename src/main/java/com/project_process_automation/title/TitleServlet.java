package com.project_process_automation.title;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_process_automation.login.LoginTeacher;

/**
 * Servlet implementation class TitleServlet
 */
@WebServlet("/title")
public class TitleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public TitleServlet() {
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
		HttpSession session = request.getSession();
		LoginTeacher u=(LoginTeacher)session.getAttribute("teacher");	
		if(u==null){
			response.sendRedirect("index.jsp");
		}
		String group_title = "";
		group_title=request.getParameter("group_title");
		
		int grp_id = u.getGroup_1();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/project_process_automation?useSSl=false","root","Messidona#3");
			Statement st = con.createStatement();
			
			st.executeUpdate("UPDATE student_group SET project_title = '"+ group_title +"' where group_id = "+grp_id+";");
			
			response.sendRedirect("group1.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
