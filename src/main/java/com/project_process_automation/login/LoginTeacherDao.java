package com.project_process_automation.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginTeacherDao {
	public LoginTeacher getTeacher(String username,String password) throws ClassNotFoundException, SQLException {
        LoginTeacher login_teacher = null;
        
        Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/project_process_automation?useSSl=false","root","Messidona#3");
		Statement st = con.createStatement();

		ResultSet rs = st.executeQuery("SELECT * FROM login WHERE username = '" + username +"' and pswd = '"+ password +"' and (who_id = 2 or who_id = 3);");
		int login_id=0;
		
		if (rs.next()) {
			login_teacher = new LoginTeacher();
			
			login_id = rs.getInt("login_id");
			
			rs = st.executeQuery("SELECT * FROM teacher WHERE login_id = " + login_id +" and active_id = 1;");
			if(rs.next()) {
				login_teacher.setTeacher_id(rs.getInt("teacher_id"));
				login_teacher.setTeacher_name(rs.getString("full_name"));
				
				login_teacher.setGroup_1(rs.getInt("group_id_1"));
				login_teacher.setGroup_2(rs.getInt("group_id_2"));
				login_teacher.setGroup_3(rs.getInt("group_id_3"));
				
				//Group 1
				rs = st.executeQuery("SELECT * FROM student_group WHERE group_id = " + login_teacher.getGroup_1() +";");
				if(rs.next()) {
					login_teacher.setGroup_num_1(rs.getInt("group_num"));
					//Setting areas selected
					int a1 = rs.getInt("area_pref_1");
					int a2 = rs.getInt("area_pref_2");
					int a3 = rs.getInt("area_pref_3");
					
					rs = st.executeQuery("SELECT * FROM areas WHERE area_id = " + a1 +";");
					if(rs.next()) {
						login_teacher.setGroup_1_area_1(rs.getString("area"));
					}
					rs = st.executeQuery("SELECT * FROM areas WHERE area_id = " + a2 +";");
					if(rs.next()) {
						login_teacher.setGroup_1_area_2(rs.getString("area"));
					}
					rs = st.executeQuery("SELECT * FROM areas WHERE area_id = " + a3 +";");
					if(rs.next()) {
						login_teacher.setGroup_1_area_3(rs.getString("area"));
					}
					
					//Getting member names
					rs = st.executeQuery("SELECT * FROM student WHERE group_id = " + login_teacher.getGroup_1() +" and role_id = 1;");
					if(rs.next()) {
						login_teacher.setGroup_1_leaderName(rs.getString("full_name"));
						login_teacher.setGroup_1_leaderEnrollment(rs.getString("enroll_num"));
						
						rs = st.executeQuery("SELECT * FROM student WHERE group_id = " + login_teacher.getGroup_1() +" and role_id = 2;");
						if(rs.next()) {
							login_teacher.setGroup_1_mem_1_Name(rs.getString("full_name"));
							login_teacher.setGroup_1_mem_1_Enrollment(rs.getString("enroll_num"));
							rs.next();
							login_teacher.setGroup_1_mem_2_Name(rs.getString("full_name"));
							login_teacher.setGroup_1_mem_2_Enrollment(rs.getString("enroll_num"));
							rs.next();
							login_teacher.setGroup_1_mem_3_Name(rs.getString("full_name"));
							login_teacher.setGroup_1_mem_3_Enrollment(rs.getString("enroll_num"));
							rs.next();
							login_teacher.setGroup_1_mem_4_Name(rs.getString("full_name"));
							login_teacher.setGroup_1_mem_4_Enrollment(rs.getString("enroll_num"));
							
						}
						
					}
					
					//Setting description of areas
					rs = st.executeQuery("SELECT * FROM area_description WHERE group_id = " + login_teacher.getGroup_1() +";");
					if(rs.next()) {
						login_teacher.setGroup_1_desc_1(rs.getString("area_1_desc"));
						login_teacher.setGroup_1_desc_2(rs.getString("area_2_desc"));
						login_teacher.setGroup_1_desc_3(rs.getString("area_3_desc"));
					}
				}
				
				//Group 2
				rs = st.executeQuery("SELECT * FROM student_group WHERE group_id = " + login_teacher.getGroup_2() +";");
				if(rs.next()) {
					login_teacher.setGroup_num_2(rs.getInt("group_num"));
					//Setting areas selected
					int a1 = rs.getInt("area_pref_1");
					int a2 = rs.getInt("area_pref_2");
					int a3 = rs.getInt("area_pref_3");
					
					rs = st.executeQuery("SELECT * FROM areas WHERE area_id = " + a1 +";");
					if(rs.next()) {
						login_teacher.setGroup_2_area_1(rs.getString("area"));
					}
					rs = st.executeQuery("SELECT * FROM areas WHERE area_id = " + a2 +";");
					if(rs.next()) {
						login_teacher.setGroup_2_area_2(rs.getString("area"));
					}
					rs = st.executeQuery("SELECT * FROM areas WHERE area_id = " + a3 +";");
					if(rs.next()) {
						login_teacher.setGroup_2_area_3(rs.getString("area"));
					}
					//Getting member names
					rs = st.executeQuery("SELECT * FROM student WHERE group_id = " + login_teacher.getGroup_2() +" and role_id = 1;");
					if(rs.next()) {
						login_teacher.setGroup_2_leaderName(rs.getString("full_name"));
						login_teacher.setGroup_2_leaderEnrollment(rs.getString("enroll_num"));
						
						rs = st.executeQuery("SELECT * FROM student WHERE group_id = " + login_teacher.getGroup_2() +" and role_id = 2;");
						if(rs.next()) {
							login_teacher.setGroup_2_mem_1_Name(rs.getString("full_name"));
							login_teacher.setGroup_2_mem_1_Enrollment(rs.getString("enroll_num"));
							rs.next();
							login_teacher.setGroup_2_mem_2_Name(rs.getString("full_name"));
							login_teacher.setGroup_2_mem_2_Enrollment(rs.getString("enroll_num"));
							rs.next();
							login_teacher.setGroup_2_mem_3_Name(rs.getString("full_name"));
							login_teacher.setGroup_2_mem_3_Enrollment(rs.getString("enroll_num"));
							rs.next();
							login_teacher.setGroup_2_mem_4_Name(rs.getString("full_name"));
							login_teacher.setGroup_2_mem_4_Enrollment(rs.getString("enroll_num"));
							
						}
						
					}
					//Setting description of areas
					rs = st.executeQuery("SELECT * FROM area_description WHERE group_id = " + login_teacher.getGroup_2() +";");
					if(rs.next()) {
						login_teacher.setGroup_2_desc_1(rs.getString("area_1_desc"));
						login_teacher.setGroup_2_desc_2(rs.getString("area_2_desc"));
						login_teacher.setGroup_2_desc_3(rs.getString("area_3_desc"));
					}
				}
				
				//Group 3
				rs = st.executeQuery("SELECT * FROM student_group WHERE group_id = " + login_teacher.getGroup_3() +";");
				if(rs.next()) {
					login_teacher.setGroup_num_3(rs.getInt("group_num"));
					//Setting areas selected
					int a1 = rs.getInt("area_pref_1");
					int a2 = rs.getInt("area_pref_2");
					int a3 = rs.getInt("area_pref_3");
					
					rs = st.executeQuery("SELECT * FROM areas WHERE area_id = " + a1 +";");
					if(rs.next()) {
						login_teacher.setGroup_3_area_1(rs.getString("area"));
					}
					rs = st.executeQuery("SELECT * FROM areas WHERE area_id = " + a2 +";");
					if(rs.next()) {
						login_teacher.setGroup_3_area_2(rs.getString("area"));
					}
					rs = st.executeQuery("SELECT * FROM areas WHERE area_id = " + a3 +";");
					if(rs.next()) {
						login_teacher.setGroup_3_area_3(rs.getString("area"));
					}
					//Getting member names
					rs = st.executeQuery("SELECT * FROM student WHERE group_id = " + login_teacher.getGroup_3() +" and role_id = 1;");
					if(rs.next()) {
						login_teacher.setGroup_3_leaderName(rs.getString("full_name"));
						login_teacher.setGroup_3_leaderEnrollment(rs.getString("enroll_num"));
						
						rs = st.executeQuery("SELECT * FROM student WHERE group_id = " + login_teacher.getGroup_3() +" and role_id = 2;");
						if(rs.next()) {
							login_teacher.setGroup_3_mem_1_Name(rs.getString("full_name"));
							login_teacher.setGroup_3_mem_1_Enrollment(rs.getString("enroll_num"));
							rs.next();
							login_teacher.setGroup_3_mem_2_Name(rs.getString("full_name"));
							login_teacher.setGroup_3_mem_2_Enrollment(rs.getString("enroll_num"));
							rs.next();
							login_teacher.setGroup_3_mem_3_Name(rs.getString("full_name"));
							login_teacher.setGroup_3_mem_3_Enrollment(rs.getString("enroll_num"));
							rs.next();
							login_teacher.setGroup_3_mem_4_Name(rs.getString("full_name"));
							login_teacher.setGroup_3_mem_4_Enrollment(rs.getString("enroll_num"));
							
						}
						
					}
					//Setting description of areas
					rs = st.executeQuery("SELECT * FROM area_description WHERE group_id = " + login_teacher.getGroup_3() +";");
					if(rs.next()) {
						login_teacher.setGroup_3_desc_1(rs.getString("area_1_desc"));
						login_teacher.setGroup_3_desc_2(rs.getString("area_2_desc"));
						login_teacher.setGroup_3_desc_3(rs.getString("area_3_desc"));
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
        return login_teacher;
	}
}
