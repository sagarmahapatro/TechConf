package com.artgallery.services.contracts;

import com.artgallery.services.dto.UserDetailDTO;
import com.artgallery.services.exceptions.InvalidResultException;
import com.artgallery.services.exceptions.UserAlradyExistException;

public interface UserSevice {
  /**
   * This method will authenticate the user. if authentication is successful then
   * it returns the token value
   *  	
   * @param username
   * @param passcode
   * @return
   */
  Boolean authenticateUser(String firstName,String lastName, String passcode);
  
  /**
   * this method will retrieve user details from db
   * @param firstName
   * @param lastName
   * @return
   */
  UserDetailDTO getUserDetail(String firstName, String lastName) throws InvalidResultException;
  
  /**
   *  Create a User 
   *  
   * @param userDetailDTO
   */
  void registerUser(UserDetailDTO userDetailDTO) throws UserAlradyExistException;
  
  
}
