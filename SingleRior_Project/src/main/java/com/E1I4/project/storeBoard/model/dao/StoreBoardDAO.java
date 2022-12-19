package com.E1I4.project.storeBoard.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.storeBoard.model.vo.StoreBoard;

@Repository("sDAO")
public class StoreBoardDAO {

	public int getStoreListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("storeMapper.getStoreListCount", i);
	}
	
	public ArrayList<StoreBoard> selectStoreBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int subCate) {
		
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeMapper.selectStoreBoardList", subCate, rowBounds);
		
	}

	public Attachment selectAttmList(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.selectOne("storeMapper.selectAttmList",bNo);
	}

	public ArrayList<StoreBoard> selectProduct(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("storeMapper.selectProduct", productNo);
	}

	public ArrayList<Attachment> selectProductAttmList(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("storeMapper.selectProductAttmList", productNo);
	}



	




	

	
	
	
}
