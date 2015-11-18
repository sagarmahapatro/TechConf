package com.artgallery.services.dto.assembler;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.artgallery.services.dto.UserDetailDTO;

@Component("userDetailDTOAssembler")
@Scope("prototype")
public class UserDetailDTOAssembler extends AbstractDTOAssembler<UserDetailDTO>
		implements IUserDetailDTOAssembler<UserDetailDTO> {
	private String firstName;
	private String lastName;
	private String mailId;
	private String role;
	private String password;

	public UserDetailDTO getDTO() {
		return new UserDetailDTO(firstName, lastName, mailId, role, password);
	}

	public UserDetailDTOAssembler setFirstName(String firstName) {
		this.firstName = firstName;
		return this;
	}

	public UserDetailDTOAssembler setLastName(String lastName) {
		this.lastName = lastName;
		return this;
	}

	public UserDetailDTOAssembler setMailId(String mailId) {
		this.mailId = mailId;
		return this;
	}

	public UserDetailDTOAssembler setRole(String role) {
		this.role = role;
		return this;
	}

	public UserDetailDTOAssembler setPassword(String password) {
		this.password = password;
		return this;
	}

}
