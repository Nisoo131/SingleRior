package com.E1I4.project.marketBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.ReReply;
import com.E1I4.project.common.model.vo.Reply;
import com.E1I4.project.common.model.vo.WishList;
import com.E1I4.project.marketBoard.model.dao.MarketBoardDAO;
import com.E1I4.project.marketBoard.model.vo.MarketBoard;



@Service("mkService")
public class MarketBoardServiceImpl implements MarketBoardService{
	
	@Autowired
	private MarketBoardDAO mkDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int marketBoardInsert(MarketBoard mkBoard) {
		return mkDAO.marketBoardInsert(sqlSession, mkBoard);
	}

	@Override
	public int insertAttm(HashMap<String, Object> map) {
		return mkDAO.insertAttm(sqlSession, map);
	}

	@Override
	public int getMkListCount(HashMap<String, Object> map) {
		return mkDAO.getMkListCount(sqlSession, map);
	}

	@Override
	public ArrayList<MarketBoard> marketBoardList(PageInfo pi, HashMap<String, Object> map) {
		return mkDAO.marketBoardList(sqlSession, pi, map);
	}

	@Override
	public ArrayList<Attachment> attmListSelect() {
		return mkDAO.attmListSelect(sqlSession);
	}

	@Override
	public WishList wishListSelect(WishList wl) {
		return mkDAO.wishListSelect(sqlSession,wl);
	}
	
	@Override
	public MarketBoard marketBoardSelect(int bNo, boolean yn) {
		if(yn) {
			mkDAO.marketBoardCount(sqlSession, bNo);
		};
		
		return mkDAO.marketBoardSelect(sqlSession, bNo);
	}

	@Override
	public ArrayList<Attachment> selectAttm(int bNo) {
		return mkDAO.selectAttm(sqlSession, bNo);
	}

	@Override
	public ArrayList<Reply> replySelect(int bNo) {
		return mkDAO.replySelect(sqlSession, bNo);
	}

	@Override
	public ArrayList<ReReply> reReplySelect(int bNo) {
		return mkDAO.reReplySelect(sqlSession, bNo);
	}

	@Override
	public ArrayList<MarketBoard> marketTopList(HashMap<String, Object> map) {
		return mkDAO.marketTopList(sqlSession, map);
	}

	@Override
	public ArrayList<Attachment> topAttmListSelect() {
		return mkDAO.topAttmListSelect(sqlSession);
	}

	
	
}
