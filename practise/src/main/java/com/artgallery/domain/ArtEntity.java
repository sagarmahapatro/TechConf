package com.artgallery.domain;

import java.util.List;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class ArtEntity {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private Long id;
	
	private List<Tag> tags;
	private List<Comment> comments;
	private List<Catagory> catagories;
	private List<ArtData> artDatas;

	public List<Tag> getTags() {
		return tags;
	}

	public void setTags(List<Tag> tags) {
		this.tags = tags;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public List<Catagory> getCatagories() {
		return catagories;
	}

	public void setCatagories(List<Catagory> catagories) {
		this.catagories = catagories;
	}

	public List<ArtData> getArtData() {
		return artDatas;
	}

	public void setArtData(List<ArtData> artDatas) {
		this.artDatas = artDatas;
	}
}
