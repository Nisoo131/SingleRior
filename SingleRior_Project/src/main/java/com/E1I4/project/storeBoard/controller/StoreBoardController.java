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
	
	// subCate에 따른 리스트 가져오기 
	@RequestMapping("categoryList.st")
	public String storeList(@RequestParam(value="page", required=false) Integer page, 
			                @RequestParam("subCate") int subCate, Model model) {
			int currentPage = 1;
			if(page != null) {
				currentPage = page; 
			}
	
			int listCount = sService.getStoreListCount(1); //board type 스토어 1인 것만 가져오기
	
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 12); //boardLimit: 카드 12개
			
			ArrayList<StoreBoard> sList = sService.selectStoreBoardList(pi, subCate);
			
			ArrayList<Attachment> aList = new ArrayList<Attachment>();
		    
			for(int i=0; i<sList.size(); i++) {
				int bNo = sList.get(i).getBoardNo();
				Attachment a = sService.selectAttmList(bNo);
//				System.out.println(a);
				aList.add(a);
				
			};
			//System.out.println(aList);
//			System.out.println(sList);
			if(sList != null) {
				model.addAttribute("pi", pi);
				model.addAttribute("sList", sList);
				model.addAttribute("aList", aList);
				model.addAttribute("subCate", subCate);
				
				return "categoryList";
			} else {
				throw new BoardException("게시글 조회 실패");
			}
	}
   
	// 상품 상세보기
	@RequestMapping("productDetail.st")
	public String productDetail(@RequestParam("productNo") int productNo,  Model model) {
		
		//System.out.println(productNo);
		ArrayList<StoreBoard> pList = sService.selectProduct(productNo);
		ArrayList<Attachment> aList = sService.selectProductAttmList(productNo);
		
		System.out.println(pList);
		model.addAttribute("pList",pList);
		return "productDetail";
	}
	
	// 결제
	@RequestMapping("payment.st")
	public String payment() {
		return "payment";
	}
	
	
}
