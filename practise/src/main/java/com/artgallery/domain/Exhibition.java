package com.artgallery.domain;

import java.util.List;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class Exhibition {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	Long id;
	
	private List<ArtEntity> artEntitys;

	public List<ArtEntity> getArtEntitys() {
		return artEntitys;
	}

	public void setArtEntitys(List<ArtEntity> artEntitys) {
		this.artEntitys = artEntitys;
	}
}
