package com.care.homin.servicecenter.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.homin.config.PageConfig;
import com.care.homin.servicecenter.dao.ServicecenterDAO;
import com.care.homin.servicecenter.dto.InquiryDTO;
import com.care.homin.servicecenter.dto.NoticeDTO;


@Service
public class ServicecenterService {
	final static Logger logger = LoggerFactory.getLogger(ServicecenterService.class);
	@Autowired ServicecenterDAO dao;
	@Autowired HttpSession session;
	public ArrayList<NoticeDTO> allNotice() {
		ArrayList<NoticeDTO> all = dao.allNotice();
		return all;
	}
	public void inquiryProc(MultipartHttpServletRequest req) {
		InquiryDTO dto = new InquiryDTO();
		
		String id = (String)session.getAttribute("id");
		String inquiryType = req.getParameter("inquiryType");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		List<MultipartFile> files = req.getFiles("uploadFile");
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String writeTime = sdf.format(cal.getTime());
		
		String fname = "";
		UUID uuid = UUID.randomUUID();
		for(MultipartFile mf : files) {
			if(mf.getSize() != 0) {
				String fileName = mf.getOriginalFilename();
				fname += (uuid.toString()+"_"+fileName)+ ",";
				File save = new File("C:\\java_folder\\upload\\" + (uuid.toString()+"_"+fileName));
				try {
					mf.transferTo(save);
				} catch (Exception e) {
					e.printStackTrace();
				} 
			}else {
				dto.setFileName("파일 없음");
			}
		}
		dto.setInquiryType(inquiryType);
		dto.setId(id);				dto.setTitle(title);
		dto.setContent(content);	dto.setFileName(fname);
		dto.setFileName(fname);		dto.setWriteDate(writeTime);
		dto.setState("waiting");	dto.setAnswer("null");
		dao.inquiryProc(dto);
	}
	public void selectNotice(String num, Model model) {
		int no = Integer.parseInt(num);
		NoticeDTO dto = dao.selectNotice(no);
		model.addAttribute("dto",dto);
		
	}
	public void allInquiry(Model model, int currentPage, HttpServletRequest req,String select) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("select", select);
		
		int totalCount = dao.inquiryCount(map);
		int pageBlock = 10;
		int end = currentPage * pageBlock;
		int begin = end + 1 - pageBlock;

		ArrayList<InquiryDTO> inquiryList = dao.inquiryList(begin, end, select);
		model.addAttribute("inquiryList", inquiryList);

		String url = req.getContextPath() + "/inquiryAnswer?";
		if(select != null) {
			url+="select="+select+"&";
		}
		url+="currentPage=";
		model.addAttribute("page", PageConfig.getNavi(currentPage, pageBlock, totalCount, url));
		
	}
	public void viewProc(int no, Model model) {
		InquiryDTO view = dao.selectInquiry(no);
		String[] fileName = null;
		if(view.getFileName() != null && view.getFileName() != "") {
			fileName = view.getFileName().split(",");
		}
		model.addAttribute("fileName",fileName);
		model.addAttribute("view",view);
		
	}
	public void inquiryAnswerProc(InquiryDTO dto) {
		dto.setState("complete");
		dao.inquiryAnswerProc(dto);
		
	}
	public void writeNotice(NoticeDTO dto) {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String writeDate = sdf.format(cal.getTime());
		dto.setWritedate(writeDate);
		dao.writeNotice(dto);
	}
	public int deleteNotice(String no) {
		if(dao.deleteNotice(no) == 1) {
			return 1;
		}else {
			return 0;
		}
	}
	public void modifyNotice(NoticeDTO dto) {
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String writeDate = sdf.format(cal.getTime());
		dto.setWritedate(writeDate);
		dao.modifyNotice(dto);
	}
}
