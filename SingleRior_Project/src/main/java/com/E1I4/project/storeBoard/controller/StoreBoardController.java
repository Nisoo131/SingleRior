package com.E1I4.project.storeBoard.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.E1I4.project.common.Pagination;
import com.E1I4.project.common.exception.BoardException;
import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.storeBoard.model.service.StoreBoardService;
import com.E1I4.project.storeBoard.model.vo.StoreBoard;

@Controller
public class StoreBoardController {
	
	@Autowired
	private StoreBoardService sService;
	
	// 스토어 메인페이지
		@RequestMapping("storeList.st")
		public String storeList() {
			return "storeList";
		}
	
	// 리스트 
	@RequestMapping("categoryList.st")
	public String storeList(@RequestParam(value="page", required=false) Integer page, Model model) {
			int currentPage = 1;
			if(page != null) {
				currentPage = page;
			}
			//board type 스토어 1인 것만 가져오기
			int listCount = sService.getStoreListCount(1);
			
			//boardLimit: 카드 12개
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 12);
			ArrayList<StoreBoard> sList = sService.selectStoreBoardList(pi, 1); // board_type:1(스토어)
			ArrayList<Attachment> aList = sService.selectAttmList();
			System.out.println();
			if(sList != null) {
				model.addAttribute("pi", pi);
				model.addAttribute("sList", sList);
				model.addAttribute("aList", aList);
			
				
				return "categoryList";
			} else {
				throw new BoardException("게시글 조회 실패");
			}
		}
   
	// 상품 상세보기
	@RequestMapping("productDetail.st")
	public String productDetail(@RequestParam("bNo") int bNo, Model model) {
		
		String strBNo = Integer.toString(bNo);
		
		ArrayList<StoreBoard> pList = sService.selectProduct(strBNo);
		ArrayList<Attachment> list = sService.selectImg(strBNo);
		
//		System.out.println(pList);
//		System.out.println(list);
		
		model.addAttribute("pList", pList);
		model.addAttribute("list", list);
		
		return "productDetail";
	}
	
	// 결제
	@RequestMapping("payment.st")
	public String payment() {
		return "payment";
	}
	
	
}
