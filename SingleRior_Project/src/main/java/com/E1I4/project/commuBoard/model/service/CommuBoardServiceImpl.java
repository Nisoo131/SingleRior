package com.E1I4.project.commuBoard.model.service;

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
import com.E1I4.project.commuBoard.model.dao.CommuBoardDAO;
import com.E1I4.project.commuBoard.model.vo.CommuBoard;


@Service("cService")
public class CommuBoardServiceImpl implements CommuBoardService{
	
	@Autowired
	private CommuBoardDAO cDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getCommuListCount(HashMap<String, Object> map) {
		return cDAO.getCommuListCount(sqlSession, map);
	}
	
	@Override
	public ArrayList<CommuBoard> selectCommuAllList(PageInfo pi, HashMap<String, Object> map) {
		return cDAO.selectCommuAllList(sqlSession, pi, map);
	}
	
	@Override
	public int insertCommuBoard(CommuBoard coBoard) {
		return cDAO.insertCommuBoard(sqlSession, coBoard);
	}

	@Override
	public int insertAttm(HashMap<String, Object> map) {
		return cDAO.insertAttm(sqlSession, map);
	}

	@Override
	public CommuBoard selectCommuBoard(int bNo, boolean yn) {
		int result = 0;
		if(yn) {
			result = cDAO.addCount(sqlSession, bNo);
		}
		
		CommuBoard coBoard = cDAO.selectCommuBoard(sqlSession, bNo);
		return coBoard;
	}

	@Override
	public ArrayList<Attachment> selectAttmBoard(String bNo) {
		return cDAO.selectAttmBoard(sqlSession, bNo);
	}

	@Override
	public ArrayList<Reply> selectReply(int bNo) {
		return cDAO.selectReply(sqlSession, bNo);
	}

	@Override
	public ArrayList<ReReply> selectReReply(int bNo) {
		return cDAO.selectReReply(sqlSession, bNo);
	}

	@Override
	public int insertReply(Reply r) {
		return cDAO.insertReply(sqlSession, r);
	}

	@Override
	public int symptOn(WishList wl, int bNo) {
		cDAO.addSymptCount(sqlSession, bNo);
		return cDAO.symptOn(sqlSession, wl);
	}

	@Override
	public WishList selectSymptOn(WishList wl) {
		return cDAO.selectSymptOn(sqlSession, wl);
	}

	@Override
	public int symptOff(WishList wl, int bNo) {
		cDAO.deleteSymptCount(sqlSession, bNo);
		return cDAO.symptOff(sqlSession, wl);
	}

	@Override
	public ArrayList<CommuBoard> replyCount(HashMap<String, Object> map) {
		return cDAO.replyCount(sqlSession, map);
	}

	@Override
	public int deleteAttm(ArrayList<String> delRename) {
		return cDAO.deleteAttm(sqlSession, delRename);
	}

	@Override
	public int updateCommuBoard(CommuBoard coBoard) {
		return cDAO.updateCommuBoard(sqlSession, coBoard);
	}

	@Override
	public void updateAttmLevel(int boardNo) {
		cDAO.updateAttmLevel(sqlSession, boardNo);
	}

}
