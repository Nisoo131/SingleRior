package com.E1I4.project.commuBoard.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.commuBoard.model.dao.CommuBoardDAO;
import com.E1I4.project.commuBoard.model.vo.CommuBoard;


@Service("cService")
public class CommuBoardServiceImpl implements CommuBoardService{
	
	@Autowired
	private CommuBoardDAO cDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getCommuListCount(int i) {
		return cDAO.getCommuListCount(sqlSession, i);
	}
	
	@Override
	public ArrayList<CommuBoard> selectCommuAllList(PageInfo pi, int i) {
		return cDAO.selectCommuAllList(sqlSession, pi, i);
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
	public ArrayList<Attachment> selectAttmList(Integer bNo) {
		return cDAO.selectAttmList(sqlSession, bNo);
	}

}
