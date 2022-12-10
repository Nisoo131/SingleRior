package com.E1I4.project.storeBoard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StoreBoardController {

	// 스토어 클릭시 메인페이지
	@RequestMapping("storeList.st")
	public String storeList() {
		return "storeList";
	}
	
	// 대분류-소분류 카테고리 선택시
	@RequestMapping("categoryList.st")
	public String categoryList() {
		return "categoryList";
	}
	
	// 썸네일 클릭시
	@RequestMapping("productDetail.st")
	public String productDetail() {
		return "productDetail";
	}
	
}
