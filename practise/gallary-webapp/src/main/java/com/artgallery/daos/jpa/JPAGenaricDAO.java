package com.artgallery.daos.jpa;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.apache.log4j.Logger;
import org.springframework.transaction.annotation.Transactional;

import com.artgallery.core.QueryParameter;
import com.artgallery.daos.GenaricDAO;
import com.artgallery.domain.DomainObject;
import com.artgallery.services.impl.UserSeviceImpl;

public class JPAGenaricDAO<T extends DomainObject> extends GenaricDAO<T> {
  static final Logger logger = Logger.getLogger(JPAGenaricDAO.class);

  protected Class<T> type;
  protected EntityManager entityManager;

  @PersistenceContext
  public void setEntityManager(EntityManager entityManager) {
    this.entityManager = entityManager;
    logger.debug(" entityManager has been set");
  }

  public JPAGenaricDAO(Class<T> type) {
    super();
    this.type = type;
  }

  @Transactional(readOnly = true)
  public T get(Long id) {
    logger.debug(" get method called with id " + id);
    if (id == null) {
      return null;
    } else {
      T t = entityManager.find(type, id);
      logger.debug(" get method returns object " + t);
      return t;
    }
  }

  @Transactional(readOnly = true)
  public List<T> getAll() {
    return entityManager.createQuery("select o from " + type.getName() + "o").getResultList();
  }

  @Transactional
  public void save(T object) {
    entityManager.persist(object);
    logger.debug(" save method is called and object is saved to db succesfully " + object);
  }

  public void remove(T object) {
    entityManager.remove(object);
    logger.debug(" remove method is called and object is remoed from db succesfully " + object);
  }

  protected TypedQuery<T> getNameQuery(String queryName) {
    return entityManager.createNamedQuery(queryName, this.type);
  }

  protected List<T> getQueryResult(String queryName, QueryParameter<T> queryParameter) {
    TypedQuery<T> query = getNameQuery(queryName);
    JPAQueryParameter<T> jpaQueryParameter = (JPAQueryParameter<T>) queryParameter;
    jpaQueryParameter.initializeQueryWithValues(query);
    return query.getResultList();
  }
}
