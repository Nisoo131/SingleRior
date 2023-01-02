package com.E1I4.project.storeBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository("sDAO")
public class StoreBoardDAO {

	public int getStoreListCount(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.selectOne("storeMapper.getStoreListCount", map);
	}
	
	public ArrayList<StoreBoard> selectStoreBoardList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Integer> map) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeMapper.selectStoreBoardList", map, rowBounds);
		
	}

	public Attachment selectAttmList(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("storeMapper.selectAttmList",bNo);
	}

	public ArrayList<StoreBoard> selectProduct(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("storeMapper.selectProduct", productNo);
	}

	// 찜하기 ON
	public int wishListOn(SqlSessionTemplate sqlSession, WishList wl) {
		return sqlSession.insert("storeMapper.wishListOn", wl);
	}
	
	
	public WishList selectWishCount(SqlSessionTemplate sqlSession, WishList wl) {
		return sqlSession.selectOne("storeMapper.selectwishListOn", wl);
	}

	// 찜하기 OFF
	public int wishListOff(SqlSessionTemplate sqlSession, WishList wl) {
		return sqlSession.delete("storeMapper.wishListOff", wl);
	}
	
	// 찜하기 COUNT
	public int wishListCount(SqlSessionTemplate sqlSession, WishList wl) {
		return sqlSession.selectOne("storeMapper.wishListCount", wl);
	}

	public int insertCart(SqlSessionTemplate sqlSession, Cart cart) {
		return sqlSession.insert("storeMapper.insertCart", cart);
	}

	public int insertInquiry(SqlSessionTemplate sqlSession, ProductInquiry productInquiry) {
		return sqlSession.insert("storeMapper.insertInquiry", productInquiry );
	}

	public int InquiryCount(SqlSessionTemplate sqlSession, ProductInquiry pi) {
		return sqlSession.selectOne("storeMapper.InquiryCount", pi);
	}

	public ArrayList<ProductInquiry> selectInquiryList(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("storeMapper.selectInquiryList", productNo);
	}

	public Member getUserInfo(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("storeMapper.getUserInfo", id);
	}

	public OrderItem getCartInfo(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("storeMapper.getCartInfo", i);
	}

	public String getImgRename(SqlSessionTemplate sqlSession, String boardNo) {
		return sqlSession.selectOne("storeMapper.getImgRename", boardNo);
	}

	public int addCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("storeMapper.addCount", boardNo);
	}

	public int InsertOrderProduct(SqlSessionTemplate sqlSession, OrderResult r) {		
		return sqlSession.insert("storeMapper.InsertOrderProduct", r);
	}

	public ArrayList<Cart> selectCartInfo(SqlSessionTemplate sqlSession, int i) {
		return (ArrayList)sqlSession.selectList("storeMapper.selectCartInfo", i);
	}

	public int getMoreInquiryCount(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("storeMapper.getMoreInquiryCount", productNo);
	}


	public ArrayList<ProductInquiry> selectMoreInquiryList(SqlSessionTemplate sqlSession, int productNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("storeMapper.selectMoreInquiryList", productNo, rowBounds);
		

	public ArrayList<ProductReview> selectReviewList(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("storeMapper.selectReviewList",productNo);

	}




	




	


	




	

	
	
	
}
