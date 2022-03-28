package com.care.homin.rental.dao;

import java.util.ArrayList;

import com.care.homin.rental.dto.RentalDTO;
import com.care.homin.rental.dto.orderDTO;

public interface RentalDAO {
	// 카테고리별 제품
	ArrayList<RentalDTO> selectCategory(String category);
	// 제품 상세
	RentalDTO selectProduct(String prodNo);
	// 주문내역 db 저장
	void orderHistoryProc(orderDTO dto);
	// db에 저장된 주문내역 가져오기
	orderDTO selectOrderHistory(String no);
	// 제품 이미지 가져오기
	String selectProductImg(String productName);
	// 제품 분류 가져오기
	String selectClassification(String productName);
	// 제품 조회수 증가
	void productUpHit(String product_no);
	// 조회수 Top4 상품 정보 가져오기
	ArrayList<RentalDTO> selectTopViews();
	// 주문 수
	void upOrderCount(String no);
	// 구매수 Top4 상품 정보 가져오기
	ArrayList<RentalDTO> selectOrderCount();
	// db 주문 정보 삭제
	void cancleOrder(String uid);
	// 제품 삭제
	void deleteProduct(String no);

}
