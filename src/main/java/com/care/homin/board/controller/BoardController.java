package com.care.homin.board.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.homin.board.service.BoardService;

@Controller
public class BoardController {
	@Autowired BoardService service;
	
	@RequestMapping("writeProc")
	public String writeProc(MultipartHttpServletRequest multi) {
		service.writeProc(multi);
		return "forward:boardProc";
	}
	@RequestMapping(value = "boardProc")
	public String boardProc(Model model, @RequestParam(value="currentPage", required = false, defaultValue = "1")int currentPage,
		HttpServletRequest req, String search, String select) {
		service.boardProc(model, currentPage, req, search, select);
		return "forward:/index?formpath=board";
	}
	@RequestMapping(value = "viewProc")
	public String viewProc(String num, Model model) {
		int no = Integer.parseInt(num);
		service.viewProc(no,model);
		return "forward:index?formpath=view";
	}
	
//	댓글 등록
	@ResponseBody
	@RequestMapping(value = "comment", produces = "application/json;charset=utf-8")
	public void comment(@RequestBody Map<String, String> map,String num) {
		service.commentProc(map.get("comment"), num);
	}
//	댓글 삭제
	@RequestMapping(value = "/commentDelete")
	@ResponseBody
	public void commentDelete(String comment_no) {
		service.commentDelete(comment_no);
	}
	
	// 관리자권한 게시글 삭제
	@RequestMapping(value = "/deleteBoard")
	public String deleteBoard(String no) {
		service.deleteBoard(no);
		return "forward:boardProc";
	}
	
	// 수정 & 삭제를 위한 '비밀번호' 체크
	@RequestMapping(value = "/boardModifyCheck")
	public String boardModifyCheck(String no, Model model) {
		model.addAttribute("no",no);
		return "board/modifyCheckForm";
	}
	
	// review 수정
	@RequestMapping(value = "/boardModify")
	public String boardModify(String pw, String pwOk,String no, Model model) {
		boolean check = service.boardModify(pw, pwOk, no, model);
		if(check == false) {
			return "forward:index?formpath=boardModifyCheck";
		}
		return "forward:index?formpath=modify";
	}
	@RequestMapping(value = "/boardModifyProc")
	public String boardModifyProc(MultipartHttpServletRequest multi,String no, Model model) {
		service.boardModifyProc(multi,no);
		model.addAttribute("msg","수정 완료.");
		return "forward:boardProc";
	}
	
	// review 삭제
	@RequestMapping(value = "/boardDelete")
	public String boardDelete(String no, Model model) {
		model.addAttribute("no",no);
		return "board/boardDeleteForm";
	}
	@RequestMapping(value = "/boardDeleteProc")
	public String boardDeleteProc(String pw, String pwOk,String no, Model model) {
		service.boardDeleteProc(pw, pwOk, no, model);
		return "forward:boardProc";
	}
}
