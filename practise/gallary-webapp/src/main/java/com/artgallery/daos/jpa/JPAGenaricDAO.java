package com.artgallery.daos.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

import com.artgallery.daos.GenaricDAO;
import com.artgallery.domain.DomainObject;

public class JPAGenaricDAO<T extends DomainObject> extends GenaricDAO<T> {
	protected Class<T> type;
	protected EntityManager entityManager;

	@PersistenceContext
	public void setEntityManager(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	public JPAGenaricDAO(Class<T> type) {
		super();
		this.type = type;
	}

	@Transactional(readOnly = true)
	public T get(Long id) {
		if (id == null) {
			return null;
		} else {
			return entityManager.find(type, id);
		}
	}

	@Transactional(readOnly = true)
	public List<T> getAll() {
		return entityManager.createQuery(
				"select o from " + type.getName() + "o").getResultList();
	}

	public void save(T object) {
		entityManager.persist(object);
	}

	public void remove(T object) {
		entityManager.remove(object);
	}
}
