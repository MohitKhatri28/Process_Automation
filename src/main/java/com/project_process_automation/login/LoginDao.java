package com.project_process_automation.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginDao {
	public Login getUser(String username,String password) throws ClassNotFoundException, SQLException {
        Login login = null;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/project_process_automation?useSSl=false","root","Messidona#3");
		Statement st = con.createStatement();

		ResultSet rs = st.executeQuery("SELECT * FROM login WHERE username = '" + username +"' and pswd = '"+ password +"' and who_id = 1;");
		int login_id=0;
		
		if (rs.next()) {
			login = new Login();
			
			login_id = rs.getInt("login_id");
			login.setUsername(username);
			
			//Getting group information
			rs = st.executeQuery("SELECT * FROM student_group WHERE login_id = " + login_id +";");
			if(rs.next()) {
				login.setGroup_id(rs.getInt("group_id"));
				login.setGroup_num(rs.getInt("group_num"));
				login.setArea_pref_1(rs.getInt("area_pref_1"));
				login.setArea_pref_1(rs.getInt("area_pref_2"));
				login.setArea_pref_1(rs.getInt("area_pref_3"));
				login.setProject_title(rs.getString("project_title"));
				//Getting guide alloted
				int t_id=0;
				int co_id=0;
				t_id = rs.getInt("guide_alloted");
				co_id = rs.getInt("guide_alloted_2");
				rs = st.executeQuery("SELECT * FROM teacher WHERE teacher_id = " + t_id +";");
				if(rs.next()) {
					login.setGuide_alloted(rs.getString("full_name"));
				}
				rs = st.executeQuery("SELECT * FROM teacher WHERE teacher_id = " + co_id +";");
				if(rs.next()) {
					login.setCo_guide(rs.getString("full_name"));
				}
				//Getting student information
				rs = st.executeQuery("SELECT * FROM student WHERE group_id = " + login.getGroup_id() +" and role_id = 1;");
				if(rs.next()) {
					login.setLeaderName(rs.getString("full_name"));
					login.setLeaderEnrollment(rs.getString("enroll_num"));
					
					rs = st.executeQuery("SELECT * FROM student WHERE group_id = " + login.getGroup_id() +" and role_id = 2;");
					if(rs.next()) {
						login.setMem_1_Name(rs.getString("full_name"));
						login.setMem_1_Enrollment(rs.getString("enroll_num"));
						rs.next();
						login.setMem_2_Name(rs.getString("full_name"));
						login.setMem_2_Enrollment(rs.getString("enroll_num"));
						rs.next();
						login.setMem_3_Name(rs.getString("full_name"));
						login.setMem_3_Enrollment(rs.getString("enroll_num"));
						rs.next();
						login.setMem_4_Name(rs.getString("full_name"));
						login.setMem_4_Enrollment(rs.getString("enroll_num"));
						
						//Getting area description
						rs = st.executeQuery("SELECT * FROM area_description WHERE group_id = " + login.getGroup_id() +";");
						if(rs.next()) {
							login.setArea_1_desc(rs.getString("area_1_desc"));
							login.setArea_2_desc(rs.getString("area_2_desc"));
							login.setArea_3_desc(rs.getString("area_3_desc"));
						}
						
					}
					
				}
								
			}
			
		}
		else {
           return null;
		}
		rs.close();
		st.close();
		con.close();
        return login;
	}
}	

