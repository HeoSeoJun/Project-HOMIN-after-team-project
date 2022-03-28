package com.care.homin.membership.service;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.care.homin.membership.dao.IMemberDAO;
import com.care.homin.login.dto.LoginDTO;
import com.care.homin.membership.dto.MemberDTO;
import com.care.homin.membership.dto.PostcodeDTO;

@Service
public class MemberServiceImple implements IMemberService{
	@Autowired IMemberDAO dao;
	
	@Override
	public String isExistId(String id) {
		int count = dao.isExistId(id);
		if(count == 1)
				return "중복 아이디입니다.";
		return "사용 가능한 아이디 입니다.";
	}
	
	@Override
	public String memberProc(MemberDTO member, PostcodeDTO post) {
		Boolean check = (Boolean)session.getAttribute("authState");
		
		if(check == null) {
			return "이메일 인증 후 가입 할 수 있습니다.";
		}
		LoginDTO login = member;
		if(login.getId() == "" || login.getPw() == "")
				return "필수 정보 입니다.";
		if(dao.isExistId(login.getId()) > 0)
				return "중복 아이디입니다.";
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String securePw = encoder.encode(login.getPw());
		login.setPw(securePw);
		dao.insertLogin(login);
		dao.insertMember(member);
		
		if(!"".equals(post.getZipcode())) {
			dao.insertPost(post);
		}
		return "가입 완료.";
	}
	
	final static Logger logger = LoggerFactory.getLogger(MemberServiceImple.class);
	
	@Autowired HttpSession session;
	@Autowired MailService mailService;
	@Override
	public void sendAuth(String email) {
		String authNum = (String)session.getAttribute("authNum");
		if(authNum == null) {
			Random r = new Random();
			String randNum = String.format("%06d", r.nextInt(1000000));
			session.setAttribute("authNum", randNum);
			session.setMaxInactiveInterval(180);
			mailService.sendMail(email, "[인증번호]", randNum);
			logger.warn(randNum);
		}else
			logger.warn("인증번호는 생성되어 있음");
	}
	
	@Override
	public String authConfirm(String inputAuthNum) {
		String sessionAuthNum = (String)session.getAttribute("authNum");
		if(sessionAuthNum == null)
			return "인증 번호를 생성하세요.";
		if(inputAuthNum == "")
			return "인증 번호를 입력하세요.";
		if(inputAuthNum.equals(sessionAuthNum)) {
			session.setAttribute("authState", true);
			return "인증 완료";
		}
		return "인증 실패";
	}
}
