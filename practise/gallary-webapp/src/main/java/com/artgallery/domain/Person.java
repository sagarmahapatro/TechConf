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
@NamedQueries({ @NamedQuery(name = "Person.find", query = "SELECT p from Person p where p.firstName like :name "
        + "or p.lastName like :name") })
public class Person implements DomainObject{

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
	
	@Column
	String password;
	
}
