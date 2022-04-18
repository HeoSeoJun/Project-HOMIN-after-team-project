package com.care.homin.mypageAdmin.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.care.homin.membership.dto.AllDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;
import com.care.homin.rental.dto.orderDTO;
import com.care.homin.servicecenter.dto.InquiryDTO;

public interface IMypageAdminService {

	ArrayList<MemberDTO> infoManage();

	ArrayList<PostcodeDTO> infoAddrList();

	AllDTO infoMgus(int no_);

	String deleteUser(String id);

	String deleteAddr(String id);

//	주문
	ArrayList<orderDTO> orderList();

	ArrayList<orderDTO> orderList(String select, String search);
	
	orderDTO orderDetail(String uid);

	void modifyOrderByAdmin(orderDTO order);

//	문의
	void allInquiry(Model model, int currentPage, HttpServletRequest req, String select);

	void viewProc(int no, Model model);

	void inquiryAnswerProc(InquiryDTO dto);

//	회원
	ArrayList<AllDTO> allMember();

	ArrayList<AllDTO> allMember(String find, String search);


}
