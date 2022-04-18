package com.care.homin.basket.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.homin.basket.dao.IBasketDAO;
import com.care.homin.basket.dto.BasketDTO;
import com.care.homin.membership.dao.IMemberDAO;
import com.care.homin.rental.dao.RentalDAO;
import com.care.homin.rental.dto.RentalDTO;
import com.care.homin.rental.service.RentalService;

@Service
public class BasketServiceImpl implements IBasketService{
	@Autowired IBasketDAO basketDao;
	
	@Override
	public String  basketProduct(String no, String id) {
		String result = "";
		int cnt_basket = getBasket(id).size();
		if (cnt_basket >= 4) {
			result = "장바구니가 가득 찼습니다";
			return result;
		}	
		
		RentalDTO dto = basketDao.searchProduct(no);
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
	
	@Autowired RentalDAO rentalDao;
	@Autowired IMemberDAO mDao;
	@Override
	public void basketOrderForm(Model model, String id, List<String> prNo) {
		model.addAttribute("memberInfo",mDao.memberProc(id));
		model.addAttribute("memberPostcode",mDao.selectPost(id));
		model.addAttribute("prNo",prNo);
//		List<RentalDTO> productList = new ArrayList<RentalDTO>(); 
//		for (String s : prNo) {
//			productList.add(rentalDao.selectProduct(s));
//		}
//		model.addAttribute("productList",productList);
	}

	@Override
	public void basketOrderProc(Model model, String id, List<String> prList) {
		model.addAttribute("memberInfo",mDao.memberProc(id));
		model.addAttribute("memberPostcode",mDao.selectPost(id));
		
		List<RentalDTO> list = new ArrayList<RentalDTO>();
		
		String name_basket = "";
		String prNO_first = "";
		int count_basket = 0;
		int price_basket = 0;
		for (int i=0; i<prList.size();i++) {
			RentalDTO dto = rentalDao.selectProduct(prList.get(i));
			if (i == 0) {
				count_basket++;
				int price = Integer.parseInt(dto.getPrice());
				price_basket += price;
				name_basket = dto.getProduct_name();
				prNO_first = dto.getProduct_no();
			} else if (i == prList.size()-1) {				
				int price = Integer.parseInt(dto.getPrice());
				price_basket += price;
				name_basket += " 외 "+count_basket+"개";
			} else {
				count_basket++;
				int price = Integer.parseInt(dto.getPrice());
				price_basket += price;
			}
			list.add(dto);
		}
//		System.out.println(name_basket);
//		System.out.println(count_basket);
//		System.out.println(price_basket);
		
		model.addAttribute("prList", list);
		model.addAttribute("name_basket", name_basket);
		model.addAttribute("price_basket", price_basket);
		model.addAttribute("prNOFirst", prNO_first);		
	}
	
}
