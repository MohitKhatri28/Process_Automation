package com.project_process_automation.addremoveteacher;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddTeacherServlet
 */
@WebServlet("/addTeacher")
public class AddTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public AddTeacherServlet() {
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
		
		String full_name = "";
		String username = "";
		String password = "";
		int permanent_id = 0;
		
		full_name = request.getParameter("full_name");
		permanent_id = Integer.parseInt(request.getParameter("permanent_id"));
		username = request.getParameter("username");
		password = request.getParameter("password");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/project_process_automation?useSSl=false","root","Messidona#3");
			Statement st = con.createStatement();
			ResultSet rs = null;
			
			st.executeUpdate("INSERT INTO login (username, pswd, who_id) VALUES ('" + username + "', '" + password + "', 2);",Statement.RETURN_GENERATED_KEYS);
			rs = st.getGeneratedKeys();
			
			//Storing last inserted login_id
			int log_id=0;
			if(rs.next()) {
				log_id = rs.getInt(1);
			}
			
			rs = st.executeQuery("SELECT MAX(pref_id) AS maxPref FROM teacher WHERE active_id = 1 and permanent_id = "+ permanent_id + ";");
			int pref=0;
			if(rs.next()) {
				pref = rs.getInt("maxPref");
			}
			
			st.executeUpdate("INSERT INTO teacher (full_name, login_id, pref_id, permanent_id, active_id) VALUES ('"+ full_name + "', "+ log_id +", "+ (pref+1) + ", "+ permanent_id +", 1);");
			
			
			response.sendRedirect("admin.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
