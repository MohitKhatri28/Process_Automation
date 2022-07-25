package com.project_process_automation.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginAdminDao {
	public LoginAdmin getTeacher(String username,String password) throws ClassNotFoundException, SQLException {
        LoginAdmin login_admin = null;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/project_process_automation?useSSl=false","root","Messidona#3");
		Statement st = con.createStatement();
	
		ResultSet rs = st.executeQuery("SELECT * FROM login WHERE username = '" + username +"' and pswd = '"+ password +"' and who_id = 3;");
		int login_id=0;
		
		if (rs.next()) {
			login_admin = new LoginAdmin();
			
			login_id = rs.getInt("login_id");
			
			rs = st.executeQuery("SELECT * FROM teacher WHERE login_id = " + login_id +";");
			if(rs.next()) {
				login_admin.setTeacher_id(rs.getInt("teacher_id"));
				login_admin.setTeacher_name(rs.getString("full_name"));
			}
			
			rs = st.executeQuery("SELECT * FROM student_group ORDER BY avg_cgpa desc;");
			if(rs.next()) {
				login_admin.setIf_guide_alloted(rs.getInt("guide_alloted"));
			}
		}
		return login_admin;
	}
}

