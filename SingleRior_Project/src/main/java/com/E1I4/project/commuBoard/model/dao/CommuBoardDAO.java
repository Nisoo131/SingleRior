package com.E1I4.project.commuBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.commuBoard.model.vo.CommuBoard;

@Repository("cDAO")
public class CommuBoardDAO {
	
	public int getCommuListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("commuMapper.getCommuListCount", i);
	}
	
	public ArrayList<CommuBoard> selectCommuAllList(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("commuMapper.selectCommuAllList", i, rowBounds);
	}

	public int insertCommuBoard(SqlSessionTemplate sqlSession, CommuBoard coBoard) {
		return sqlSession.insert("commuMapper.insertCommuBoard", coBoard);
	}

	public int insertAttm(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("commuMapper.insertAttm", map);
	}

	public int addCount(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("commuMapper.addCount", bNo);
	}

	public CommuBoard selectCommuBoard(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("commuMapper.selectCommuBoard", bNo);
	}

	public ArrayList<Attachment> selectAttmList(SqlSessionTemplate sqlSession, Integer bNo) {
		return (ArrayList)sqlSession.selectList("commuMapper.selectAttmList", bNo);
	}

}
