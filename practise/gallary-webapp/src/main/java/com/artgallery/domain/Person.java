package com.artgallery.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="PERSON")
@NamedQueries({
    @NamedQuery(name = "Person.find",
        query = "SELECT p from Person p where p.firstName like :firstName "
            + "or p.lastName like :lastName"),
    @NamedQuery(name = "Person.findByMailID",
        query = "SELECT p from Person p where p.mailId like :mailId "),
    @NamedQuery(
        name = "Person.findByUserNameAndPasscode",
        query = "SELECT p from Person p where p.firstName like :firstName and p.lastName like :lastName "
            + "and p.password like :password")})
public class Person implements DomainObject {

  private Long id;
  private String firstName;
  private String lastName;
  private String mailId;
  private RoleLevel roleLevel;
  private String password;

  public Person(){
    
  }
  
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  @Column(name = "FIRST_NAME", nullable = false)
  public String getFirstName() {
    return firstName;
  }

  public void setFirstName(String firstName) {
    this.firstName = firstName;
  }

  @Column(name = "LAST_NAME", nullable = false)
  public String getLastName() {
    return lastName;
  }

  public void setLastName(String lastName) {
    this.lastName = lastName;
  }

  @Column(name = "EMAIL_ID", nullable = false)
  public String getMailId() {
    return mailId;
  }

  public void setMailId(String mailId) {
    this.mailId = mailId;
  }

  @OneToOne
  @JoinColumn(name="ROLE_LEVEL_ID")
  public RoleLevel getRoleLevel() {
    return roleLevel;
  }

  public void setRoleLevel(RoleLevel roleLevel) {
    this.roleLevel = roleLevel;
  }

  @Column(name = "PASSWORD", nullable = false)
  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

}
