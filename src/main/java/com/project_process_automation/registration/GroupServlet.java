package com.project_process_automation.registration;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/register")
public class GroupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private GroupDao groupDao = new GroupDao();
	
	
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public GroupServlet() {
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
		String leaderName = request.getParameter("leaderName");
		String leaderEnrollment = request.getParameter("leaderEnrollment");
		String mem_1_Name = request.getParameter("mem_1_Name");
		String mem_1_Enrollment = request.getParameter("mem_1_Enrollment");
		String mem_2_Name = request.getParameter("mem_2_Name");
		String mem_2_Enrollment = request.getParameter("mem_2_Enrollment");
		String mem_3_Name = request.getParameter("mem_3_Name");
		String mem_3_Enrollment = request.getParameter("mem_3_Enrollment");
		String mem_4_Name = request.getParameter("mem_4_Name");
		String mem_4_Enrollment = request.getParameter("mem_4_Enrollment");
		int area_pref_1 = Integer.parseInt(request.getParameter("area_pref_1"));
		int area_pref_2 = Integer.parseInt(request.getParameter("area_pref_2"));
		int area_pref_3 = Integer.parseInt(request.getParameter("area_pref_3"));
		int guide_pref_1 = Integer.parseInt(request.getParameter("guide_pref_1"));
		int guide_pref_2 = Integer.parseInt(request.getParameter("guide_pref_2"));
		int guide_pref_3 = Integer.parseInt(request.getParameter("guide_pref_3"));
		float avg_cgpa = Float.parseFloat(request.getParameter("avg_cgpa"));
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Group group = new Group();
		group.setArea_pref_1(area_pref_1);
		group.setArea_pref_2(area_pref_2);
		group.setArea_pref_3(area_pref_3);
		group.setGuide_pref_1(guide_pref_1);
		group.setGuide_pref_2(guide_pref_2);
		group.setGuide_pref_3(guide_pref_3);
		group.setAvg_cgpa(avg_cgpa);
		group.setLeaderEnrollment(leaderEnrollment);
		group.setLeaderName(leaderName);
		group.setMem_1_Enrollment(mem_1_Enrollment);
		group.setMem_1_Name(mem_1_Name);
		group.setMem_2_Enrollment(mem_2_Enrollment);
		group.setMem_2_Name(mem_2_Name);
		group.setMem_3_Enrollment(mem_3_Enrollment);
		group.setMem_3_Name(mem_3_Name);
		group.setMem_4_Enrollment(mem_4_Enrollment);
		group.setMem_4_Name(mem_4_Name);
		group.setPassword(password);
		group.setUsername(username);
		
		try {
			groupDao.registerGroup(group);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
		
	}

}
