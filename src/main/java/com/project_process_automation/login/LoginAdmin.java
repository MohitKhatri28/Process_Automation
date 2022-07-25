package com.project_process_automation.login;

public class LoginAdmin {
	private int teacher_id=0;
	private String teacher_name="";
	
	private int if_guide_alloted=0;
	
	public int getIf_guide_alloted() {
		return if_guide_alloted;
	}
	public void setIf_guide_alloted(int if_guide_alloted) {
		this.if_guide_alloted = if_guide_alloted;
	}
	//Getters and Setters
	public int getTeacher_id() {
		return teacher_id;
	}
	public void setTeacher_id(int teacher_id) {
		this.teacher_id = teacher_id;
	}
	public String getTeacher_name() {
		return teacher_name;
	}
	public void setTeacher_name(String teacher_name) {
		this.teacher_name = teacher_name;
	}
	
}
