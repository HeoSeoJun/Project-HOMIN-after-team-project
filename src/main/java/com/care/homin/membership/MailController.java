package com.care.homin.membership;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.care.homin.membership.service.IMemberService;
import com.care.homin.membership.service.MemberServiceImple;

@RestController
public class MailController {
	final static Logger logger = LoggerFactory.getLogger(MailController.class);
	@Autowired MemberServiceImple service;
	
	@RequestMapping(value = "sendAuth")
	public Map<String, String> sendAuth(@RequestBody Map<String, String> map, HttpSession session) {
//		System.out.println("email: "+map.get("email")); 전달 확인
		String email = map.get("email");
		Boolean check = (Boolean)session.getAttribute("authState");
		if(check != null && check == true) {
			map.put("msg", "이미 인증 완료.");
			return map;
		}
		
		service.sendAuth(email);
		map.put("msg", "이메일을 확인하세요.");
		return map;
	}
	
	@RequestMapping(value = "authConfirm")
	public Map<String, String> authConfirm(@RequestBody Map<String, String> map, HttpSession session) {
		Boolean check = (Boolean)session.getAttribute("authState");
		if(check != null && check == true) {
			map.put("msg", "인증 완료.");
			return map;
		}
		
		map.put("msg", service.authConfirm(map.get("inputAuthNum")));
		return map;
	}
}
