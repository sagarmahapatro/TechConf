package com.artgallery.daos.contracts;


import com.artgallery.daos.exceptions.AuthenticationException;
import com.artgallery.daos.exceptions.EntityNotFoundException;
import com.artgallery.daos.exceptions.MoreThenOneUserFound;
import com.artgallery.domain.Person;

public interface IPersonDAO extends IGenaricDAO<Person> {
	public Person getPersonByUserMailID(String mailID) throws EntityNotFoundException, MoreThenOneUserFound;
	public Person getPersonByUsername(String username) throws EntityNotFoundException;
	public Person authenticatePerson(String username, String password) throws AuthenticationException;
}
