package com.E1I4.project.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.Board;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.Reply;
import com.E1I4.project.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {
	
	//로그인
	public Member login(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.login", m);
	}

	// 회원가입 아이디 중복체크
	public int checkId(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.checkId", memberId);
	}

	public int checkNickName(SqlSessionTemplate sqlSession, String nickName) {
		return sqlSession.selectOne("memberMapper.checkNickName", nickName);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	public String findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}

	public int findPwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findPwd", m);
	}

	public int changePwd(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.changePwd", m);
	}

	public int checkEmailConfirm(SqlSessionTemplate sqlSession, String email) {
		return sqlSession.selectOne("memberMapper.checkEmailConfirm", email);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int getProfilePhotoCount(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.getProfilePhotoCount", memberId);
	}

	public int insertProfile(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("memberMapper.insertProfile", a);
	}

	public int updateProfile(SqlSessionTemplate sqlSession, Attachment a) {
		return sqlSession.insert("memberMapper.updateProfile", a);
	}

	public Attachment selectProfile(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.selectOne("memberMapper.selectProfile", memberId);
	}

	public int deleteProfile(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.delete("memberMapper.deleteProfile", memberId);
	}

	public int deleteMember(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.update("memberMapper.deleteMember", memberId);
	}

	public int deleteKakaoMember(SqlSessionTemplate sqlSession, String memberId) {
		return sqlSession.delete("memberMapper.deleteKakaoMember", memberId);
	}

	public int getMyContentListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.getMyContentListCount", map);
	}

	public ArrayList<Board> selectBoardList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectBoardList", map, rowBounds);
	}

	public int getLikeCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("memberMapper.getLikeCount", boardNo);
	}

	public int getReplyCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("memberMapper.getReplyCount", boardNo);
	}

	public int getMyReplyListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("memberMapper.getMyReplyListCount", map);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, String> map) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("memberMapper.selectReplyList", map, rowBounds);
	}

	public Board selectReplyBoardList(SqlSessionTemplate sqlSession, int boardNo) {
		return (Board) sqlSession.selectOne("memberMapper.selectReplyBoardList", boardNo);
	}

}
