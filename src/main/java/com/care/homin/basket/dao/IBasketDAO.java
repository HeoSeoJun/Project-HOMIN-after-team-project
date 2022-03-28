package com.care.homin.basket.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.care.homin.basket.dto.BasketDTO;
import com.care.homin.rental.dto.RentalDTO;

@Repository
public interface IBasketDAO {

	//상품 번호로 조회 후 장바구니 테이블에 삽입
	RentalDTO searchProduct(String no_);
	boolean putProduct(BasketDTO basketDto);
	//아이디에 해당하는 장바구니 조회
	ArrayList<BasketDTO> getBasket(String id);
	//장바구니 안에 중복 체크
	BasketDTO isExisted(@Param("no") String no, @Param("id") String id);
	boolean deleteBasket(@Param("no") String no, @Param("id") String id);
	
}
