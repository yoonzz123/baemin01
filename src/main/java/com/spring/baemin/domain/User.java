package com.spring.baemin.domain;

public class User {
	private String user_id;
	private String user_pass;
	private String user_name;
	private String user_email;
	private String user_nick;
	private int user_grade;
	private int user_isadult;
	private int user_isclause;
	private String user_phone;
	private int user_point;

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_pass() {
		return user_pass;
	}

	public void setUser_pass(String user_pass) {
		this.user_pass = user_pass;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public int getUser_grade() {
		return user_grade;
	}

	public void setUser_grade(int user_grade) {
		this.user_grade = user_grade;
	}

	public int getUser_isadult() {
		return user_isadult;
	}

	public void setUser_isadult(int user_isadult) {
		this.user_isadult = user_isadult;
	}

	public int getUser_isclause() {
		return user_isclause;
	}

	public void setUser_isclause(int user_isclause) {
		this.user_isclause = user_isclause;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public int getUser_point() {
		return user_point;
	}

	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_pass=" + user_pass + ", user_name=" + user_name + ", user_email="
				+ user_email + ", user_nick=" + user_nick + ", user_grade=" + user_grade + ", user_isadult="
				+ user_isadult + ", user_isclause=" + user_isclause + ", user_phone=" + user_phone + ", user_point="
				+ user_point + "]";
	}

}
