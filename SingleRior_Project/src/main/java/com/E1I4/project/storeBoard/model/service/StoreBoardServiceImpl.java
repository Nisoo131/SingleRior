package com.E1I4.project.storeBoard.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.Cart;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.ProductInquiry;
import com.E1I4.project.common.model.vo.WishList;
import com.E1I4.project.member.model.vo.Member;
import com.E1I4.project.storeBoard.model.dao.StoreBoardDAO;
import com.E1I4.project.storeBoard.model.vo.OrderItem;
import com.E1I4.project.storeBoard.model.vo.StoreBoard;

@Service("sService")
public class StoreBoardServiceImpl implements StoreBoardService{
	@Autowired
	private StoreBoardDAO sDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	

	@Override
	public int getStoreListCount(int i) {
		return sDAO.getStoreListCount(sqlSession, i);
	}

	@Override
	public ArrayList<StoreBoard> selectStoreBoardList(PageInfo pi, int subCate) {
		return sDAO.selectStoreBoardList(sqlSession, pi, subCate);
	}

	@Override
	public Attachment selectAttmList(int bNo) {
		return sDAO.selectAttmList(sqlSession,bNo);
	}

	@Override
	public ArrayList<StoreBoard> selectProduct(int productNo) {
		return sDAO.selectProduct(sqlSession,productNo);
	}

	@Override
	public int wishListOn(WishList wl) {
		return sDAO.wishListOn(sqlSession, wl);
	}

	@Override
	public int wishListOff(WishList wl) {
		return sDAO.wishListOff(sqlSession, wl);
	}

	@Override
	public int wishListCount(WishList wl) {
		return sDAO.wishListCount(sqlSession, wl);
	}

	@Override
	public int insertCart(Cart cart) {
		return sDAO.insertCart(sqlSession, cart);
	}

	@Override
	public int insertInquiry(ProductInquiry productInquiry) {
		return sDAO.insertInquiry(sqlSession, productInquiry);
	}

	@Override
	public int InquiryCount(ProductInquiry pi) {
		return sDAO.InquiryCount(sqlSession, pi);
	}

	@Override
	public ArrayList<ProductInquiry> selectInquiryList(int productNo) {
		return sDAO.selectInquiryList(sqlSession, productNo);
	}

	@Override
	public Member getUserInfo(String id) {
		return sDAO.getUserInfo(sqlSession, id);
	}



	


	

	



	
	
	
	

	


	
	
}
