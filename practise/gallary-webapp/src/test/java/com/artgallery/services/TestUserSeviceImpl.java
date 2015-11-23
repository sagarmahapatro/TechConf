package com.artgallery.services;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.artgallery.services.contracts.UserSevice;
import com.artgallery.services.dto.UserDetailDTO;
import com.artgallery.services.exceptions.InvalidResultException;
import com.artgallery.services.exceptions.UserAlradyExistException;

public class TestUserSeviceImpl {

  public static void main(String[] args) {

  
    ApplicationContext appContext = new ClassPathXmlApplicationContext("spring-jpa.xml");

    UserSevice userService = (UserSevice) appContext.getBean("userService");

    UserDetailDTO userDetailDTO =
        new UserDetailDTO().setFirstName("sagar").setLastName("mahapatro")
            .setMailId("sagarmahapatro@gmail.com").setPassword("sagar123").setRole("admin");

    try {
      userService.registerUser(userDetailDTO);
    } catch (UserAlradyExistException e) {
      System.out.println(" +++++++++++ user alrady exist ++++++++++++++++++");
    }

    if (userService.authenticateUser("sagar", "mahapatro", "sagar123")) {
      System.out.println(" the user is legitimate user >>>>>>> " + userService);
      try {
        userDetailDTO = userService.getUserDetail("sagar", "mahapatro");
        System.out.println(" user detail  " + userDetailDTO);
      } catch (InvalidResultException e) {
        System.out.println(" InvalidResultException " + e);
      }
    }
    System.out.println(" userService " + userService);
  }
}
