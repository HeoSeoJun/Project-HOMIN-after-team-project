package com.care.homin.mypageAdmin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.homin.config.PagingConfig;
import com.care.homin.membership.dto.AllDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;
import com.care.homin.mypage.service.IMypageService;
import com.care.homin.mypageAdmin.service.IMypageAdminService;
import com.care.homin.rental.dto.orderDTO;
import com.care.homin.rental.service.RentalService;
import com.care.homin.servicecenter.dto.InquiryDTO;
import com.care.homin.servicecenter.service.ServicecenterService;

@Controller
public class MypageAdminController {
	@Autowired IMypageAdminService adminSvc;
	@Autowired RentalService service;
	@Autowired IMypageService mypageSvc;
	@Autowired ServicecenterService serviceSvc;
	@Autowired HttpSession session;
	
//	관리자, 전체 회원 조회
	@RequestMapping("/info/manage")
	public String infoManage(Model model) {
		ArrayList<MemberDTO> list = adminSvc.infoManage();
		
		model.addAttribute("list", list);
		return "mypage/info/admin/manage";
	}
//	관리자, 회원 조회
	@RequestMapping("/info/mgus")
	public String infoMgus(Model model, String no) {
		int no_ = Integer.parseInt(no);
		
		AllDTO allDto = adminSvc.infoMgus(no_);
		model.addAttribute("allDto", allDto);
		return "mypage/info/admin/mgus";
	}
//	관리자, 회원 삭제 
	@RequestMapping("member/deleteUser")
	public String deleteUser(String id, Model model) {
		String msg = adminSvc.deleteUser(id);
		model.addAttribute("msg", msg);
		return "forward:/index?formpath=info/manage";
	}
	
//	관리자, 주소 조회
	@RequestMapping("/info/addrList")
	public String infoAddrList(Model model) {
		ArrayList<PostcodeDTO> list = adminSvc.infoAddrList();
		
		model.addAttribute("list", list);
		return "mypage/info/admin/addrList";
	}	
//	관리자, 주소 삭제
	@RequestMapping("addr/deleteAddr")
	public String deleteAddr(String id, Model model) {
		String msg = adminSvc.deleteAddr(id);
		model.addAttribute("msg", msg);
		return "forward:/index?formpath=info/addrList";
	}
	
	
	// 관리자, 회원관리
	@RequestMapping(value="memberManagement")
	public String memberManagement(Model model, PagingConfig pageConf, String presentPage,
									String mode, String find, String search, String no) {
//		ArrayList<AllDTO> list = mypageSvc.allMember();
		
		if (no != null) {
			int numPerPage = Integer.parseInt(no);
			pageConf.setNumPerPage(numPerPage);
		}
		
		ArrayList<AllDTO> list = new ArrayList<AllDTO>();
		if (search != null && mode.equals("search")) {
			list = adminSvc.allMember(find, search);
			pageConf.setTotalNums(list.size());
			pageConf.setPresentPage(presentPage);
			pageConf.setStartNum();			
		} else {
			list = adminSvc.allMember();
			pageConf.setTotalNums(list.size());
			pageConf.setPresentPage(presentPage);
			pageConf.setStartNum();
		}
		
		model.addAttribute("member",list);
		model.addAttribute("pageConf", pageConf);
		return "mypageAdmin/memberManagementForm";
	}
	// 관리자, 회원관리 - 조회
	@RequestMapping(value = "memberView")
	public String memberView(Model model, String id) {
		mypageSvc.memberView(id,model);
		return "mypageAdmin/memberViewForm";
	}
	// 관리자, 회원관리 - 삭제
	@RequestMapping(value = "deleteMemberByAdmin")
	public String deleteMember(String id, Model model) {
		if(mypageSvc.deleteProc(id)) {
			model.addAttribute("msg","삭제 완료.");
		}else {
			model.addAttribute("msg","문제 발생");
		}
		return "redirect:index?formpath=memberManagement";
	}
	// 관리자, 회원관리 - 수정
	@RequestMapping(value = "modifyMemberByAdmin")
	public String modifyMember(MemberDTO mDto, PostcodeDTO pDto, Model model) {
		String check = mypageSvc.updateProc(mDto);
		boolean check2 = mypageSvc.updateAddrProc(pDto);
		if(check.equals("t") && check2) {
			model.addAttribute("msg","수정 완료.");
		}else {
			model.addAttribute("msg","문제 발생.");
		}
		return "redirect:index?formpath=memberManagement";
	}
	
//	관리자, 문의 전체
	@RequestMapping(value = "/inquiryList")
	public String inquiryList(Model model, @RequestParam(value="currentPage", required = false, defaultValue = "1")int currentPage,
			HttpServletRequest req, String select) {
//		serviceSvc.allInquiry(model, currentPage, req, select);
		adminSvc.allInquiry(model, currentPage, req, select);
		return "/mypageAdmin/inquiryListForm";
	}
//	관리자, 문의 조회 및 답변
	@RequestMapping(value = "/inquiryAnswerForm")
	public String inquiryAnswerForm(String num, Model model) {
		int no = Integer.parseInt(num);
//		serviceSvc.viewProc(no,model);
		adminSvc.viewProc(no,model);
		return "/mypageAdmin/inquiryAnswerForm";
	}
	@RequestMapping(value = "/inquiryAnswerProc")
	public String inquiryAnswerProc(InquiryDTO dto) {
//		serviceSvc.inquiryAnswerProc(dto);
		adminSvc.inquiryAnswerProc(dto);
		return "forward:index?formpath=inquiryList";
	}
	
//	관리자, 주문관리 - 전체
	@RequestMapping("orderManagement")
	public String orderManagement(Model model, PagingConfig pageConf, String presentPage,
									String mode, String select, String search) {
		ArrayList<orderDTO> orderList = new ArrayList<orderDTO>();
		if (search != null && mode.equals("search")) {
			orderList = adminSvc.orderList(select, search);
			pageConf.setTotalNums(orderList.size());
			pageConf.setPresentPage(presentPage);
			pageConf.setStartNum();			
		} else {
			orderList = adminSvc.orderList();
			pageConf.setTotalNums(orderList.size());
			pageConf.setPresentPage(presentPage);
			pageConf.setStartNum();			
		}
//		for (orderDTO dto : orderList)
//			System.out.println(dto.getUid());
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("pageConf", pageConf);
		return "/mypageAdmin/orderManageForm";
	}
//	관리자, 주문관리 - 조회
	@RequestMapping("orderDetail")
	public String orderDetail(Model model, String uid) {
		orderDTO order = adminSvc.orderDetail(uid);
		
		model.addAttribute("order", order);
		return "/mypageAdmin/orderDetail";
	}
//	관리자, 주문관리 - 수정
	@RequestMapping("modifyOrderByAdmin")
	public String modifyOrderByAdmin(orderDTO order, PostcodeDTO postcode) {
//		System.out.println(order.getBuyer_id());
//		System.out.println("postcode.getAddr1(): "+postcode.getAddr1());
//		System.out.println("postcode.getAddr2(): "+postcode.getAddr2());
		String address = postcode.getAddr1()+" "+postcode.getAddr2();
		
		order.setPostcode(postcode.getZipcode());
		order.setAddr(address);
		adminSvc.modifyOrderByAdmin(order);
		return "redirect:index?formpath=orderManagement";
	}
	
	// 관리자, 제품관리
	@RequestMapping(value="productManagement")
	public String productManagement(Model model, String category) {
		model.addAttribute("product",service.selectCategory(category));
		return "mypageAdmin/productManagementForm";
	}
	// 관리자, 제품관리 - 삭제
	@RequestMapping(value = "deleteProduct")
	public String deleteProduct(String no) {
		service.deleteProduct(no);
		return "forward:index?formpath=productManagement&category=dryer";
	}
	
}
