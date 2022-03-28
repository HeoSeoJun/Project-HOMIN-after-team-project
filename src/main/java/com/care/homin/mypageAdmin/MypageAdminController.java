package com.care.homin.mypageAdmin;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.care.homin.membership.dto.AllDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;
import com.care.homin.mypageAdmin.service.IMypageAdminService;

@Controller
public class MypageAdminController {
	@Autowired IMypageAdminService adminSvc;
	
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
	
}
