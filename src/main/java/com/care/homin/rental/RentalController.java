package com.care.homin.rental;


import java.io.IOException;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.care.homin.rental.dto.orderDTO;
import com.care.homin.rental.service.RentalService;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CancelData;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;


@Controller
public class RentalController {
	@Autowired RentalService service;
	@Autowired HttpSession session;
	private IamportClient api;
	
	// 토큰 발급
	public RentalController() {
		this.api = new IamportClient("4550188229898136","d14634a7203799f7081d4658664899c7e241ecea4eda82144d32e27c1b36c50bd17fbe0c137cd0d4");
	}
	
	@ResponseBody
	@RequestMapping(value="/check/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException
	{	
			return api.paymentByImpUid(imp_uid);
	}
	@ResponseBody
	@RequestMapping(value="/orderDB")
	public void orderDB(@RequestBody Map<String,String> d,String prNo) {
		orderDTO dto = new orderDTO();
		dto.setUid(d.get("uid"));
		dto.setEmail(d.get("email"));
		dto.setAddr(d.get("addr"));
		dto.setPostcode(d.get("buyerpostcode"));
		dto.setName(d.get("buyername"));
		dto.setTell(d.get("tell"));
		dto.setAmount(d.get("amount"));
		dto.setProductName(d.get("name"));
		dto.setBuyer_id((String)session.getAttribute("id"));
		String productImg = service.selectProductImg(d.get("name"));
		dto.setProductImg(productImg);
		String category = service.selectClassification(d.get("name"));
		dto.setClassification(category);
		dto.setProduct_no(prNo);
		service.orderHistory(dto);
	}
	
	@RequestMapping(value = "/productOrder")
	public String productOrder(Model model, @RequestParam String prodNo) {
		String id = (String)session.getAttribute("id");
		service.info(model, id, prodNo);
		return "rental/productOrderForm";
	}
	@RequestMapping(value = "/order")
	public String order(Model model, @RequestParam String prodNo) {
		String id = (String)session.getAttribute("id");
		service.info(model, id, prodNo);
		return "rental/orderForm";
	}
	
	@ResponseBody
	@RequestMapping(value = "/cancle")
	public void testCancelPaymentAlreadyCancelledImpUid(@RequestBody String uid) {
		String uuid = uid.substring(0,uid.length()-1);
		String test_already_cancelled_imp_uid = uuid;
		CancelData cancel_data = new CancelData(test_already_cancelled_imp_uid, true); //imp_uid를 통한 전액취소
		service.cancleOrder(uuid);
		try {
			IamportResponse<Payment> payment_response = api.cancelPaymentByImpUid(cancel_data);
		} catch (IamportResponseException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "/orderfinish")
	public String orderFinish(Model model, String no, String prodNo) {
		service.selectOrderHistory(no, model);
		service.upOrderCount(prodNo);
		return "rental/orderfinishForm";
	}
}
