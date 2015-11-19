package com.artgallery.daos.contracts;


import com.artgallery.daos.exceptions.AuthenticationException;
import com.artgallery.daos.exceptions.EntityNotFoundException;
import com.artgallery.daos.exceptions.MoreThenOneUserFound;
import com.artgallery.domain.Person;

public interface IPersonDAO extends IGenaricDAO<Person> {
	public Person getPersonByUserMailID(String mailID) throws EntityNotFoundException, MoreThenOneUserFound;
	public Person getPersonByUsername(String firstName, String lastName) throws EntityNotFoundException,MoreThenOneUserFound;
	public Person authenticatePerson(String firstName, String lastName, String password) throws AuthenticationException;
}
