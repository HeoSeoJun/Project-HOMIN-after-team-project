package com.care.homin.login.dao;


import org.springframework.stereotype.Repository;
import com.care.homin.login.dto.LoginDTO;
/*
CREATE TABLE login_homin (
id VARCHAR2(20),
pw VARCHAR2(180),
PRIMARY KEY(id)
)
 */

@Repository
public interface ILoginDAO {
	LoginDTO loginProc(String id);
	
}
