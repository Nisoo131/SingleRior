package com.E1I4.project.storeBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.Cart;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.ProductInquiry;
import com.E1I4.project.common.model.vo.WishList;
import com.E1I4.project.member.model.vo.Member;
import com.E1I4.project.storeBoard.model.vo.OrderItem;
import com.E1I4.project.storeBoard.model.vo.OrderResult;
import com.E1I4.project.storeBoard.model.vo.ProductReview;
import com.E1I4.project.storeBoard.model.vo.StoreBoard;

public interface StoreBoardService {

	int getStoreListCount(HashMap<String, Integer> map);

	ArrayList<StoreBoard> selectStoreBoardList(PageInfo pi, HashMap<String, Integer> map);

	Attachment selectAttmList(int bNo);

	ArrayList<StoreBoard> selectProduct(int productNo, int boardNo);

	int wishListOn(WishList wl);

	int wishListOff(WishList wl);
	
	int wishListCount(WishList wl);

	int insertCart(Cart cart);

	int insertInquiry(ProductInquiry productInquiry); 

	int InquiryCount(ProductInquiry pi);

	ArrayList<ProductInquiry> selectInquiryList(int productNo);

	Member getUserInfo(String id);

	OrderItem getCartInfo(int i);

	String getImgRename(String boardNo);

	int InsertOrderProduct(OrderResult r);

	ArrayList<Cart> selectCartInfo(int i);

	int getMoreInquiryCount(int productNo);

	ArrayList<ProductReview> selectReviewList(int productNo);

	





	














	




	

	

}
