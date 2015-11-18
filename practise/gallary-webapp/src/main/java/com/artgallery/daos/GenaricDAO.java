package com.artgallery.daos;

import java.util.List;

import com.artgallery.daos.contracts.IGenaricDAO;
import com.artgallery.domain.DomainObject;

public class GenaricDAO<T extends DomainObject>  implements IGenaricDAO<T>{

	public T get(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	public List getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	
	public void save(T object) {
		// TODO Auto-generated method stub
		
	}

	public void delete(T object) {
		// TODO Auto-generated method stub
		
	}

}
