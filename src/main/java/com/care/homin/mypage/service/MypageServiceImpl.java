package com.care.homin.mypage.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.homin.login.dto.LoginDTO;
import com.care.homin.membership.dto.AllDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;
import com.care.homin.mypage.repository.IMypageDAO;
import com.care.homin.rental.dto.orderDTO;
import com.care.homin.servicecenter.dto.InquiryDTO;

@Service
public class MypageServiceImpl implements IMypageService{
	@Autowired IMypageDAO mypageDao;
	
	public AllDTO infoMgmt(String id) {
		LoginDTO loginDto = mypageDao.infoLogin(id);
//		System.out.println("loginDto.getId()"+loginDto.getId());
		MemberDTO memberDto = mypageDao.infoMember(id);
//		System.out.println("memberDto.getId()"+memberDto.getId());
		AllDTO allDto = new AllDTO();
		if (loginDto != null && memberDto != null) {
			allDto.setNo(memberDto.getNo());
			allDto.setId(loginDto.getId());
			allDto.setNickname(memberDto.getNickname());
			allDto.setPhone(memberDto.getPhone());
			allDto.setEmail(memberDto.getEmail());
			return allDto;
		} else {
			return null;
		}
	}
	@Override
	public AllDTO infoMgUs(int no) {
		MemberDTO memberDto = mypageDao.infoMemberByNo(no);
		LoginDTO loginDto = mypageDao.infoLogin(memberDto.getId());
		AllDTO allDto = new AllDTO();
		if (loginDto != null && memberDto != null) {
			allDto.setNo(memberDto.getNo());
			allDto.setId(loginDto.getId());
			allDto.setNickname(memberDto.getNickname());
			allDto.setPhone(memberDto.getPhone());
			allDto.setEmail(memberDto.getEmail());
			return allDto;
		} else {
			return null;
		}
	}
	@Override
	public boolean deleteProc(String id) {
		boolean bool = mypageDao.deleteProc(id);
		return bool;
	}
	@Override
	public PostcodeDTO infoAddr(String id) {
		PostcodeDTO postDto = mypageDao.infoAddr(id);
		return postDto;
	}
	@Override
	public String deleteProcAddr(String id) {
		boolean bool = mypageDao.deleteProcAddr(id);
		String result = "";
		if (bool == true)
			result = "주소지 삭제 완료!";
		else
			result = "주소지 삭제 실패";
		return result;
	}
	@Override
	public MemberDTO getUserInfo(String id) {
		LoginDTO loginDto = mypageDao.infoLogin(id);
		MemberDTO memberDto = mypageDao.infoMember(id);
		memberDto.setPw(loginDto.getPw());
		return memberDto;
	}
	
	@Autowired HttpSession session;
	@Override
	public String updateProc(MemberDTO memberDto) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(memberDto.getPw());
		memberDto.setPw(securePw);
		
		if(memberDto.getPw() != null || memberDto.getPw() != "") {
			mypageDao.updateLogin(memberDto);
		}
		boolean chk_member = mypageDao.updateMember(memberDto);
		if (chk_member)
			return "t";
		else
			return "f";
	}
	@Override
	public String updateAddrProc(PostcodeDTO postCode) {
		boolean chk = mypageDao.updateAddrProc(postCode);
		if (chk)
			return "t";
		else
			return "f";
		
	}
	@Override
	public String registerAdProc(PostcodeDTO postCode) {
		boolean chk = mypageDao.registerAdProc(postCode);
		String result = "";
		if (chk)
			result = "주소지가 등록되었습니다";
		else
			result = "주소지 등록 실패";
		return result;
	}
	@Override
	public ArrayList<InquiryDTO> myInquiry(String id) {
		ArrayList<InquiryDTO> dto = mypageDao.myInquiry(id);
		return dto;
	}
	@Override
	public void myInquiryView(String no, Model model) {
		InquiryDTO dto = mypageDao.myInquiryView(no);
		String img = dto.getFileName();
		String[] imgs = null;
		if(img != null) {
			imgs = img.split(",");
		}
		model.addAttribute("inquiryView", dto);
		model.addAttribute("inquiryImg", imgs);
	}
	@Override
	public ArrayList<orderDTO> myOrder(String buyer_id) {
		return mypageDao.myOrder(buyer_id);
	}
	@Override
	public void deleteInquiry(String inquiryNo) {
		mypageDao.deleteInquiry(inquiryNo);
	}
	@Override
	public ArrayList<AllDTO> allMember() {
		ArrayList<AllDTO> dto = mypageDao.selectAllMember();
		return dto;
	}
	
	@Override
	public void memberView(String id, Model model) {
		MemberDTO dto = mypageDao.infoMember(id);
		PostcodeDTO pDto = mypageDao.infoAddr(id);
		model.addAttribute("member",dto);
		model.addAttribute("addr",pDto);
	}

	
}
