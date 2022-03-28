package com.care.homin.rental.service;

import java.io.File;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.homin.membership.dao.IMemberDAO;
import com.care.homin.rental.dao.RentalDAO;
import com.care.homin.rental.dto.RentalDTO;
import com.care.homin.rental.dto.orderDTO;

@Service
public class RentalService {
	@Autowired RentalDAO dao;
	
	
	public ArrayList<RentalDTO> selectCategory(String category) {
		return dao.selectCategory(category);
	}

	public RentalDTO selectProduct(String prodNo) {
		dao.productUpHit(prodNo);
		return dao.selectProduct(prodNo);
	}
	
	@Autowired IMemberDAO mDao;
	public void info(Model model, String id, String prodNo) {
		model.addAttribute("productInfo",dao.selectProduct(prodNo));
		model.addAttribute("memberInfo",mDao.memberProc(id));
		model.addAttribute("memberPostcode",mDao.selectPost(id));
	}
	
	public String selectProductImg(String productName){
		return dao.selectProductImg(productName);
	}

	public void orderHistory(orderDTO dto) {
		dao.orderHistoryProc(dto);
	}

	public void selectOrderHistory(String no, Model model) {
		orderDTO dto = dao.selectOrderHistory(no);
		model.addAttribute("orderHistory",dto);
		model.addAttribute("productImg",dao.selectProductImg(dto.getProductName()));
		model.addAttribute("classification", dao.selectClassification(dto.getProductName()));
	}
	public String selectClassification(String productName) {
		return dao.selectClassification(productName);
	}

	public ArrayList<RentalDTO> selectTopViews() {
		return dao.selectTopViews();
	}

	public void upOrderCount(String no) {
		dao.upOrderCount(no);
	}

	public ArrayList<RentalDTO> selectOrderCount() {
		return dao.selectOrderCount();
	}

	public void cancleOrder(String uid) {
		dao.cancleOrder(uid);
	}

	public void deleteProduct(String no) {
		RentalDTO dto = dao.selectProduct(no);
		String fileName = dao.selectProductImg(dto.getProduct_name());
		File deleteFile = new File("/homin/resources/image/"+dto.getClassification()+"/"+fileName);
		deleteFile.delete();
		
		dao.deleteProduct(no);
		
	}
}
