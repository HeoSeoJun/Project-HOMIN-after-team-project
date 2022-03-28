package com.care.homin.mypageAdmin.repository;

import java.util.ArrayList;

import com.care.homin.login.dto.LoginDTO;
import com.care.homin.membership.dto.AllDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;

public interface IMypageAdminDAO {

	ArrayList<MemberDTO> infoList();

	ArrayList<PostcodeDTO> infoAddrList();

	MemberDTO infoMember(int no);

	LoginDTO infoLogin(String id);

	boolean deleteUser(String id);

	boolean deleteAddr(String id);

	
}
