package com.artgallery.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Person {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Long id; 
	
	@Column
	private String firstName;
	
	@Column
	private String lastName;
	
	@Column
	private String mailId;
	
	@OneToOne
	RoleLevel roleLevel;
	
}
