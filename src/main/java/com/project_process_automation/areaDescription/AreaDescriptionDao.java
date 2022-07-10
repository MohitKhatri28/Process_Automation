package com.project_process_automation.areaDescription;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class AreaDescriptionDao {
	public void InsertAreaDescription(int grp_id, String area_1,String area_2,String area_3) throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/project_process_automation?useSSl=false","root","Messidona#3");
		Statement st = con.createStatement();
		
		st.executeUpdate("INSERT INTO area_description (group_id, area_1_desc, area_2_desc, area_3_desc) VALUES (" + grp_id +", '"+ area_1 +"', '"+ area_2 +"', '"+ area_3 +"');");
		
	}
}
