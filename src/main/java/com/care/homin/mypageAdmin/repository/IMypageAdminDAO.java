package com.care.homin.mypageAdmin.repository;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;

import com.care.homin.login.dto.LoginDTO;
import com.care.homin.membership.dto.AllDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;
import com.care.homin.rental.dto.orderDTO;
import com.care.homin.servicecenter.dto.InquiryDTO;

public interface IMypageAdminDAO {

	ArrayList<MemberDTO> infoList();

	ArrayList<PostcodeDTO> infoAddrList();

	MemberDTO infoMember(int no);

	LoginDTO infoLogin(String id);

	boolean deleteUser(String id);

	boolean deleteAddr(String id);

//	주문
	ArrayList<orderDTO> orderList();

	ArrayList<orderDTO> orderListSearched(@Param("sel")String select, @Param("sear")String search);
	
	orderDTO orderDetail(String uid);

	void modifyOrderByAdmin(orderDTO order);

//	문의
	int inquiryCount(HashMap<String, Object> map);

	public ArrayList<InquiryDTO> inquiryList(@Param("b") int begin, @Param("e")int end, @Param("sel")String sel);

	InquiryDTO selectInquiry(int no);

	void inquiryAnswerProc(InquiryDTO dto);

//	회원
	ArrayList<AllDTO> selectAllMember();

	ArrayList<AllDTO> selectMemberSearched(@Param("find")String find, @Param("search")String search);


	
}
