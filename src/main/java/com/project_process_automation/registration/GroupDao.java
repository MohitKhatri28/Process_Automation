package com.project_process_automation.registration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GroupDao {
	
	//Connecting with Database
	public void registerGroup(Group group) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/project_process_automation?useSSl=false","root","Messidona#3");
		Statement st = con.createStatement();
		
		//Insert into login
		st.executeUpdate("INSERT INTO login (username, pswd, who_id) VALUES ('" + group.getUsername() +"', '"+ group.getPassword() +"', 1);",Statement.RETURN_GENERATED_KEYS);
		ResultSet rs = st.getGeneratedKeys();
		//Storing last inserted login_id
		int log_id=0;
		if(rs.next()) {
			log_id = rs.getInt(1);
		}
		rs = st.executeQuery("SELECT COUNT(group_id) AS count FROM student_group;");
		int count = rs.getInt("count");
		//Insert into student_group
		st.executeUpdate("INSERT INTO student_group (login_id, area_pref_1, area_pref_2, area_pref_3, guide_pref_1, guide_pref_2, guide_pref_3, avg_cgpa, group_num) VALUES ("+ log_id + ","+group.getArea_pref_1() +", "+ group.getArea_pref_2()+", "+ group.getArea_pref_3()+", "+ group.getGuide_pref_1()+", "+ group.getGuide_pref_2()+", "+ group.getGuide_pref_3()+", "+ group.getAvg_cgpa()+", "+ (count+1) +");",Statement.RETURN_GENERATED_KEYS);
		rs = st.getGeneratedKeys();
		//Storing last inserted group_id
		int grp_id =0;
		if(rs.next()) {
			grp_id = rs.getInt(1);
		}
		
		
		
		//Insert into student
		st.executeUpdate("INSERT INTO student (full_name, enroll_num, role_id, group_id) VALUES ('" + group.getLeaderName() +"', '"+ group.getLeaderEnrollment() +"',"+"1, "+ grp_id + ");");
		st.executeUpdate("INSERT INTO student (full_name, enroll_num, role_id, group_id) VALUES ('" + group.getMem_1_Name() +"', '"+ group.getMem_1_Enrollment() +"',"+"2, "+ grp_id + ");");
		st.executeUpdate("INSERT INTO student (full_name, enroll_num, role_id, group_id) VALUES ('" + group.getMem_2_Name() +"', '"+ group.getMem_2_Enrollment() +"',"+"2, "+ grp_id + ");");
		st.executeUpdate("INSERT INTO student (full_name, enroll_num, role_id, group_id) VALUES ('" + group.getMem_3_Name() +"', '"+ group.getMem_3_Enrollment() +"',"+"2, "+ grp_id + ");");
		st.executeUpdate("INSERT INTO student (full_name, enroll_num, role_id, group_id) VALUES ('" + group.getMem_4_Name() +"', '"+ group.getMem_4_Enrollment() +"',"+"2, "+ grp_id + ");");
		
		st.close();
		con.close();
		return;
	}
}
