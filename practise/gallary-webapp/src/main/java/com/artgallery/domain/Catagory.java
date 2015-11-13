package com.artgallery.domain;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Catagory implements DomainObject{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	@Column
	private String name;
	
	private ArtEntity artEntity;

	public ArtEntity getArtEntity() {
		return artEntity;
	}

	public void setArtEntity(ArtEntity artEntity) {
		this.artEntity = artEntity;
	}
}
