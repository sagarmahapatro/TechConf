package com.artgallery.services.contracts;

import com.artgallery.services.dto.UserDetailDTO;
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
  Boolean authenticateUser(String username, String passcode);
  
  /**
   * this method will retrieve user details from db
   * @param username
   * @return
   */
  UserDetailDTO getUserDetail(String userId);
  
  /**
   *  Create a User 
   *  
   * @param userDetailDTO
   */
  void registerUser(UserDetailDTO userDetailDTO) throws UserAlradyExistException;
}
