package com.E1I4.project.storeBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.Product;
import com.E1I4.project.storeBoard.model.vo.StoreBoard;

@Repository("sDAO")
public class StoreBoardDAO {

	public int getStoreListCount(SqlSessionTemplate sqlSession, int i) {
		return sqlSession.selectOne("storeMapper.getStoreListCount", i);
	}
	
	public ArrayList<StoreBoard> selectStoreBoardList(SqlSessionTemplate sqlSession, PageInfo pi, int i) {
		
		int offset = (pi.getCurrentPage() -1 ) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("storeMapper.selectStoreBoardList", i, rowBounds);
		
	}

	public ArrayList<Attachment> selectAttmList(SqlSessionTemplate sqlSession ) {
		return (ArrayList)sqlSession.selectList("storeMapper.selectAttmList");
	}

	public ArrayList<StoreBoard> selectProduct(SqlSessionTemplate sqlSession, String bNo) {
		return (ArrayList)sqlSession.selectList("storeMapper.selectProduct", bNo);
	}

	public ArrayList<Attachment> selectImg(SqlSessionTemplate sqlSession, String bNo) {
		return (ArrayList)sqlSession.selectList("storeMapper.selectImg", bNo);
	}



	

	
	
	
}
