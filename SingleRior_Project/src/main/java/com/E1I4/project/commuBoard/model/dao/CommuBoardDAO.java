package com.E1I4.project.commuBoard.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.ReReply;
import com.E1I4.project.common.model.vo.Reply;
import com.E1I4.project.common.model.vo.WishList;
import com.E1I4.project.commuBoard.model.vo.CommuBoard;

@Repository("cDAO")
public class CommuBoardDAO {
	
	public int getCommuListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("commuMapper.getCommuListCount", map);
	}
	
	public ArrayList<CommuBoard> selectCommuAllList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map) {
		int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("commuMapper.selectCommuAllList", map, rowBounds);
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

	public ArrayList<Attachment> selectAttmBoard(SqlSessionTemplate sqlSession, String bNo) {
		return (ArrayList)sqlSession.selectList("commuMapper.selectAttmBoard", bNo);
	}

	public ArrayList<Reply> selectReply(SqlSessionTemplate sqlSession, int bNo) {
		return (ArrayList)sqlSession.selectList("commuMapper.selectReply", bNo);
	}

	public ArrayList<ReReply> selectReReply(SqlSessionTemplate sqlSession, int bNo) {
		return (ArrayList)sqlSession.selectList("commuMapper.selectReReply", bNo);
	}

	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("commuMapper.insertReply", r);
	}

	public int symptOn(SqlSessionTemplate sqlSession, WishList wl) {
		return sqlSession.insert("commuMapper.symptOn", wl);
	}
	
	public int addSymptCount(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("commuMapper.addSymptCount", bNo);
	}

	public WishList selectSymptOn(SqlSessionTemplate sqlSession, WishList wl) {
		return sqlSession.selectOne("commuMapper.selectSymptOn", wl);
	}

	public int symptOff(SqlSessionTemplate sqlSession, WishList wl) {
		return sqlSession.delete("commuMapper.symptOff", wl);
	}

	public int deleteSymptCount(SqlSessionTemplate sqlSession, int bNo) {
		return sqlSession.update("commuMapper.deleteSymptCount", bNo);
	}
}
