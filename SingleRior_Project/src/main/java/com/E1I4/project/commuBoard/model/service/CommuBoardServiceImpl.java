package com.E1I4.project.commuBoard.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E1I4.project.commuBoard.model.dao.CommuBoardDAO;
import com.E1I4.project.commuBoard.model.vo.CommuBoard;


@Service("cService")
public class CommuBoardServiceImpl implements CommuBoardService{
	
	@Autowired
	private CommuBoardDAO cDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertCommuBoard(CommuBoard b) {
		return cDAO.insertCommuBoard(sqlSession, b);
	}

}
