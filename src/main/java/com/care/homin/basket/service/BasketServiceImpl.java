package com.care.homin.basket.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.care.homin.basket.dao.IBasketDAO;
import com.care.homin.basket.dto.BasketDTO;
import com.care.homin.rental.dto.RentalDTO;

@Service
public class BasketServiceImpl implements IBasketService{
	@Autowired IBasketDAO basketDao;
	
	@Override
	public String  basketProduct(String no, String id) {
		RentalDTO dto = basketDao.searchProduct(no);
		String result = "";
		if (dto != null) {
			BasketDTO chk = isExisted(no, id);
			if (chk == null) {
				BasketDTO basketDto = new BasketDTO();
				basketDto.setId(id);
				basketDto.setProduct_no(no);
				basketDto.setProduct_name(dto.getProduct_name());
				basketDto.setClassification(dto.getClassification());
				basketDto.setPrice(dto.getPrice());
				basketDto.setProduct_img(dto.getProduct_filename());
				boolean chk2 = basketDao.putProduct(basketDto);
				if (chk2) {
					result = "장바구니에 추가되었습니다";
				} else {
					result = "장바구니 추가 실패";
				}
			} else {
				result = "이미 추가된 상품입니다";
			}
		} else {
			result = "상품번호에 대한 정보가 없습니다";
		}
		return result;
	}

	@Override
	public ArrayList<BasketDTO> getBasket(String id) {
		return basketDao.getBasket(id);
	}

	@Override
	public BasketDTO isExisted(String no, String id) {
//		System.out.println("no_ - " + no_);
		BasketDTO basketDto = basketDao.isExisted(no, id);
		return basketDto;
	}

	@Override
	public boolean deleteBasket(String no, String id) {
		boolean done = basketDao.deleteBasket(no,id);
		return done;
	}
	
}
