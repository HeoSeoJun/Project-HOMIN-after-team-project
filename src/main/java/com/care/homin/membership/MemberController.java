package com.care.homin.membership;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;
import com.care.homin.membership.service.IMemberService;

@Controller
public class MemberController {
	@Autowired IMemberService service;
	
	@RequestMapping("member")
	public String member() {
		return "member/memberForm";
	}
	
	@ResponseBody
	@RequestMapping("isExistId")
	public Map<String, String> isExistId(@RequestBody Map<String, String> map) {
		String id = (String)map.get("id");
		if (id == "" || id == null)
			map.put("msg", "아이디를 입력해주세요");
		else {
			String result = service.isExistId(id);
			map.put("msg", result);
		}
		return map;
	}
	
	@RequestMapping(value = "memberProc")
	public String memberProc(MemberDTO member, PostcodeDTO post, Model model) {
		String msg = service.memberProc(member, post);
		model.addAttribute("msg", msg);
		return "member/memberForm";
	}
}
