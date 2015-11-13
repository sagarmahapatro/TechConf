package com.artgallery.daos.jpa;

import java.util.List;

import com.artgallery.daos.GenaricDAO;
import com.artgallery.daos.PersonDao;
import com.artgallery.domain.Person;
import com.artgallery.exception.AuthenticationException;
import com.artgallery.exception.EntityNotFoundException;

public class PersonDaoJPA extends GenaricDAO<Person> implements PersonDao {

	public Person getPersonByUsername(String username)
			throws EntityNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	public Person authenticatePerson(String username, String password)
			throws AuthenticationException {
		// TODO Auto-generated method stub
		return null;
	}

}
