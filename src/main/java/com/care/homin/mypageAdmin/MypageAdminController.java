package com.care.homin.mypageAdmin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.homin.membership.dto.AllDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;
import com.care.homin.mypage.service.IMypageService;
import com.care.homin.mypageAdmin.service.IMypageAdminService;
import com.care.homin.rental.service.RentalService;

@Controller
public class MypageAdminController {
	@Autowired IMypageAdminService adminSvc;
	@Autowired RentalService service;
	@Autowired IMypageService mypageSvc;
	
	@RequestMapping("/info/manage")
	public String infoManage(Model model) {
		ArrayList<MemberDTO> list = adminSvc.infoManage();
		
		model.addAttribute("list", list);
		return "mypage/info/admin/manage";
	}
	
	@RequestMapping("/info/addrList")
	public String infoAddrList(Model model) {
		ArrayList<PostcodeDTO> list = adminSvc.infoAddrList();
		
		model.addAttribute("list", list);
		return "mypage/info/admin/addrList";
	}
	
	@RequestMapping("/info/mgus")
	public String infoMgus(Model model, String no) {
		int no_ = Integer.parseInt(no);
		
		AllDTO allDto = adminSvc.infoMgus(no_);
		model.addAttribute("allDto", allDto);
		return "mypage/info/admin/mgus";
	}
	
	@RequestMapping("member/deleteUser")
	public String deleteUser(String id, Model model) {
		String msg = adminSvc.deleteUser(id);
		model.addAttribute("msg", msg);
		return "forward:/index?formpath=info/manage";
	}
	
	@RequestMapping("addr/deleteAddr")
	public String deleteAddr(String id, Model model) {
		String msg = adminSvc.deleteAddr(id);
		model.addAttribute("msg", msg);
		return "forward:/index?formpath=info/addrList";
	}
	
	// 관리자, 회원관리
	@RequestMapping(value="memberManagement")
	public String memberManagement(Model model) {
		ArrayList<AllDTO> dto = mypageSvc.allMember();
		model.addAttribute("member",dto);
		return "mypage/info/admin/memberManagementForm";
	}
	// 관리자, 회원관리 - 조회
	@RequestMapping(value = "memberView")
	public String memberView(Model model, String id) {
		mypageSvc.memberView(id,model);
		return "mypage/info/admin/memberViewForm";
	}
	// 관리자, 회원관리 - 삭제
	@RequestMapping(value = "deleteMember")
	public String deleteMember(String id, Model model) {
		if(mypageSvc.deleteProc(id) == true) {
			model.addAttribute("msg","삭제 완료.");
		}else {
			model.addAttribute("msg","문제 발생");
		}
		return "forward:index?formpath=memberManagement";
	}
	// 관리자, 회원관리 - 수정
	@RequestMapping(value = "modifyMember")
	public String modifyMember(MemberDTO mDto, PostcodeDTO pDto, Model model) {
		String check = mypageSvc.updateProc(mDto);
		String check2 = mypageSvc.updateAddrProc(pDto);
		if(check.equals("t") && check2.equals("t")) {
			model.addAttribute("msg","수정 완료.");
		}else {
			model.addAttribute("msg","문제 발생.");
		}
		
		return "forward:index?formpath=memberManagement";
	}
	
	// 관리자, 제품관리
	@RequestMapping(value="productManagement")
	public String productManagement(Model model, String category) {
		model.addAttribute("product",service.selectCategory(category));
		return "mypage/info/admin/productManagementForm";
	}
	// 관리자, 제품관리 - 삭제
	@RequestMapping(value = "deleteProduct")
	public String deleteProduct(String no) {
		service.deleteProduct(no);
		return "forward:index?formpath=productManagement&category=dryer";
	}
	
}
