package com.care.homin.config;

import org.springframework.context.annotation.Configuration;

@Configuration
public class PagingConfig {
//	총 수, 페이지 당 수, 총 페이지, 현 페이지, 페이지 별 시작번호
	int totalNums; // 총 수
	int numPerPage; // 페이지 당 수
	int totalPages; // 총 페이지 수
	int presentPage; // 현 페이지
	int startNum; // 페이지 별 시작번호
	
	public PagingConfig() {
		setNumPerPage(2);
	}
	
	public void setTotalNums(int totalNums) {
		this.totalNums = totalNums;
		setTotalPages(totalNums);
	}
	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}
	public void setTotalPages(int totalNums) {
		if (totalNums > 0) {
			if (totalNums % numPerPage == 0)
				this.totalPages = totalNums / numPerPage;
			else
				this.totalPages = (int) Math.ceil((double) totalNums / numPerPage) ;
		}
	}
	public void setPresentPage(String presentPage) {
		if (presentPage == "" || presentPage == null)
			this.presentPage = 1;
		else 
			this.presentPage = Integer.parseInt(presentPage);
	}
	public void setStartNum() {
		this.startNum = (presentPage - 1) * numPerPage;
	}
	
	public int getTotalNums() {
		return totalNums;
	}
	public int getNumPerPage() {
		return numPerPage;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public int getPresentPage() {
		return presentPage;
	}
	public int getStartNum() {
		return startNum;
	}
		
}
