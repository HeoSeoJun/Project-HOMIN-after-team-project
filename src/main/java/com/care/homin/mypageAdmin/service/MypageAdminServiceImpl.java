package com.care.homin.mypageAdmin.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.homin.config.PageConfig;
import com.care.homin.login.dto.LoginDTO;
import com.care.homin.membership.dto.AllDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;
import com.care.homin.mypageAdmin.repository.IMypageAdminDAO;
import com.care.homin.rental.dto.orderDTO;
import com.care.homin.servicecenter.dto.InquiryDTO;

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

//	주문
	@Override
	public ArrayList<orderDTO> orderList() {
		return adminDao.orderList();
	}
	@Override
	public ArrayList<orderDTO> orderList(String select, String search) {
		
		return adminDao.orderListSearched(select, search);
	}
	@Override
	public orderDTO orderDetail(String uid) {
		return adminDao.orderDetail(uid);
	}
	@Override
	public void modifyOrderByAdmin(orderDTO order) {
		adminDao.modifyOrderByAdmin(order);
	}

//	문의
	@Override
	public void allInquiry(Model model, int currentPage, HttpServletRequest req, String select) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("select", select);
		
		int totalCount = adminDao.inquiryCount(map);
		int pageBlock = 5;
		int end = currentPage * pageBlock;
		int begin = end + 1 - pageBlock;

		ArrayList<InquiryDTO> inquiryList = adminDao.inquiryList(begin, end, select);
		model.addAttribute("inquiryList", inquiryList);

//		logger.warn(req.getContextPath());
//		String url = req.getContextPath() + "/inquiryList?";
		String url = req.getContextPath() + "/index?formpath=inquiryList?";
		if(select != null) {
			url+="select="+select+"&";
		}
		url+="currentPage=";
		model.addAttribute("page", PageConfig.getNavi(currentPage, pageBlock, totalCount, url));
	}
	@Override
	public void viewProc(int no, Model model) {
		InquiryDTO view = adminDao.selectInquiry(no);
		String[] fileName = new String[0];
		if(view.getFileName() != null && view.getFileName() != "") {
			fileName = view.getFileName().split(",");
		}
		model.addAttribute("fileName",fileName);
		model.addAttribute("view",view);
	}
	@Override
	public void inquiryAnswerProc(InquiryDTO dto) {
		dto.setState("complete");
		adminDao.inquiryAnswerProc(dto);
	}

//	회원
	@Override
	public ArrayList<AllDTO> allMember() {
		ArrayList<AllDTO> dto = adminDao.selectAllMember();
		return dto;
	}
	@Override
	public ArrayList<AllDTO> allMember(String find, String search) {
		ArrayList<AllDTO> mbListSearched = adminDao.selectMemberSearched(find, search);
		return mbListSearched;
	}

}
