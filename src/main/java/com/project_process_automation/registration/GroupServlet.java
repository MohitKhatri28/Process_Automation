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
		float avg_cgpa = Float.parseFloat(request.getParameter("avg_cgpa"));
		int dis = Integer.parseInt(request.getParameter("dis"));
		int year = Integer.parseInt(request.getParameter("year"));
		
		String leader_phone_num = request.getParameter("leader_phone_num");
		String leader_email_id = request.getParameter("leader_email_id");
		String mem_1_phone_num=request.getParameter("mem_1_phone_num");
		String mem_1_email_id=request.getParameter("mem_1_email_id");
		String mem_2_phone_num=request.getParameter("mem_2_phone_num");
		String mem_2_email_id=request.getParameter("mem_2_email_id");
		String mem_3_phone_num=request.getParameter("mem_3_phone_num");
		String mem_3_email_id=request.getParameter("mem_3_email_id");
		String mem_4_phone_num=request.getParameter("mem_4_phone_num");
		String mem_4_email_id=request.getParameter("mem_4_email_id");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Group group = new Group();
		group.setDis(dis);
		group.setArea_pref_1(area_pref_1);
		group.setArea_pref_2(area_pref_2);
		group.setArea_pref_3(area_pref_3);
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
		group.setLeader_phone_num(leader_phone_num);
		group.setLeader_email_id(leader_email_id);
		group.setMem_1_phone_num(mem_1_phone_num);
		group.setMem_1_email_id(mem_1_email_id);
		group.setMem_2_phone_num(mem_2_phone_num);
		group.setMem_2_email_id(mem_2_email_id);
		group.setMem_3_phone_num(mem_3_phone_num);
		group.setMem_3_email_id(mem_3_email_id);
		group.setMem_4_phone_num(mem_4_phone_num);
		group.setMem_4_email_id(mem_4_email_id);
		group.setYear(year);
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