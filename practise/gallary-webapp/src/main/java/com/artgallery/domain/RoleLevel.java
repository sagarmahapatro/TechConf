package com.artgallery.domain;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class RoleLevel implements DomainObject{
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	Long id;
	
	public static String GUEST = "guest";
	public static String PUBLIC = "public";
	public static String ADMIN = "admin";
	
	private String roll;
	

}
