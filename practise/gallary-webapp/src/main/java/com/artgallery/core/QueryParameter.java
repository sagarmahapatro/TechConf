package com.artgallery.core;

import java.util.HashMap;
import java.util.Map;

public class QueryParameter<T> {

	protected Map<String, Object> parameters;

	public QueryParameter() {
		parameters = new HashMap<String, Object>();
	}

	public QueryParameter addParam(String key, Object value) {
		parameters.put(key, value);
		return this;
	}

}
