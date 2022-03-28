package com.care.homin.basket.service;

import java.util.ArrayList;

import com.care.homin.basket.dto.BasketDTO;

public interface IBasketService {

	String basketProduct(String no, String id);

	ArrayList<BasketDTO> getBasket(String attribute);

	BasketDTO isExisted(String no, String id);

	boolean deleteBasket(String no, String id);

}
