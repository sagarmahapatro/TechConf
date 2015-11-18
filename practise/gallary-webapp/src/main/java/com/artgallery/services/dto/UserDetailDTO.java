package com.artgallery.services.dto;

import javax.persistence.Column;
import javax.persistence.OneToOne;

import com.artgallery.domain.RoleLevel;

public class UserDetailDTO {
	private String firstName;
	private String lastName;
	private String mailId;
	private String role;
	private String password;
	public UserDetailDTO(String firstName, String lastName, String mailId ,String role, String password){
		this.firstName = firstName;
		this.lastName = lastName;
		this.mailId = mailId;
		this.role = role;
		this.password = password;
	}
	public String getFirstName() {
		return firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public String getMailId() {
		return mailId;
	}
	public String getRole() {
		return role;
	}
	public String getPassword() {
		return password;
	}
}
