package com.care.homin.board.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.care.homin.board.dto.BoardDTO;
import com.care.homin.board.dto.CommentDTO;
import com.care.homin.login.dto.LoginDTO;

@Repository
public interface BoardDAO {
	// 게시글 등록
	public void writeProc(BoardDTO dto);
	// 게시글 수
	public int boardCount(HashMap<String, Object> map);
	// 게시판
	public ArrayList<BoardDTO> boardProc(@Param("b") int begin, @Param("e")int end, @Param("sel")String sel, @Param("search") String search);
	// 게시글 확인
	public BoardDTO selectBoard(int no);
	// 조회수 증가
	public void upHit(int no);
	// 댓글 등록
	public void commentProc(CommentDTO dto);
	// 댓글 가져오기
	public ArrayList<CommentDTO> selectComment(int no);
	// 파일이름 가져오기
	public String getFileName(int no);
	// 게시글 삭제
	public void deleteBoard(int no);
	// 댓글 삭제
	public void deleteComment(int no);
	// 게시글 수정
	public void modifyProc(BoardDTO dto);
	// 패스워드 확인
	public LoginDTO pwCheck(String id);
}
