package com.artgallery.services;

import com.artgallery.services.dto.UserDetailDTO;

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
}
