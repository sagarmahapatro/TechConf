package com.artgallery.services.dto.assembler;


public interface IUserDetailDTOAssembler<UserDetailDTO> extends IDTOAssembler<UserDetailDTO> {
	UserDetailDTOAssembler setFirstName(String firstName);
	UserDetailDTOAssembler setLastName(String lastName) ;
	UserDetailDTOAssembler setMailId(String mailId);
    UserDetailDTOAssembler setRole(String role);
    UserDetailDTOAssembler setPassword(String password);
}
