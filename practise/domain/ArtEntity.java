package com.artgallery.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

public class ArtEntity implements DomainObject {

  private Long id;
  private String title;
  private String subTitle;
  private Date uploadedDate;
  private Date displayDate;
  private Integer width;
  private Integer height;
  private String media;
  private String description;
  private String caption;
  private String imagePath;
  private Integer version;
  // using hash set here as ordering of element is nor required and set is used so that
  // duplicate objects are not allowed


 // private Set<Comment> comments = new HashSet<Comment>();
 // private Set<Catagory> catagories = new HashSet<Catagory>();

  @Id
  @GeneratedValue(strategy = GenerationType.AUTO)
  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getSubTitle() {
    return subTitle;
  }

  public void setSubTitle(String subTitle) {
    this.subTitle = subTitle;
  }

  public Date getUploadedDate() {
    return uploadedDate;
  }

  public void setUploadedDate(Date uploadedDate) {
    this.uploadedDate = uploadedDate;
  }

  public Date getDisplayDate() {
    return displayDate;
  }

  public void setDisplayDate(Date displayDate) {
    this.displayDate = displayDate;
  }

  public Integer getWidth() {
    return width;
  }

  public void setWidth(Integer width) {
    this.width = width;
  }

  public Integer getHeight() {
    return height;
  }

  public void setHeight(Integer height) {
    this.height = height;
  }

  public String getMedia() {
    return media;
  }

  public void setMedia(String media) {
    this.media = media;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getCaption() {
    return caption;
  }

  public void setCaption(String caption) {
    this.caption = caption;
  }

  public String getImagePath() {
    return imagePath;
  }

  public void setImagePath(String imagePath) {
    this.imagePath = imagePath;
  }

  public Integer getVersion() {
    return version;
  }

  public void setVersion(Integer version) {
    this.version = version;
  }

//  @OneToMany
//  public Set<Comment> getComments() {
//    return comments;
//  }
//
//  public void setComments(Set<Comment> comments) {
//    this.comments = comments;
//  }
//
//  @ManyToMany
//  public Set<Catagory> getCatagories() {
//    return catagories;
//  }
//
//  public void setCatagories(Set<Catagory> catagories) {
//    this.catagories = catagories;
//  }


}
