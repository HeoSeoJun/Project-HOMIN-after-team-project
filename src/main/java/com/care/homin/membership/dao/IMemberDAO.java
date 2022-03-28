package com.care.homin.membership.dao;

import org.springframework.stereotype.Repository;

import com.care.homin.login.dto.LoginDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;

/*
CREATE TABLE member_homin (
no NUMBER,
id VARCHAR2(20),
nickname VARCHAR2(20),
phone VARCHAR2(20),
email VARCHAR2(20),
PRIMARY KEY(no),
CONSTRAINT fk_member_homin FOREIGN KEY(id) REFERENCES login_homin ON DELETE CASCADE
);

CREATE SEQUENCE no_member_homin START WITH 1 INCREMENT BY 1

CREATE TABLE postcode_homin (
id VARCHAR2(20),
zipcode VARCHAR2(5),
addr1 VARCHAR2(180),
addr2 VARCHAR2(100),
CONSTRAINT fk_postcode_homin FOREIGN KEY(id) REFERENCES login_homin ON DELETE CASCADE
);

 */
@Repository
public interface IMemberDAO {
	MemberDTO memberProc(String id);
	
	int isExistId(String id);
	public void insertLogin(LoginDTO login);
	public void insertMember(MemberDTO member);
	public void insertPost(PostcodeDTO post);

	PostcodeDTO selectPost(String id);

}
