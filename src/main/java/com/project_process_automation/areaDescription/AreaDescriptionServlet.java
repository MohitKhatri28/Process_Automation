package com.project_process_automation.areaDescription;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project_process_automation.login.Login;
import com.project_process_automation.login.LoginDao;

/**
 * Servlet implementation class AreaDescriptionServlet
 */
@WebServlet("/area_desc")
public class AreaDescriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private AreaDescriptionDao areaDescDao = new AreaDescriptionDao();
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public AreaDescriptionServlet() {
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
		String area_desc_1 = request.getParameter("area_desc_1");
		String area_desc_2 = request.getParameter("area_desc_2");
		String area_desc_3 = request.getParameter("area_desc_3");
		
		HttpSession session = request.getSession();
		Login u=(Login)session.getAttribute("user");	
		if(u==null){
			response.sendRedirect("index.jsp");
		}
		int grp_id = u.getGroup_id();
		
		try {
			areaDescDao.InsertAreaDescription(grp_id,area_desc_1,area_desc_2,area_desc_3);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("index.jsp");
	}

}
