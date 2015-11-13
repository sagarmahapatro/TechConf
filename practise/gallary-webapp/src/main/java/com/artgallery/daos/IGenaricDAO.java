package com.artgallery.daos;

import java.util.List;

import com.artgallery.domain.DomainObject;

public interface IGenaricDAO<T extends DomainObject> {
	public T get(Long id);
	public List<T> getAll();
	public void save(T object);
	public void delete(T object);
}
