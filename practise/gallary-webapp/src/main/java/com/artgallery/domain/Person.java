package com.artgallery.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;

@Entity
@NamedQueries({
    @NamedQuery(name = "Person.find",
        query = "SELECT p from Person p where p.firstName like :name " + "or p.lastName like :name"),
    @NamedQuery(name = "Person.findByMailID",
        query = "SELECT p from Person p where p.mailId like :mailId "),
    @NamedQuery(name = "Person.findByUserNameAndPasscode",
        query = "SELECT p from Person p where p.firstName like :firstName and p.lastName like :lastName " + "and p.password like :password")})
public class Person implements DomainObject {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long id;

  @Column
  private String firstName;

  @Column
  private String lastName;

  @Column
  private String mailId;

  @OneToOne
  private RoleLevel roleLevel;

  @Column
  private String password;

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getFirstName() {
    return firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  public String getMailId() {
    return mailId;
  }

  public void setMailId(String mailId) {
    this.mailId = mailId;
  }

  public RoleLevel getRoleLevel() {
    return roleLevel;
  }

  public void setRoleLevel(RoleLevel roleLevel) {
    this.roleLevel = roleLevel;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

}
