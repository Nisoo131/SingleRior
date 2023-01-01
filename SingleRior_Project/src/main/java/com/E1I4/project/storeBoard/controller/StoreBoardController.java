package com.E1I4.project.storeBoard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.E1I4.project.common.model.vo.Cart;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.ProductInquiry;
import com.E1I4.project.common.model.vo.WishList;
import com.E1I4.project.member.model.vo.Member;
import com.E1I4.project.storeBoard.model.service.StoreBoardService;
import com.E1I4.project.storeBoard.model.vo.OrderItem;
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
	
	// subCate 리스트 
	@RequestMapping("categoryList.st")
	public String storeList(@RequestParam(value="page", required=false) Integer page, @RequestParam("subCate") int subCate, Model model) {
			
		    int currentPage = 1;
			if(page != null && page > 1) {
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
					
			} return "categoryList"; 
			
	}
   
	// 상품 상세보기
	@RequestMapping("productDetail.st")
	public String productDetail(@RequestParam("productNo") int productNo, @RequestParam("boardNo") int boardNo, HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
        //System.out.println(productNo);
        //System.out.println(boardNo);
		ArrayList<StoreBoard> pList = sService.selectProduct(productNo, boardNo);
		ArrayList<ProductInquiry> iList = sService.selectInquiryList(productNo);
		
		if(iList != null) {
		   model.addAttribute("iList", iList);
		} else {
			throw new BoardException("문의하기 조회 실패.");
		}
	    
		WishList wl = new WishList();
		ProductInquiry pi = new ProductInquiry();
	
		int result1 = 0;
		int result2 = 0;
		
		if(loginUser != null) {
			
			wl.setProductNo(productNo);
			wl.setMemberId(loginUser.getMemberId());
			
			pi.setMemberId(loginUser.getMemberId());
			pi.setProductNo(productNo);
	        	
			result1 = sService.wishListCount(wl);
			result2 = sService.InquiryCount(pi);
		}
		
		if(pList!= null) {
			model.addAttribute("pList", pList);
			model.addAttribute("count", result1);
			model.addAttribute("piCount", result2);
			
			return "productDetail";
			
		} else {
			throw new BoardException("제품 상세 조회 실패.");
		}

	}
	
	// 상품 찜하기
	@RequestMapping("wishListOn.st")
	public void wishListOn(@RequestParam("boardNo") int bNo, HttpSession session, Model model, HttpServletResponse response) {
		String id = ((Member)session.getAttribute("loginUser")).getMemberId();
		
		WishList wl = new WishList();
		wl.setBoardNo(bNo);
		wl.setMemberId(id);
		
		int result = sService.wishListOn(wl);
		
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
		
		WishList wl = new WishList();
		wl.setBoardNo(bNo);
		wl.setMemberId(id);
	
	    int result = sService.wishListOff(wl);
	
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
			                @RequestParam("quantity") int quantity, @RequestParam("productOption") String productOption, ModelAndView mv) {
		
		Cart cart = new Cart();
		cart.setProductNo(productNo);
		cart.setQuantity(quantity);
		cart.setMemberId(memberId);
		cart.setProductOption(productOption);
	
		// System.out.println(productOption);
	
		int result = sService.insertCart(cart);
		
		if(result != 0 && quantity !=0) { 
			mv.addObject("cart",cart);
			return "productDetail";
			
		} else {
			throw new BoardException("장바구니에 상품을 1개 이상 담아주세요.");
		}
	}
	
	// 상품 문의하기
	@RequestMapping("productInquiry.st")
	public String productInquiry(@RequestParam("productNo") int productNo, @RequestParam("boardNo") int boardNo, HttpSession session, @ModelAttribute ProductInquiry productInquiry, 
			Model model) {
	
       //System.out.println(boardNo);
		
	   String id = ((Member)session.getAttribute("loginUser")).getMemberId();
	   productInquiry.setMemberId(id);
	   
	   int result = sService.insertInquiry(productInquiry);
	   
	 
	   if(result >0) {
		   model.addAttribute("productNo", productNo);
		   model.addAttribute("boardNo", boardNo);
	   }
	   return "redirect:productDetail.st";
	
	}
	
	// 바로결제 & 장바구니 결제 주문서 
	@RequestMapping("payment.st")
	public String payment(HttpSession session, @ModelAttribute OrderItem orderList, Model model, @RequestParam(required=false) List<Integer> cartNo) {

		String id = ((Member)session.getAttribute("loginUser")).getMemberId();
		
        Member m = new Member();
        Member member = null;
        member = sService.getUserInfo(id);
        
        ArrayList<OrderItem> orderItem = new ArrayList<OrderItem>();
        
         if(cartNo != null) {
        	 while (cartNo.remove(new Integer(-1))) {}

        	
        	 for(int i : cartNo)
        	 {   
        		 
        	// img 가져오기
        	   orderList = sService.getCartInfo(i);   
               String boardNo = Integer.toString(orderList.getBoardNo());
//               System.out.println(boardNo);
               String imgRename = sService.getImgRename(boardNo);
//               System.out.print(imgRename);
               
               orderList.setImgRename(imgRename);
               
               orderItem.add(orderList);
                  
        	 }
         }
         else {
        	orderItem.add(orderList);
         }
         	//System.out.println(orderItem);
         	model.addAttribute("orderItem", orderItem);
 			model.addAttribute("member", member);
         return "payment";
	}
	
	
	// 결제정보 처리
	@RequestMapping("orderResult.st")
	public String orderResult(@RequestParam(value="recipient", required=false) String recipient,
						@RequestParam(value="recipient_phone", required=false) String recipient_phone,
						@RequestParam(value="address", required=false) String address,
						@RequestParam(value="address_detail", required=false) String address_detail,
						@RequestParam(value="deliveryMsg", required=false) String deliveryMsg,
						@RequestParam(value="memberName", required=false) String memberName,
						@RequestParam(value="email", required=false) String email,
						@RequestParam(value="buyer_phone", required=false) String buyer_phone,
						@RequestParam(value="Arr", required=false) List<Integer> pNoArr[],
						HttpSession session, Model model) {
		System.out.println(recipient);
		System.out.println(recipient_phone);
		System.out.println(address);
		System.out.println(address_detail);
		System.out.println(deliveryMsg);
		System.out.println(memberName);
		System.out.println(email);
		System.out.println(buyer_phone);
		System.out.println(pNoArr);
	
		return null;
	}
	
}
