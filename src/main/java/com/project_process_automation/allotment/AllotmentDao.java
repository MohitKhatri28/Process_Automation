package com.project_process_automation.allotment;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

public class AllotmentDao {
	public void allot() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/project_process_automation?useSSl=false","root","Messidona#3");
		Statement st = con.createStatement();
		Statement st2 = con.createStatement();
		Statement st3 = con.createStatement();
		Statement st4 = con.createStatement();
		Statement st5 = con.createStatement();
		
		//nulling group alloted of teacher
		st.executeUpdate("UPDATE teacher SET group_id_1 = null WHERE group_id_1 is not null;");
		st.executeUpdate("UPDATE teacher SET group_id_2 = null WHERE group_id_2 is not null;");
		st.executeUpdate("UPDATE teacher SET group_id_3 = null WHERE group_id_3 is not null;");
		
		ResultSet rs = null;
		ResultSet rs2 = null;
		ResultSet rs3 = null;
		ResultSet rs4 = null;
		
		//getting current session
		int year = 0;
		
		rs = st.executeQuery("SELECT MAX(year) AS currentYear FROM student_group;");
		if(rs.next()) {
			year = rs.getInt("currentYear");
		}
		
		//giving space in map for allocation
		rs = st.executeQuery("SELECT teacher_id FROM teacher WHERE active_id = 1;");
		
		//map for guides
		HashMap<Integer, Integer> map = new HashMap<>();
		while(rs.next()) {
			int teacher_id = rs.getInt("teacher_id");
			map.put(teacher_id, 2);
		}
		int t_id=0;
		//map for co-guides
		rs = st.executeQuery("SELECT * FROM teacher WHERE pref_id < 100 and active_id = 1 ORDER BY pref_id;");
		HashMap<Integer, Integer> map_coguide = new HashMap<>();
		while(rs.next()) {
			int teacher_id = rs.getInt("teacher_id");
			map_coguide.put(teacher_id, 1);
		}
		
		//allotment for DIS
		rs = st.executeQuery("SELECT * FROM student_group where dis = 1 and year = "+year+" ORDER BY avg_cgpa DESC;");
		if(rs.next()) {
			int group_id = rs.getInt(1);
			st2.executeUpdate("UPDATE teacher SET group_id_1 = " + group_id +" WHERE teacher_id = "+ 10 +";");
			st2.executeUpdate("UPDATE student_group SET guide_alloted = " + 10 +" WHERE group_id = "+ group_id +";");
			map.put(10, 1);
			st3.executeUpdate("UPDATE teacher SET group_id_3 = " + group_id +" WHERE teacher_id = "+ 5 +";");
	    	st3.executeUpdate("UPDATE student_group SET guide_alloted_2 = " + 5 +" WHERE group_id = "+ group_id +";");
	    	map_coguide.put(5, 0);
	    	
	    	if(rs.next()) {
	    		int group_id_2 = rs.getInt(1);
				st2.executeUpdate("UPDATE teacher SET group_id_1 = " + group_id_2 +" WHERE teacher_id = "+ 7 +";");
				st2.executeUpdate("UPDATE student_group SET guide_alloted = " + 7 +" WHERE group_id = "+ group_id_2 +";");
				map.put(7, 1);
				st3.executeUpdate("UPDATE teacher SET group_id_3 = " + group_id_2 +" WHERE teacher_id = "+ 19 +";");
		    	st3.executeUpdate("UPDATE student_group SET guide_alloted_2 = " + 19 +" WHERE group_id = "+ group_id_2 +";");
		    	map_coguide.put(19, 0);
	    	}
		}
		
		//guide allotment for remaining groups
		rs = st.executeQuery("SELECT * FROM student_group where dis = 0 and year = "+ year + " ORDER BY avg_cgpa DESC;");
		while(rs.next()) {
			int group_id = rs.getInt(1);
			int area_pref_1 = rs.getInt("area_pref_1");
			int area_pref_2 = rs.getInt("area_pref_2");
			int area_pref_3 = rs.getInt("area_pref_3");
			
			rs2 = st2.executeQuery("SELECT teacher_spec.teacher_id, teacher_spec.spec_id, teacher.active_id, teacher.teacher_id, teacher.pref_id FROM teacher_spec  JOIN teacher ON teacher_spec.teacher_id = teacher.teacher_id WHERE spec_id = "+ (100 + area_pref_1)+" AND teacher.active_id = 1 ORDER BY pref_id;");
			boolean status=false;
			while(rs2.next()) {
				t_id =rs2.getInt(1);
				if(map.get(t_id)==2) {
					st2.executeUpdate("UPDATE teacher SET group_id_1 = " + group_id +" WHERE teacher_id = "+ t_id +";");
					st2.executeUpdate("UPDATE student_group SET guide_alloted = " + t_id +" WHERE group_id = "+ group_id +";");
					map.put(t_id, 1);
					status=true;
					break;
				}
				else if(map.get(t_id)==1) {
					st2.executeUpdate("UPDATE teacher SET group_id_2 = " + group_id +" WHERE teacher_id = "+ t_id +";");
					st2.executeUpdate("UPDATE student_group SET guide_alloted = " + t_id +" WHERE group_id = "+ group_id +";");
					map.put(t_id, 0);
					status=true;
					break;
				}
			}	
			if(status==false) {
				rs3 = st3.executeQuery("SELECT teacher_spec.teacher_id, teacher_spec.spec_id, teacher.active_id, teacher.teacher_id, teacher.pref_id FROM teacher_spec  JOIN teacher ON teacher_spec.teacher_id = teacher.teacher_id WHERE spec_id = "+ (100 + area_pref_2)+" AND teacher.active_id = 1 ORDER BY pref_id;");
				while(rs3.next()) {
					t_id =rs3.getInt(1);
					if(map.get(t_id)==2) {
						st3.executeUpdate("UPDATE teacher SET group_id_1 = " + group_id +" WHERE teacher_id = "+ t_id +";");
						st3.executeUpdate("UPDATE student_group SET guide_alloted = " + t_id +" WHERE group_id = "+ group_id +";");
						map.put(t_id, 1);
						status=true;
						break;
					}
					else if(map.get(t_id)==1) {
						st3.executeUpdate("UPDATE teacher SET group_id_2 = " + group_id +" WHERE teacher_id = "+ t_id +";");
						st3.executeUpdate("UPDATE student_group SET guide_alloted = " + t_id +" WHERE group_id = "+ group_id +";");
						map.put(t_id, 0);
						status=true;
						break;
					}
				}
				if(status==false){
					rs4 = st4.executeQuery("SELECT teacher_spec.teacher_id, teacher_spec.spec_id, teacher.active_id, teacher.teacher_id, teacher.pref_id FROM teacher_spec  JOIN teacher ON teacher_spec.teacher_id = teacher.teacher_id WHERE spec_id = "+ (100 + area_pref_3)+" AND teacher.active_id = 1 ORDER BY pref_id;");
					while(rs4.next()) {
						t_id =rs4.getInt(1);
						if(map.get(t_id)==2) {
							st4.executeUpdate("UPDATE teacher SET group_id_1 = " + group_id +" WHERE teacher_id = "+ t_id +";");
							st4.executeUpdate("UPDATE student_group SET guide_alloted = " + t_id +" WHERE group_id = "+ group_id +";");
							map.put(t_id, 1);
							status=true;
							break;
						}
						else if(map.get(t_id)==1) {
							st4.executeUpdate("UPDATE teacher SET group_id_2 = " + group_id +" WHERE teacher_id = "+ t_id +";");
							st4.executeUpdate("UPDATE student_group SET guide_alloted = " + t_id +" WHERE group_id = "+ group_id +";");
							map.put(t_id, 0);
							status=true;
							break;
						}
					}
					if(status==false) {
						for (HashMap.Entry<Integer, Integer> x : map.entrySet()) {
						    if(x.getValue()==2) {
						    	st5.executeUpdate("UPDATE teacher SET group_id_1 = " + group_id +" WHERE teacher_id = "+ x.getKey() +";");
						    	st5.executeUpdate("UPDATE student_group SET guide_alloted = " + x.getKey() +" WHERE group_id = "+ group_id +";");
						    	map.put(x.getKey(), 1);
						    	status=true;
						    	break;
						    }
						    else if(x.getValue()==1) {
						    	st5.executeUpdate("UPDATE teacher SET group_id_2 = " + group_id +" WHERE teacher_id = "+ x.getKey() +";");
						    	st5.executeUpdate("UPDATE student_group SET guide_alloted = " + x.getKey() +" WHERE group_id = "+ group_id +";");
						    	map.put(x.getKey(), 0);
						    	status=true;
						    	break;
						    }
						}
						
					}	
				}
			}
		}
		//Alloting co-guides
		
		
		rs = st.executeQuery("SELECT * FROM teacher WHERE pref_id >= 100 AND active_id = 1 ORDER BY pref_id;");
		while(rs.next()) {
			int group_id_1 = rs.getInt("group_id_1");
			int group_id_2 = rs.getInt("group_id_2");
			rs2 = st2.executeQuery("SELECT * FROM student_group WHERE group_id = " + group_id_1 + ";");
			if(rs2.next()) {
				for (HashMap.Entry<Integer, Integer> x : map_coguide.entrySet()) {
					if(x.getValue()==1) {
				    	st3.executeUpdate("UPDATE teacher SET group_id_3 = " + group_id_1 +" WHERE teacher_id = "+ x.getKey() +";");
				    	st3.executeUpdate("UPDATE student_group SET guide_alloted_2 = " + x.getKey() +" WHERE group_id = "+ group_id_1 +";");
				    	map_coguide.put(x.getKey(), 0);
				    	break;
				    }
				}
			}
			rs2 = st2.executeQuery("SELECT * FROM student_group WHERE group_id = " + group_id_2 + ";");
			if(rs2.next()) {
				for (HashMap.Entry<Integer, Integer> x : map_coguide.entrySet()) {
					if(x.getValue()==1) {
				    	st3.executeUpdate("UPDATE teacher SET group_id_3 = " + group_id_2 +" WHERE teacher_id = "+ x.getKey() +";");
				    	st3.executeUpdate("UPDATE student_group SET guide_alloted_2 = " + x.getKey() +" WHERE group_id = "+ group_id_2 +";");
				    	map_coguide.put(x.getKey(), 0);
				    	break;
				    }
				}
			}
		}
	}
}

	

