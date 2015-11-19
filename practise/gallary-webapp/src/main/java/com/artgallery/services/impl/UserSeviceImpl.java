package com.artgallery.services.impl;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.artgallery.daos.contracts.IPersonDAO;
import com.artgallery.daos.contracts.IRoleLevelDAO;
import com.artgallery.daos.exceptions.AuthenticationException;
import com.artgallery.daos.exceptions.EntityNotFoundException;
import com.artgallery.daos.exceptions.MoreThenOneUserFound;
import com.artgallery.domain.Person;
import com.artgallery.domain.RoleLevel;
import com.artgallery.services.contracts.UserSevice;
import com.artgallery.services.dto.UserDetailDTO;
import com.artgallery.services.dto.mapper.UserDetailMapper;
import com.artgallery.services.exceptions.InvalidResultException;
import com.artgallery.services.exceptions.UserAlradyExistException;

@Service("userService")
@Transactional
public class UserSeviceImpl implements UserSevice {
  static final Logger logger = Logger.getLogger(UserSeviceImpl.class);

  @Autowired
  @Qualifier("personDaoJPA")
  IPersonDAO personDao;

  @Autowired
  @Qualifier("roleLevelDAOJpa")
  IRoleLevelDAO roleLevelDAO;

  public UserSeviceImpl() {

  }

  public UserSeviceImpl(IPersonDAO personDao, IRoleLevelDAO roleLevelDAO) {

  }

  public Boolean authenticateUser(String firstName, String lastName, String passcode) {
    logger.debug(" authenticateUser " + personDao);
    Person person = null;
    try {
      person = personDao.authenticatePerson(firstName, lastName, passcode);
    } catch (AuthenticationException e) {

    }
    return person != null;
  }

  public UserDetailDTO getUserDetail(String firstName, String lastName)
      throws InvalidResultException {
    logger.debug(" authenticateUser " + personDao);
    Person person = null;
    try {
      person = personDao.getPersonByUsername(firstName, lastName);
    } catch (EntityNotFoundException | MoreThenOneUserFound mtou) {
      throw new InvalidResultException(mtou);
    }
    UserDetailDTO userDetailDTO = UserDetailMapper.INSTANCE.map(person);
    return userDetailDTO;
  }

  @Transactional
  public void registerUser(UserDetailDTO userDetailDTO) throws UserAlradyExistException {
    Person person = null;
    try {
      person = personDao.getPersonByUserMailID(userDetailDTO.getMailId());
    } catch (EntityNotFoundException e) {
      person = null;
    } catch (MoreThenOneUserFound e) {
      logger.fatal(" fatal error " + person);
    }
    logger.debug(" registerUser started " + person);

    if (person != null) {
      throw new UserAlradyExistException();
    }

    person = new Person();
    person.setFirstName(userDetailDTO.getFirstName());
    person.setLastName(userDetailDTO.getLastName());
    person.setMailId(userDetailDTO.getMailId());
    person.setPassword(userDetailDTO.getPassword());
    RoleLevel roleLevel = new RoleLevel();
    roleLevel.setRoll(userDetailDTO.getRole());

    roleLevelDAO.save(roleLevel);
   // person.setRoleLevel(roleLevel);
    personDao.save(person);
    logger.debug(" registerUser ended " + person);
  }
}
