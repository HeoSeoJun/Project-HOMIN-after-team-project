package com.care.homin.basket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.homin.basket.dto.BasketDTO;
import com.care.homin.basket.service.IBasketService;
import com.care.homin.config.PagingConfig;
import com.care.homin.rental.dto.RentalDTO;
import com.care.homin.rental.dto.orderDTO;
import com.care.homin.rental.service.RentalService;

@Controller
public class BasketController {
	private static final Logger logger = LoggerFactory.getLogger(BasketController.class);
	
	@Autowired IBasketService basketSvc;
	
	@RequestMapping("/myBasket")
	public String basket(Model model, HttpSession session, PagingConfig paging, String presentPage) {
//		logger.warn("session.getAttribute(\"id\") : "+session.getAttribute("id"));
		String id = (String)session.getAttribute("id");
		ArrayList<BasketDTO> basket = basketSvc.getBasket(id);
		paging.setTotalNums(basket.size());
		paging.setPresentPage(presentPage);
		paging.setStartNum();
//		logger.warn("basket : " + basket);
		if (basket.size() == 0) {
			model.addAttribute("msg", "장바구니가 비었습니다");
		} else {
			model.addAttribute("basket", basket);
			model.addAttribute("paging", paging);
		}
		
		return "basket/basketForm";
	}
	
	@RequestMapping("/basketOrder")
	public String basketOrder(Model model,HttpSession session, @RequestParam List<String> prNo) {
//		System.out.println("== 서버 출력 ==");
//		for (String s : prNo)
//			System.out.println(s);
		
		String id = (String) session.getAttribute("id");
		basketSvc.basketOrderForm(model, id, prNo);
		return "basket/basketOrderForm";
	}
	
	@RequestMapping("basketOrderProc")
	public String order(Model model, HttpSession session, String prNo) {
		String id = (String) session.getAttribute("id");
//		System.out.println("prNo: "+prNo);
		
		String[] arrPrNo = prNo.split(", ");
//		System.out.println("arrPrNo: "+arrPrNo);
//		for (String s: arrF) System.out.println(s);
		List<String> prList = new ArrayList<String>();
		if (arrPrNo.length == 1) {
			prList.add(arrPrNo[0].substring(2,arrPrNo[0].length()-2));
		} else {
			for (int i=0; i < arrPrNo.length; i++) {
				if (i == 0) {
//				System.out.println(arrPrNo[i].substring(2));
					prList.add(arrPrNo[i].substring(2));
				}else if (i == arrPrNo.length-1) { 
//				System.out.println(arrPrNo[i].substring(0, arrPrNo[i].length()-2));
					prList.add(arrPrNo[i].substring(0, arrPrNo[i].length()-2));
				}
				else {
//				System.out.println(arrPrNo[i]);
					prList.add(arrPrNo[i]);
				}
			}	
		}
		basketSvc.basketOrderProc(model,id,prList);
		
		return "forward:/index?formpath=basketOrderFrom";
	}
	
	@RequestMapping("basketOrderFrom")
	public String basketOrderProc() {
		return "basket/basketOrderProc";
	}
	
	@ResponseBody
	@RequestMapping("basketProduct")
	public HashMap<String, String> basketProduct(@RequestBody HashMap<String, String> map, HttpSession session){
//		logger.warn(map.get("no"));
		String no = map.get("noTemp");
		String id = (String) session.getAttribute("id");
		
		String msg = basketSvc.basketProduct(no, id);
		map.put("msg", msg);
//		HashMap<String, BasketDTO> mapRes = new HashMap<String, BasketDTO>();
		return map;
	}
	
	@Autowired RentalService service;
	@ResponseBody
	@RequestMapping("basketOrderDB")
	public void basketOrderDB(@RequestBody HashMap<String, String> d, String prodNo) {
//		System.out.println("d.get(\"name\"): "+d.get("name"));
//		System.out.println("prodNo: "+prodNo);
		orderDTO dto = new orderDTO();
		dto.setUid(d.get("uid"));
		dto.setEmail(d.get("email"));
		dto.setName(d.get("buyername"));
		dto.setTell(d.get("tell"));
		dto.setAddr(d.get("addr"));
		dto.setPostcode(d.get("buyerpostcode"));
		dto.setAmount(d.get("amount"));
		dto.setProductName(d.get("name"));
		dto.setBuyer_id((String)session.getAttribute("id"));
		
		String productImg = service.getProductImg(prodNo);
		dto.setProductImg(productImg);
		
		String category = service.getClassification(prodNo);
		dto.setClassification(category);
		
		dto.setProduct_no(prodNo+" 외");
		service.orderHistory(dto);
	}
	
	@RequestMapping("/basketOrderfinish")
	public String basketOrderfinish(Model model, String no, String prodNo) {
//		System.out.println("no: "+no);
//		System.out.println("prodNo: "+prodNo);
		service.selectOrderHistory(no, model, prodNo);
		service.upOrderCount(prodNo);
		return "rental/orderfinishForm";
	}
	
	@Autowired HttpSession session;
	@RequestMapping("deleteBasket")
	public String deleteBasket(String no, Model model) {
//		logger.warn(no);
		String id = (String) session.getAttribute("id");
		boolean done = basketSvc.deleteBasket(no, id);
		if (done == false)
			model.addAttribute("msg", "장바구니 삭제오류 발생");
		return "redirect:index?formpath=mypage&category=myBasket";
	}
	
	
}
