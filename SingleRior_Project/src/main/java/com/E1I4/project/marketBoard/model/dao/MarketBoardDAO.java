package com.E1I4.project.marketBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.marketBoard.model.vo.MarketBoard;

@Repository("mkDAO")
public class MarketBoardDAO {

	public int getMkListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("marketMapper.getMkListCount",map);
	}

	public ArrayList<MarketBoard> marketBoardList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("marketMapper.marketBoardList", map, rowBounds);
	}

	public ArrayList<Attachment> attmListSelect(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("marketMapper.attmListSelect");
	}

	public int marketBoardInsert(SqlSessionTemplate sqlSession, MarketBoard mkBoard) {
		return sqlSession.insert("marketMapper.marketBoardInsert", mkBoard);
	}

	public int insertAttm(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.insert("marketMapper.insertAttm", map);
	}

}
