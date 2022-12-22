package com.E1I4.project.storeBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.WishList;
import com.E1I4.project.member.model.vo.Member;
import com.E1I4.project.storeBoard.model.dao.StoreBoardDAO;
import com.E1I4.project.storeBoard.model.vo.Cart;
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
	public WishList wishListSelect(WishList wl) {
		return sDAO.wishListSelect(sqlSession,wl);
	}

	@Override
	public int wishListOn(WishList wl, int bNo) {
		return sDAO.wishListOn(sqlSession,wl);
	}

	@Override
	public int wishListOff(WishList wl, int bNo) {
		return sDAO.wishListOff(sqlSession, wl);
	}

	@Override
	public int insertCart(Cart cart) {
		return sDAO.insertCart(sqlSession, cart);
	}

	

	



	
	
	
	

	


	
	
}
