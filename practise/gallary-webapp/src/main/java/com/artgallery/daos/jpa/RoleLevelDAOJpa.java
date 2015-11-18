package com.artgallery.daos.jpa;

import org.springframework.stereotype.Repository;

import com.artgallery.daos.contracts.IRoleLevelDAO;
import com.artgallery.domain.RoleLevel;

@Repository ("roleLevelDAOJpa")
public class RoleLevelDAOJpa extends JPAGenaricDAO<RoleLevel> implements IRoleLevelDAO{

	public RoleLevelDAOJpa() {
		super(RoleLevel.class);
   }
}
