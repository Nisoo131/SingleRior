package com.E1I4.project.commuBoard.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.E1I4.project.commuBoard.model.vo.CommuBoard;

@Repository("cDAO")
public class CommuBoardDAO {

	public int insertCommuBoard(SqlSessionTemplate sqlSession, CommuBoard b) {
		return sqlSession.insert("commuMapper.insertCommuBoard", b);
	}

}
