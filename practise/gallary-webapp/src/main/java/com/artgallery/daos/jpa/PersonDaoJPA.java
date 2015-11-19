package com.artgallery.daos.jpa;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.artgallery.daos.contracts.IPersonDAO;
import com.artgallery.daos.exceptions.EntityNotFoundException;
import com.artgallery.daos.exceptions.MoreThenOneUserFound;
import com.artgallery.domain.Person;

@Repository("personDaoJPA")
public class PersonDaoJPA extends JPAGenaricDAO<Person> implements IPersonDAO {

  public PersonDaoJPA() {
    super(Person.class);
  }

  public Person getPersonByUsername(String firstName, String lastName)
      throws EntityNotFoundException, MoreThenOneUserFound {
    JPAQueryParameter<Person> jpaQueryParameter = createNamedQuery();
    jpaQueryParameter.addParam("firstName", firstName);
    jpaQueryParameter.addParam("lastName", lastName);
    List<Person> persions = getQueryResult("Person.find", jpaQueryParameter);
    Person person;
    if (persions != null) {
      if (persions != null && persions.size() == 1) {
        person = persions.get(0);
      } else {
        throw new MoreThenOneUserFound();
      }
    } else {
      throw new EntityNotFoundException();
    }
    return person;
  }

  public Person authenticatePerson(String firstName, String lastName, String password) {
    JPAQueryParameter<Person> jpaQueryParameter = createNamedQuery();
    jpaQueryParameter.addParam("firstName", firstName);
    jpaQueryParameter.addParam("lastName", lastName);
    jpaQueryParameter.addParam("password", password);
    List<Person> persions = getQueryResult("Person.findByUserNameAndPasscode", jpaQueryParameter);
    Person person = null;
    if (persions != null && persions.size() == 1) {
      person = persions.get(0);
    }
    return person;
  }

  public Person getPersonByUserMailID(String mailID) throws EntityNotFoundException,
      MoreThenOneUserFound {
    JPAQueryParameter<Person> jpaQueryParameter = createNamedQuery();
    jpaQueryParameter.addParam("mailId", mailID);
    List<Person> persons = getQueryResult("Person.findByMailID", jpaQueryParameter);
    Person person = null;
    if (persons == null) {
      throw new EntityNotFoundException();
    } else if (persons.size() > 1) {
      throw new MoreThenOneUserFound();
    } else if (persons.size() > 0) {
      person = persons.get(0);
    }
    if (person == null) {
      throw new EntityNotFoundException();
    }
    return person;
  }

}
