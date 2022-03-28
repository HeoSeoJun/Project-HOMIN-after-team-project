package com.care.homin.mypage.repository;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import com.care.homin.login.dto.LoginDTO;
import com.care.homin.membership.dto.AllDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;
import com.care.homin.rental.dto.orderDTO;
import com.care.homin.servicecenter.dto.InquiryDTO;

@Repository
public interface IMypageDAO {
	LoginDTO infoLogin(String id);
	MemberDTO infoMember(String id);
	MemberDTO infoMemberByNo(int no);
	PostcodeDTO infoAddr(String id);
	
	boolean deleteProc(String id);
	boolean deleteProcAddr(String id);
	
	boolean updateLogin(MemberDTO memberDto);
	boolean updateMember(MemberDTO memberDto);
	boolean updateAddrProc(PostcodeDTO postCode);
	
	boolean registerAdProc(PostcodeDTO postCode);
	ArrayList<InquiryDTO> myInquiry(String id);
	InquiryDTO myInquiryView(String no);
	ArrayList<orderDTO> myOrder(String buyer_id);
	// 1:1 문의 삭제
	void deleteInquiry(String inquiryNo);
	// 모든 회원 조회
	ArrayList<AllDTO> selectAllMember();
}
