package com.artgallery.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

public class Catagory implements DomainObject {


  private Long id;

  @Column
  private String catagoryDescription;

  @Column
  private String catagoryName;

  private Set<ArtEntity> artEntities = new HashSet<ArtEntity>();


  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getCatagoryDescription() {
    return catagoryDescription;
  }

  public void setCatagoryDescription(String catagoryDescription) {
    this.catagoryDescription = catagoryDescription;
  }

  public String getCatagoryName() {
    return catagoryName;
  }

  public void setCatagoryName(String catagoryName) {
    this.catagoryName = catagoryName;
  }

  @ManyToMany
  public Set<ArtEntity> getArtEntities() {
    return artEntities;
  }

  public void setArtEntities(Set<ArtEntity> artEntities) {
    this.artEntities = artEntities;
  }
}
