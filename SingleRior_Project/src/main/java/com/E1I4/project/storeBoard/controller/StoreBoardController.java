package com.E1I4.project.storeBoard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.E1I4.project.common.Pagination;
import com.E1I4.project.common.exception.BoardException;
import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.ProductInquiry;
import com.E1I4.project.common.model.vo.WishList;
import com.E1I4.project.member.model.vo.Member;
import com.E1I4.project.storeBoard.model.service.StoreBoardService;
import com.E1I4.project.storeBoard.model.vo.Cart;
import com.E1I4.project.storeBoard.model.vo.StoreBoard;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

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

				aList.add(a);
				
			};

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
	public String productDetail(@RequestParam("productNo") int productNo, HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");

		ArrayList<StoreBoard> pList = sService.selectProduct(productNo);
	    
		
		WishList wl = new WishList();
		ProductInquiry pi = new ProductInquiry();
		pi.setMemberId(loginUser.getMemberId());
		pi.setProductNo(productNo);
		//System.out.println(pi);
		
		int result1 = 0;
		int result2 = 0;
		if(loginUser != null) {
			
			wl.setProductNo(productNo);
			wl.setMemberId(loginUser.getMemberId());
	        	
			result1 = sService.wishListCount(wl);
			result2 = sService.InquiryCount(pi);
			
			//System.out.println(result2);
		}
		
		if(pList!= null) {
			model.addAttribute("pList", pList);
			model.addAttribute("count", result1);
			model.addAttribute("piCount", result2);
			
			return "productDetail";
		} else {
			throw new BoardException("게시글 조회 실패.");
		}

	}
	
	// 상품 찜하기
	@RequestMapping("wishListOn.st")
	public void wishListOn(@RequestParam("boardNo") int bNo, HttpSession session, Model model, HttpServletResponse response) {
		String id = ((Member)session.getAttribute("loginUser")).getMemberId();
		
	    //System.out.println(id); - ok
	    //System.out.println(bNo); - ok
		
		WishList wl = new WishList();
		wl.setBoardNo(bNo);
		wl.setMemberId(id);
		
		int result = sService.wishListOn(wl);
		int countResult = sService.wishListSelect(bNo);
		//System.out.println(countResult);
		
		response.setContentType("application/json; charset=UTF-8");
		
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();
		
		try {
			gson.toJson(result, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	// 찜하기 취소
	@RequestMapping("wishListOff.st")
	public void wishListOff(@RequestParam("boardNo") int bNo, HttpSession session, Model model, HttpServletResponse response) {
		String id = ((Member)session.getAttribute("loginUser")).getMemberId();
		
		System.out.println(id);
		
		WishList wl = new WishList();
		wl.setBoardNo(bNo);
		wl.setMemberId(id);
		
		System.out.println(wl);
	
	    int result = sService.wishListOff(wl, bNo);
	    
	    System.out.println(result);
		
		response.setContentType("application/json; charset=UTF-8");
		
		GsonBuilder gb = new GsonBuilder();
		Gson gson = gb.create();
		
		try {
			gson.toJson(result, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	// 장바구니
	@RequestMapping("cart.st")
	public String InsertCart(@RequestParam("memberId") String memberId, @RequestParam("productNo") int productNo,
			                @RequestParam("quantity") int quantity, @RequestParam("option") String option, ModelAndView mv) {
		
		Cart cart = new Cart();
		cart.setProductNo(productNo);
		cart.setQuantity(quantity);
		cart.setMemberId(memberId);
		cart.setOption(option);
		
		int result = sService.insertCart(cart);
		
	    // result가 0이 아니면 마이페이지-장바구니 
		if(result != 0) {
			mv.addObject("cart",cart);
			return "productDetail";
			
		} else {
			throw new BoardException("장바구니 추가 실패");
		}
	}
	
	// 상품 문의하기
	@RequestMapping("productInquiry.st")
	public String productInquiry(@RequestParam("productNo") int productNo, HttpSession session, @ModelAttribute ProductInquiry productInquiry, 
			ModelAndView mv ) {
		
		
	   String id = ((Member)session.getAttribute("loginUser")).getMemberId();
	   productInquiry.setMemberId(id);
	   
	   System.out.println(productInquiry);
	   
	   int result = sService.insertInquiry(productInquiry);
	  
	   return "redirect:productDetail";
	
	}
	
	// 결제
	@RequestMapping("payment.st")
	public String payment() {
		return "payment";
	}
	
	
}
