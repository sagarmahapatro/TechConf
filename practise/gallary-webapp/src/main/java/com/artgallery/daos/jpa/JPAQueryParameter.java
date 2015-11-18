package com.artgallery.daos.jpa;

import javax.persistence.TypedQuery;

import com.artgallery.core.QueryParameter;

public class JPAQueryParameter<T> extends QueryParameter<T>{

    public void initializeQueryWithValues(TypedQuery<T> query){
    	for (String key : parameters.keySet()) {
		    query.setParameter(key, parameters.get(key));
		}
	}
}
