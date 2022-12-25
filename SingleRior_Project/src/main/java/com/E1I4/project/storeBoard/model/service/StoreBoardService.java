package com.E1I4.project.storeBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;


import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.ProductInquiry;
import com.E1I4.project.common.model.vo.WishList;
import com.E1I4.project.storeBoard.model.vo.Cart;
import com.E1I4.project.storeBoard.model.vo.StoreBoard;

public interface StoreBoardService {

	int getStoreListCount(int i);

	ArrayList<StoreBoard> selectStoreBoardList(PageInfo pi, int subCate);

	Attachment selectAttmList(int bNo);

	ArrayList<StoreBoard> selectProduct(int productNo);

	int wishListSelect(int bNo);

	int wishListOn(WishList wl); // 찜하기on

	int wishListOff(WishList wl, int bNo); // 찜하기 off
	
	int wishListCount(WishList wl);

	int insertCart(Cart cart);

	int insertInquiry(ProductInquiry productInquiry); // 상품문의

	int InquiryCount(ProductInquiry pi);

	ArrayList<ProductInquiry> selectInquiryList(int productNo); // 문의list

	














	




	

	

}
