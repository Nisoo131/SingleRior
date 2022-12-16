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
	public ArrayList<Attachment> selectAttm(String strBNo) {
		return mkDAO.selectAttm(sqlSession, strBNo);
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
	public ArrayList<MarketBoard> marketTopList(int matketType) {
		return mkDAO.marketTopList(sqlSession, matketType);
	}

	@Override
	public ArrayList<Attachment> topAttmListSelect(int matketType) {
		return mkDAO.topAttmListSelect(sqlSession, matketType);
	}

	@Override
	public int replyInsert(Reply reply) {
		return mkDAO.replyInsert(sqlSession, reply);
	}

	@Override
	public int marketLike(WishList wl) {
		return mkDAO.marketLike(sqlSession, wl);
	}

	@Override
	public int marketLikeCancle(WishList wl) {
		return mkDAO.marketLikeCancle(sqlSession, wl);
	}

	@Override
	public int reReplyInsert(ReReply reReply) {
		return mkDAO.reReplyInsert(sqlSession, reReply);
	}

	@Override
	public int marketBoardDelete(int bNo) {
		return mkDAO.marketBoardDelete(sqlSession, bNo);
	}

	@Override
	public int deleteAttm(String strBNo) {
		return mkDAO.deleteAttm(sqlSession, strBNo);
	}

	
	
}
