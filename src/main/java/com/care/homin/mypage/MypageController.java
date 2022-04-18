package com.care.homin.mypage;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.homin.login.dto.LoginDTO;
import com.care.homin.login.service.ILoginService;
import com.care.homin.membership.dto.AllDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;
import com.care.homin.mypage.service.IMypageService;
import com.care.homin.rental.dto.orderDTO;
import com.care.homin.rental.service.RentalService;

@Controller
public class MypageController {
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Autowired IMypageService mypageSvc;
	@Autowired ILoginService loginSvc;
	@Autowired RentalService service;
	
	@RequestMapping("mypageProc")
	public String mypage() {
		return "forward:index?formpath=mypage";
	}
	
	//사용자, 회원 조회
	@RequestMapping("mypageIndex")
	public String infoMgmt(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		AllDTO allDto = mypageSvc.infoMgmt(id);
		
		if (allDto != null)
			model.addAttribute("allDto", allDto);
		return "mypage/info/user/mypageIndex";
	}
	
	//정보관리 위한 비밀번호 확인
	@RequestMapping("/pwCheckForUpdate")
	public String confirmPwForUdMb() {
		return "mypage/info/user/pwCheckForUpdate";
	}
	@RequestMapping("/pwCheckForDelete")
	public String confirmPwForDtMb() {
		return "mypage/info/user/pwCheckForDelete";
	}
	@RequestMapping("/pwCheckForAddrDelete")
	public String confirmPwForDtAddr() {
		return "mypage/info/user/pwCheckForAddrDelete";
	}
	
	@ResponseBody
	@RequestMapping("pwCheckProc")
	public HashMap<String, String> idPwCheck(LoginDTO loginDto, @RequestBody HashMap<String, String> map) {
//			logger.warn("map : " + map.get("id"));
//			logger.warn("map : " + map.get("pw"));
		
		loginDto.setId(map.get("id"));
		loginDto.setPw(map.get("pw"));
//			logger.warn("loginDto : " + loginDto.getId());
//			logger.warn("loginDto : " + loginDto.getPw());
		
		MemberDTO chk = loginSvc.loginProc(loginDto);
		if (chk == null)
			map.put("msg", "비밀번호가 일치하지 않습니다.");
		else
			map.put("msg", "");
		return map;
	}
	
	//사용자, 회원 수정
	@RequestMapping("updateUserForm")
	public String uUIF() {
		return "mypage/info/user/updateMbForm";
	}
	@RequestMapping("updateUserInfoForm")
	public String updateMbForm(String id, Model model) {
		LoginDTO userInfo = mypageSvc.getUserInfo(id);
		model.addAttribute("userInfo", userInfo);
//		return "mypage/info/user/updateMbForm";
		return "forward:index?formpath=updateUserForm";
	}
	@RequestMapping("updateUserInfoProc")
	public String updateProc(MemberDTO memberDto, Model model, HttpSession session) {
		String msg = mypageSvc.updateProc(memberDto);
		if (msg.equals("t")) {
			session.invalidate();
			model.addAttribute("msg", "회원정보 수정 완료!");
			model.addAttribute("formpath", "home");
			return "index";
		} else {
			model.addAttribute("msg", "회원정보 수정오류 발생");
			
			return "forward:index?formpath=home";
		}
	}
	//사용자, 회원 탈퇴
//	@RequestMapping("/mgmt/confirmPw")
//	public String confirmPw() {
//		return "mypage/info/user/confirmPw";
//	}
	@RequestMapping("deleteUserInfoProc")
	public String deleteProc(LoginDTO loginDto, Model model, HttpSession session) {
//			logger.warn("loginDto.getId() : " + loginDto.getId());
//			logger.warn("loginDto.getPw() : " + loginDto.getPw());
		boolean bool = mypageSvc.deleteProc(loginDto.getId());
		if (bool) {
			session.invalidate();
			model.addAttribute("msg", "회원 탈퇴 완료");
			model.addAttribute("formpath", "home");
			return "index";
		} else {
			model.addAttribute("formpath", "pwCheckFormForDelete");
			return "index";
		}
	}
	
	//사용자, 주소 조회
	@RequestMapping("myAddress")
	public String infoAddr(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		PostcodeDTO pc = mypageSvc.infoAddr(id);
		
		model.addAttribute("postCode", pc);
		return "mypage/info/user/myAddress";
	}
	//사용자, 주소 수정
	@RequestMapping("/updateAdForm")
	public String updateAdForm() {
		return "mypage/info/user/updateAdForm";
	}
	@RequestMapping("updateAdProc")
	public String updateAddrProc(PostcodeDTO postCode, HttpSession session, Model model) {
//		logger.warn("session.getAttribute(\"id\") : " + session.getAttribute("id"));
		String id = (String) session.getAttribute("id");
		
//		System.out.println("== updateAdProc ==");
//		System.out.println(postCode.getAddr1());
//		System.out.println(postCode.getAddr2());
//		System.out.println(postCode.getZipcode());
		
		postCode.setId(id);
		boolean result = mypageSvc.updateAddrProc(postCode);
		if (result) {
			session.invalidate();
			String msg = "주소지가 변경되었습니다";
			model.addAttribute("msg", msg);
			model.addAttribute("formpath", "home");
			return "index";
		} else {
			model.addAttribute("formpath", "addr/updateAdForm");
			return "index";
		}
	}
	
	//사용자, 주소 삭제
//	@RequestMapping("/addr/confirmPw")
//	public String confirmPwForAddr() {
//		return "mypage/info/user/confirmPwAddr";
//	}
	@RequestMapping("deleteAddrInfoProc")
	public String deleteAddrInfoProc(LoginDTO loginDto, Model model, HttpSession session) {
		String msg = mypageSvc.deleteProcAddr(loginDto.getId());
		
//		session.invalidate();
		model.addAttribute("msg", msg);
		model.addAttribute("formpath", "mypage");
		return "index";
	}
	//사용자, 주소 추가
	@RequestMapping("/registerAdForm")
	public String registerAdForm() {
		return "mypage/info/user/registerAdForm";
	}
	@RequestMapping("registerAddrProc")
	public String registerAdProc(PostcodeDTO postCode, HttpSession session, Model model) {
		String id = (String) session.getAttribute("id");
		postCode.setId(id);
		
		boolean result = mypageSvc.registerAdProc(postCode);
		String msg = "";
//		logger.warn(msg);
		if (result) {
			msg = "주소지가 등록되었습니다!";
			model.addAttribute("msg", msg);
			model.addAttribute("formpath", "mypage");
			return "index";
		} else {
			msg = "실패: 주소지 등록";
			model.addAttribute("msg", msg);
			model.addAttribute("formpath", "mypage");
			return "index";
		}
	}
//	개인 문의
	@RequestMapping(value = "myinquiry")
	public String myinquiry(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		model.addAttribute("myinquiry",mypageSvc.myInquiry(id));
		return "mypage/myinquiryForm";
	}
	// 개인 문의 - 조회
	@RequestMapping(value = "myinquiryView")
	public String myinquiryView(Model model, String no) {
		mypageSvc.myInquiryView(no,model);
		return "mypage/myinquiryViewForm";
	}
	// 개인 문의 - 삭제
		@RequestMapping(value = "deleteInquiry")
		public String inquiryDelete(String inquiryNo) {
			mypageSvc.deleteInquiry(inquiryNo);
			return "forward:index?formpath=mypage&category=myinquiry";
		}
		
	// 사용자, 주문목록
	@RequestMapping(value = "orderHistory")
	public String orderHistory(Model model, HttpSession session) {
		String id = (String)session.getAttribute("id");
		ArrayList<orderDTO> dto = mypageSvc.myOrder(id);
		model.addAttribute("myOrder",dto);
		return "mypage/orderHistoryForm";
	}
	
}
