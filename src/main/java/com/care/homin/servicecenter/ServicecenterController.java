package com.care.homin.servicecenter;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.homin.servicecenter.dto.InquiryDTO;
import com.care.homin.servicecenter.dto.NoticeDTO;
import com.care.homin.servicecenter.service.ServicecenterService;

@Controller
public class ServicecenterController {
	@Autowired ServicecenterService service;
	@Autowired HttpSession session;
	
	@RequestMapping(value = "/faq")
	public String faq() {
		return "/servicecenter/faq/faq";
	}
	
	@RequestMapping(value = "/faqDelivery")
	public String faqDelivery() {
		return "/servicecenter/faq/faqDelivery";
	}
	
	@RequestMapping(value = "/faqOrder")
	public String faqOrder() {
		return "/servicecenter/faq/faqOrder";
	}
	
	@RequestMapping(value = "/faqProduct")
	public String faqProduct() {
		return "/servicecenter/faq/faqProduct";
	}
	
	@RequestMapping(value = "/faqExchange")
	public String faqExchange() {
		return "/servicecenter/faq/faqExchange";
	}
	
	@RequestMapping(value = "/faqEtc")
	public String faqEtc() {
		return "/servicecenter/faq/faqEtc";
	}
	
	@RequestMapping(value = "/inquiry")
	public String inquiry() {
		return "/servicecenter/inquiryForm";
	}
	
	@RequestMapping(value = "/inquiryAnswer")
	public String inquiryAnswer(Model model, @RequestParam(value="currentPage", required = false, defaultValue = "1")int currentPage,
			HttpServletRequest req, String select) {
		service.allInquiry(model, currentPage, req,select);
		return "/servicecenter/inquiryAnswerForm";
	}
	
	@RequestMapping(value = "/inquiryViewProc")
	public String inquiryViewProc(String num, Model model) {
		int no = Integer.parseInt(num);
		service.viewProc(no,model);
		return "/servicecenter/inquiryViewForm";
	}
	
	@RequestMapping(value = "/notice")
	public String notice(Model model) {
		ArrayList<NoticeDTO> all = service.allNotice();
		model.addAttribute("all",all);
		return "/servicecenter/noticeForm";
	}
	@RequestMapping(value = "/inquiryProc")
	public String inquiryProc(MultipartHttpServletRequest multi) {
		service.inquiryProc(multi);
		return "forward:index?formpath=home";
	}
	
	@RequestMapping(value = "/inquiryAnswerProc")
	public String inquiryAnswerProc(InquiryDTO dto) {
		service.inquiryAnswerProc(dto);
		return "forward:index?formpath=home";
	}
	
	@RequestMapping(value = "/noticeView")
	public String noticeView(String num, Model model) {
		service.selectNotice(num, model);
		return "/servicecenter/noticeViewForm";
	}
	
	@RequestMapping(value = "/noticeWrite")
	public String noticeWrite() {
		return "/servicecenter/noticeWriteForm";
	}
	
	
	@RequestMapping(value = "/noticeWriteProc")
	public String noticeWriteProc(NoticeDTO dto) {
		service.writeNotice(dto);
		return "forward:index?formpath=servicecenter&list=notice";
	}
	
	@RequestMapping(value = "/deleteNotice")
	public String deleteNotice(String no, Model model) {
		if(service.deleteNotice(no) == 1) {
			model.addAttribute("msg","삭제 완료.");
		}else {
			model.addAttribute("msg","문제 발생.");
		}
		return "forward:index?formpath=servicecenter&list=notice";
	}
	
	@RequestMapping(value = "/modifyNotice")
	public String modifyNotice(String no, Model model) {
		service.selectNotice(no, model);
		return "/servicecenter/modifyNoticeForm";
	}
	
	@RequestMapping(value = "/noticeModifyProc")
	public String noticeModifyProc(Model model, NoticeDTO dto, String num) {
		int no = Integer.parseInt(num);
		dto.setNo(no);
		service.modifyNotice(dto);
		return "forward:index?formpath=servicecenter&list=notice";
	}
	
}
