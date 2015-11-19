package com.artgallery.services.dto.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import org.mapstruct.Mappings;
import org.mapstruct.factory.Mappers;

import com.artgallery.domain.Person;
import com.artgallery.services.dto.UserDetailDTO;

@Mapper
public abstract class UserDetailMapper {
  public static UserDetailMapper INSTANCE = Mappers.getMapper(UserDetailMapper.class);

  @Mappings({@Mapping(target="role", expression="java(person.getRoleLevel().toString())")})
  public abstract UserDetailDTO map(Person person);
}
