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
	public boolean deleteProc(String id);
	public PostcodeDTO infoAddr(String id);
	public String deleteProcAddr(String id);
	public MemberDTO getUserInfo(String id);
	public String updateProc(MemberDTO memberDto);
	public String updateAddrProc(PostcodeDTO postCode);
	public String registerAdProc(PostcodeDTO postCode);
	public ArrayList<InquiryDTO> myInquiry(String id);
	public void myInquiryView(String no, Model model);
	public ArrayList<orderDTO> myOrder(String id);
	// 1:1 문의 삭제
	public void deleteInquiry(String inquiryNo);
	
	public ArrayList<AllDTO> allMember();
	public void memberView(String id, Model model);
}
