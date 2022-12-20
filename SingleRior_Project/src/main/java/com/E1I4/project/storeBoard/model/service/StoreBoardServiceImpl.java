package com.E1I4.project.storeBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.Product;
import com.E1I4.project.storeBoard.model.dao.StoreBoardDAO;
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
	public Product selectOptionList(int productNo) {
		return sDAO.selectOptionList(sqlSession,productNo);
	}

	

	


	
	
}
