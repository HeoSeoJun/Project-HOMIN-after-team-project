package com.care.homin.mypage.service;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.care.homin.login.dto.LoginDTO;
import com.care.homin.membership.dto.AllDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;
import com.care.homin.rental.dto.orderDTO;
import com.care.homin.servicecenter.dto.InquiryDTO;

public interface IMypageService {
	public AllDTO infoMgmt(String id);
	public AllDTO infoMgUs(int parseInt);

//	기본 정보
	// 조회
	public MemberDTO getUserInfo(String id);
	// 수정
	public String updateProc(MemberDTO memberDto);
	// 삭제
	public boolean deleteProc(String id);
	
//	주소
	// 등록
	public boolean registerAdProc(PostcodeDTO postCode);
	// 조회
	public PostcodeDTO infoAddr(String id);
	// 수정
	public boolean updateAddrProc(PostcodeDTO postCode);
	// 삭제
	public String deleteProcAddr(String id);

//	주문
	// 조회
	public ArrayList<orderDTO> myOrder(String id);

//	1:1 문의
	
	public ArrayList<InquiryDTO> myInquiry(String id);
	public void myInquiryView(String no, Model model);
	public void deleteInquiry(String inquiryNo);
	
	public ArrayList<AllDTO> allMember();
	public void memberView(String id, Model model);
}
