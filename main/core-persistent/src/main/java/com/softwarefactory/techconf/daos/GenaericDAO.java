package com.softwarefactory.techconf.daos;

import java.util.List;

import com.softwarefactory.techconf.domain.DomainObject;

/**
 * This is a root interface for all daos
 * 
 * @author Sagar
 *
 * @param <T>
 */
public interface GenaericDAO<T extends DomainObject> {

	public T getById();

	public List<T> getAll();

	public void save(T t);

	public void delete(T t);
}
