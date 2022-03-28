package com.care.homin.servicecenter.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.care.homin.servicecenter.dto.InquiryDTO;
import com.care.homin.servicecenter.dto.NoticeDTO;

@Repository
public interface ServicecenterDAO {
	// 공지사항
	public ArrayList<NoticeDTO> allNotice();
	// 1:1문의
	public void inquiryProc(InquiryDTO dto);
	// 공지사항view
	public NoticeDTO selectNotice(int no);
	// 1:1문의 갯수
	public int inquiryCount(HashMap<String, Object> map);
	// 1:1문의 전체
	public ArrayList<InquiryDTO> inquiryList(@Param("b") int begin, @Param("e")int end, @Param("sel")String sel);
	// 1:1문의 View
	public InquiryDTO selectInquiry(int no);
	// 1:1문의 답변 등록
	public void inquiryAnswerProc(InquiryDTO dto);
	// 공지사항 등록
	public void writeNotice(NoticeDTO dto);
	// 공지사항 삭제
	public int deleteNotice(String no);
	// 공지사항 수정
	public void modifyNotice(NoticeDTO dto);
}
