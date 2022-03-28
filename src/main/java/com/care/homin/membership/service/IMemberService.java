package com.care.homin.membership.service;

import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;

public interface IMemberService {

	public String isExistId(String id);
	
	public String memberProc(MemberDTO member, PostcodeDTO post);
	
	public void sendAuth(String email);
	
	public String authConfirm(String authNum);
}
