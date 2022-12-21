package com.E1I4.project.storeBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;


import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.WishList;
import com.E1I4.project.storeBoard.model.vo.Cart;
import com.E1I4.project.storeBoard.model.vo.StoreBoard;

public interface StoreBoardService {

	int getStoreListCount(int i);

	ArrayList<StoreBoard> selectStoreBoardList(PageInfo pi, int subCate);

	Attachment selectAttmList(int bNo);

	ArrayList<StoreBoard> selectProduct(int productNo);

	WishList wishListSelect(WishList wl);

	int wishListOn(WishList wl, int bNo); // 찜하기on

	int wishListOff(WishList wl, int bNo); // 찜하기 off

	int insertCart(Cart cart);














	




	

	

}
