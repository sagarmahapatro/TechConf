package com.artgallery.services.dto;

import org.apache.commons.lang.builder.ToStringBuilder;


public class UserDetailDTO {
  private String firstName;
  private String lastName;
  private String mailId;
  private String role;
  private String password;

  public UserDetailDTO() {

  }

  public UserDetailDTO(String firstName, String lastName, String mailId, String role,
      String password) {
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

  public UserDetailDTO setFirstName(String firstName) {
    this.firstName = firstName;
    return this;
  }

  public UserDetailDTO setLastName(String lastName) {
    this.lastName = lastName;
    return this;
  }

  public UserDetailDTO setMailId(String mailId) {
    this.mailId = mailId;
    return this;
  }

  public UserDetailDTO setRole(String role) {
    this.role = role;
    return this;
  }

  public UserDetailDTO setPassword(String password) {
    this.password = password;
    return this;
  }

  @Override
  public String toString() {
    return ToStringBuilder.reflectionToString(this);
  }
}
