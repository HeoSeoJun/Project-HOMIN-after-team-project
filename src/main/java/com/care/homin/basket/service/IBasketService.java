package com.care.homin.basket.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.care.homin.basket.dto.BasketDTO;

public interface IBasketService {

	String basketProduct(String no, String id);

	ArrayList<BasketDTO> getBasket(String attribute);

	BasketDTO isExisted(String no, String id);

	boolean deleteBasket(String no, String id);

	void basketOrderForm(Model model, String id, List<String> prNo);

	void basketOrderProc(Model model, String id, List<String> prList);

}
