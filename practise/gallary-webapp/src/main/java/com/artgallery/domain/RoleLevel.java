package com.artgallery.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ROLELEVEL")
public class RoleLevel implements DomainObject {
  
  public static String GUEST = "guest";
  public static String PUBLIC = "public";
  public static String ADMIN = "admin";

  private Long id;
  private String roll;

  public RoleLevel(){
    
  }
  
  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  @Column(name = "ROLL", nullable = false)
  public String getRoll() {
    return roll;
  }

  public void setRoll(String roll) {
    this.roll = roll;
  }
}
