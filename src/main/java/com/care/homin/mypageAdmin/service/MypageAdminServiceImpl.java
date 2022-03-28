package com.care.homin.mypageAdmin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.homin.login.dto.LoginDTO;
import com.care.homin.membership.dto.AllDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;
import com.care.homin.mypageAdmin.repository.IMypageAdminDAO;

@Service
public class MypageAdminServiceImpl implements IMypageAdminService{
	@Autowired IMypageAdminDAO adminDao;
	
	@Override
	public ArrayList<MemberDTO> infoManage() {
		ArrayList<MemberDTO> list = adminDao.infoList();
		return list;
	}

	@Override
	public ArrayList<PostcodeDTO> infoAddrList() {
		ArrayList<PostcodeDTO> addrList = adminDao.infoAddrList();
		return addrList;
	}

	@Override
	public AllDTO infoMgus(int no) {
		MemberDTO memberDto = adminDao.infoMember(no);
		LoginDTO loginDto = adminDao.infoLogin(memberDto.getId());
		AllDTO allDto = new AllDTO();
		if (memberDto != null && loginDto != null) {
			allDto.setNo(memberDto.getNo());
			allDto.setPw(loginDto.getPw());
			allDto.setId(loginDto.getId());
			allDto.setNickname(memberDto.getNickname());
			allDto.setPhone(memberDto.getPhone());
			allDto.setEmail(memberDto.getEmail());
			return allDto;
		}
		return null;
	}

	@Override
	public String deleteUser(String id) {
		boolean chk = adminDao.deleteUser(id);
		String result = "";
		if (chk ==true)
			result = "회원정보 삭제완료!";
		else
			result = "회원삭제 오류발생";
		return result;
	}

	@Override
	public String deleteAddr(String id) {
		boolean chk = adminDao.deleteAddr(id);
		String result = "";
		if (chk ==true)
			result = "주소지정보 삭제완료!";
		else
			result = "주소지삭제 오류발생";
		return result;
	}
	
}
