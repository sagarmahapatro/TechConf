package com.artgallery.daos.jpa;

import java.util.HashMap;
import java.util.List;

import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;

import org.springframework.stereotype.Repository;

import com.artgallery.daos.GenaricDAO;
import com.artgallery.daos.contracts.IPersonDAO;
import com.artgallery.daos.exceptions.AuthenticationException;
import com.artgallery.daos.exceptions.EntityNotFoundException;
import com.artgallery.daos.exceptions.MoreThenOneUserFound;
import com.artgallery.domain.Person;

@Repository("personDaoJPA")
public class PersonDaoJPA extends JPAGenaricDAO<Person> implements IPersonDAO {

	public PersonDaoJPA() {
		super(Person.class);
	}

	public Person getPersonByUsername(String username)
			throws EntityNotFoundException {
		return null;
	}

	public Person authenticatePerson(String username, String password)
			throws AuthenticationException {
		return null;
	}

	public Person getPersonByUserMailID(String mailID)
			throws EntityNotFoundException, MoreThenOneUserFound {
		JPAQueryParameter<Person> jpaQueryParameter = new JPAQueryParameter<Person>();
		jpaQueryParameter.addParam("mailId", mailID);
		List<Person> persons = getQueryResult("Person.findByMailID",
				jpaQueryParameter);
		Person person = null;
		if (persons == null) {
			throw new EntityNotFoundException();
		} else if (persons.size() > 1) {
			throw new MoreThenOneUserFound();
		} else if (persons.size() > 0){
			person = persons.get(0);
		}
		if(person == null){
		  throw new EntityNotFoundException();
		}
		return person;
	}

}
