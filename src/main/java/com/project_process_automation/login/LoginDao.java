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

		ResultSet rs = st.executeQuery("SELECT * FROM login WHERE username = '" + username +"' and pswd = '"+ password +"';");
		
		
		if (rs.next()) {
			login = new Login();
			
			login.setLogin_id(rs.getInt("login_id"));
			login.setUsername(username);
			login.setPassword(password);
			
			rs = st.executeQuery("SELECT * FROM student_group WHERE login_id = " + login.getLogin_id() +";");
			if(rs.next()) {
				login.setGroup_id(rs.getInt("group_id"));
				login.setArea_pref_1(rs.getInt("area_pref_1"));
				login.setArea_pref_1(rs.getInt("area_pref_2"));
				login.setArea_pref_1(rs.getInt("area_pref_3"));
				
				rs = st.executeQuery("SELECT * FROM student WHERE group_id = " + login.getGroup_id() +" and role_id = 1;");
				login.setLeaderName(rs.getString("full_name"));
				login.setLeaderEnrollment(rs.getString("enroll_num"));
				
				rs = st.executeQuery("SELECT * FROM student WHERE group_id = " + login.getGroup_id() +" and role_id = 2;");
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
			}
			
		}
		else {
           return null;
		}

        return login;
	}
}	

