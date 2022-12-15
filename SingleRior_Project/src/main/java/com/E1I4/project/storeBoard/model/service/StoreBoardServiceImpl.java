package com.E1I4.project.storeBoard.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
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
	public ArrayList<StoreBoard> selectStoreBoardList(PageInfo pi, int i) {
		return sDAO.selectStoreBoardList(sqlSession, pi, i);
	}

	@Override
	public ArrayList<Attachment> selectAttmList() {
		return sDAO.selectAttmList(sqlSession);
	}
}
