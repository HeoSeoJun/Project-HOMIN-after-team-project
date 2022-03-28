package com.care.homin.login.service;

import com.care.homin.login.dto.LoginDTO;
import com.care.homin.membership.dto.MemberDTO;

public interface ILoginService {
	public MemberDTO loginProc(LoginDTO loginDto);

}
