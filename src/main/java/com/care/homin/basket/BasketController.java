package com.care.homin.basket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.homin.basket.dto.BasketDTO;
import com.care.homin.basket.service.IBasketService;
import com.care.homin.rental.service.RentalService;

@Controller
public class BasketController {
	private static final Logger logger = LoggerFactory.getLogger(BasketController.class);
	
	@Autowired IBasketService basketSvc;
	
	@RequestMapping("/basket")
	public String basket(Model model, HttpSession session) {
//		logger.warn("session.getAttribute(\"id\") : "+session.getAttribute("id"));
		String id = (String)session.getAttribute("id");
		ArrayList<BasketDTO> basket = basketSvc.getBasket(id);
//		logger.warn("basket : " + basket);
		if (basket.size() == 0) {
			model.addAttribute("msg", "장바구니가 비었습니다");
		} else {
			model.addAttribute("basket", basket);
		}
		
		return "basket/basketForm";
	}
	@RequestMapping("/basketOrder")
	public String basketOrder(Model model, @RequestParam List<String> prNo) {
		
		return "basket/basketOrderForm";
	}
	
	@ResponseBody
	@RequestMapping("basketProduct")
	public HashMap<String, String> basketProduct(@RequestBody HashMap<String, String> map, HttpSession session){
//		logger.warn(map.get("no"));
		String no = map.get("noTemp");
		String id = (String) session.getAttribute("id");
//		logger.warn("ctl no_ : " + no_);
		
		String msg = basketSvc.basketProduct(no, id);
		map.put("msg", msg);
//		HashMap<String, BasketDTO> mapRes = new HashMap<String, BasketDTO>();
		return map;
	}
	
	@Autowired HttpSession session;
	@RequestMapping("deleteBasket")
	public String deleteBasket(String no, Model model) {
//		logger.warn(no);
		String id = (String) session.getAttribute("id");
		boolean done = basketSvc.deleteBasket(no, id);
		if (done == false)
			model.addAttribute("msg", "장바구니 삭제오류 발생");
		return "forward:index?formpath=basket";
	}
	
	
}
