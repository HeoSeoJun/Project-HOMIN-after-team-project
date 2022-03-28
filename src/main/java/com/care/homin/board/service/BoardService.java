package com.care.homin.board.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.homin.board.dao.BoardDAO;
import com.care.homin.board.dto.BoardDTO;
import com.care.homin.board.dto.CommentDTO;
import com.care.homin.config.PageConfig;
import com.care.homin.login.dto.LoginDTO;

@Service
public class BoardService {
	@Autowired BoardDAO dao;
	@Autowired HttpSession session;
	
	public void writeProc(MultipartHttpServletRequest req) {
		String title = req.getParameter("title");
		String content= req.getParameter("content");
		String category = req.getParameter("category");
		String product_img = req.getParameter("product_img");
		String order_no = req.getParameter("order_no");
		System.out.println(req.getParameter(order_no));
		BoardDTO dto = new BoardDTO();
		UUID uuid = UUID.randomUUID();
		int review_star = Integer.parseInt(req.getParameter("review_star"));
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String writeTime = sdf.format(cal.getTime());
		
		dto.setId((String)session.getAttribute("id"));
		dto.setHit(0);
		dto.setTitle(title);
		dto.setContent(content);
		if(dto.getId() == null || dto.getId() == "")
			dto.setId("test");
		List<MultipartFile> files = req.getFiles("uploadFile");
		String fname = "";
		
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
		dto.setFileName(fname);
		dto.setWriteTime(writeTime);
		dto.setReview_star(review_star);
		dto.setProduct_img(product_img);
		dto.setClassification(category);
		dto.setOrder_no(order_no);
		dao.writeProc(dto);
		
	}
	public void boardProc(Model model, int currentPage, HttpServletRequest req, String search, String select) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("select", select);
		
		int totalCount = dao.boardCount(map);
		int pageBlock = 10;
		int end = currentPage * pageBlock;
		int begin = end + 1 - pageBlock;

		ArrayList<BoardDTO> boardList = dao.boardProc(begin, end, select, search);
		model.addAttribute("boardList", boardList);

		String url = req.getContextPath() + "/boardProc?";
		if(select != null) {
			url+="select="+select+"&";
			url+="search="+search+"&";	
		}
		url+="currentPage=";
		model.addAttribute("page", PageConfig.getNavi(currentPage, pageBlock, totalCount, url));
	}
	public void viewProc(int no, Model model) {
		BoardDTO view = dao.selectBoard(no);
		String[] fileName = null;
		if(view.getFileName() != null && view.getFileName() != "") {
			fileName = view.getFileName().split(",");
		}
		dao.upHit(no);
		ArrayList<CommentDTO>comment = dao.selectComment(no);
		model.addAttribute("comment",comment);
		model.addAttribute("fileName",fileName);
		model.addAttribute("view",view);
	}
	public void commentProc(String comment, String num) {
		int no = Integer.parseInt(num);
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
		String writeTime = sdf.format(cal.getTime());
		String id = (String)session.getAttribute("id");
		CommentDTO dto = new CommentDTO();
		// 회원가입 받고 세션아이디로 수정.
		dto.setId(id);
		dto.setComment_content(comment);
		dto.setBoard_no(no);
		dto.setWritetime(writeTime);
		
		dao.commentProc(dto);
	}
	public void boardDeleteProc(String pw, String pwOk, String num, Model model) {
		if(pw.equals(pwOk) == false) {
			model.addAttribute("msg","잘못된 접근.");
			return;
		}
		LoginDTO lDto = dao.pwCheck((String)session.getAttribute("id"));
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(encoder.matches(pw, lDto.getPw()) == false) {
			model.addAttribute("msg","패스워드가 일치하지 않습니다.");
			return;
		}else {
			model.addAttribute("msg","삭제 완료.");
		}
		int no = Integer.parseInt(num);
		String fileName = dao.getFileName(no);
		if(fileName != null && fileName != "") {
			String[] fileNames = fileName.split(",");
			for(String name : fileNames) {
				File deleteFile = new File("C:\\java_folder\\upload\\" + name);
				deleteFile.delete();
			}
		}
		dao.deleteBoard(no);
	}
	public boolean boardModify(String pw, String pwOk, String num, Model model) {
		if(pw.equals(pwOk) == false) {
			return false;
		}
		LoginDTO lDto = dao.pwCheck((String)session.getAttribute("id"));
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		if(encoder.matches(pw, lDto.getPw()) == false) {
			model.addAttribute("msg","패스워드가 일치하지 않습니다.");
			return false;
		}
		int no = Integer.parseInt(num);
		BoardDTO dto = dao.selectBoard(no);
		String[] fileName = null;
		if(dto.getFileName() != null && dto.getFileName() != "") {
			fileName = dto.getFileName().split(",");
		}
		model.addAttribute("fileName",fileName);
		model.addAttribute("view",dto);
		return true;
	}
	
	public void boardModifyProc(MultipartHttpServletRequest multi, String num) {
		int no = Integer.parseInt(num);
		BoardDTO dto = new BoardDTO();
		String fname = "";
		String[] name = multi.getParameterValues("img");
		if(name != null) {
			for(String n : name) {
				fname += n+",";
			}
		}
		List<MultipartFile> files = multi.getFiles("uploadFile");
		UUID uuid = UUID.randomUUID();
		for(MultipartFile f : files) {
			if(f.getSize() != 0) {
				String fileName = f.getOriginalFilename();
				fname += (uuid.toString()+"_"+fileName)+",";
				File save = new File("C:\\java_folder\\upload\\" + (uuid.toString()+"_"+fileName));
				try {
					f.transferTo(save);
				} catch (Exception e) {
					e.printStackTrace();
				} 
			}else {
				dto.setFileName("파일 없음");
			}
		}
		dto.setTitle(multi.getParameter("title"));
		dto.setContent(multi.getParameter("content"));
		dto.setFileName(fname);		
		dto.setHit(0);
		dto.setNo(no);
		int review_star = Integer.parseInt(multi.getParameter("review_star"));
		dto.setReview_star(review_star);
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String writeTime = sdf.format(cal.getTime());
		dto.setWriteTime(writeTime);
		dao.modifyProc(dto);
	}
	
	public void commentDelete(String comment_no) {
		int no = Integer.parseInt(comment_no);
		dao.deleteComment(no);
		
	}
	public void deleteBoard(String no) {
		String fileName = dao.getFileName(Integer.parseInt(no));
		if(fileName != null && fileName != "") {
			String[] fileNames = fileName.split(",");
			for(String name : fileNames) {
				File deleteFile = new File("C:\\java_folder\\upload\\" + name);
				deleteFile.delete();
			}
		}
		dao.deleteBoard(Integer.parseInt(no));
		
	}
}