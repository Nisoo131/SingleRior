package com.E1I4.project.storeBoard.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.storeBoard.model.vo.StoreBoard;

@Repository("sDAO")
public class StoreBoardDAO {

	public int getListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("storeMapper.getListCount",i);
	}
	
	public ArrayList<StoreBoard> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeMapper.selectBoardList", i , rowBounds);
		
	}

	public ArrayList<Attachment> selectAttmList(SqlSessionTemplate sqlSession, Integer bId) {
		return (ArrayList)sqlSession.selectList("storeMapper.selectAttmList");
	}
	
	
}
