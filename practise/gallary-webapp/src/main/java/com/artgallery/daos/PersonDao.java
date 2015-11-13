package com.artgallery.daos;


import com.artgallery.exception.AuthenticationException;
import com.artgallery.exception.EntityNotFoundException;
import com.artgallery.domain.Person;

public interface PersonDao extends IGenaricDAO<Person> {
	public Person getPersonByUsername(String username) throws EntityNotFoundException;
	public Person authenticatePerson(String username, String password) throws AuthenticationException;
}
