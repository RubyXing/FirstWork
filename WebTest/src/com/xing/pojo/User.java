package com.xing.pojo;

import java.util.Date;

public class User {

	Integer id;
	String username,email,sex,astro,finalHobbies;
	String[] hobbies;
	Date birth;

	public String getFinalHobbies() {
		return finalHobbies;
	}
	public void setFinalHobbies(String finalHobbies) {
		this.finalHobbies = finalHobbies;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}
	
	public String getAstro() {
		return astro;
	}

	public void setAstro(String astro) {
		this.astro = astro;
	}

	public String[] getHobbies() {
		
		return hobbies;
	}

	public void setHobbies(String[] hobbies) {
		String hobbieResult = "";
		if(hobbies!=null)
			if(hobbies.length>0){
			for(String s:hobbies){
				hobbieResult += s+",";
			}
		}
		setFinalHobbies(hobbieResult);
		this.hobbies = hobbies;
	}

	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", email=" + email + ", sex=" + sex + ", astro=" + astro
				+ ", hobbies=" + hobbies + ", birth=" + birth + "]";
	}
	
	
}