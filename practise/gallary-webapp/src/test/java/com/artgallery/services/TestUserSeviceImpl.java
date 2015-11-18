package com.artgallery.services;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.artgallery.services.contracts.UserSevice;
import com.artgallery.services.dto.UserDetailDTO;
import com.artgallery.services.dto.assembler.IUserDetailDTOAssembler;
import com.artgallery.services.exceptions.UserAlradyExistException;

public class TestUserSeviceImpl {

	public static void main(String[] args) {
		
		ApplicationContext appContext = new ClassPathXmlApplicationContext("spring-jpa.xml");
		
		UserSevice userService = (UserSevice) appContext.getBean("userService");
		
		IUserDetailDTOAssembler<UserDetailDTO> userDetailDTOAssembler = (IUserDetailDTOAssembler<UserDetailDTO>) appContext.getBean("userDetailDTOAssembler");
		userDetailDTOAssembler.setFirstName("sagar")
		.setLastName("mahapatro")
		.setMailId("sagarmahapatro@gmail.com")
		.setPassword("sagar123")
		.setRole("admin");
		
		try {
			userService.registerUser(userDetailDTOAssembler.getDTO());
		} catch (UserAlradyExistException e) {
		  System.out.println(" +++++++++++ user alrady exist ++++++++++++++++++");
		}
		
		userService.authenticateUser("sagar", "sagar");
		System.out.println(" userService "+userService);
	}
}
