package com.care.homin.mypageAdmin.service;

import java.util.ArrayList;

import com.care.homin.membership.dto.AllDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;

public interface IMypageAdminService {

	ArrayList<MemberDTO> infoManage();

	ArrayList<PostcodeDTO> infoAddrList();

	AllDTO infoMgus(int no_);

	String deleteUser(String id);

	String deleteAddr(String id);

}
