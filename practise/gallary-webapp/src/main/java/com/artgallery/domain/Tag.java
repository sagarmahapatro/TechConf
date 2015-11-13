package com.artgallery.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Tag implements DomainObject {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	Long id;
	
	private ArtEntity artEntity;

	public ArtEntity getArtEntity() {
		return artEntity;
	}

	public void setArtEntity(ArtEntity artEntity) {
		this.artEntity = artEntity;
	}
}
