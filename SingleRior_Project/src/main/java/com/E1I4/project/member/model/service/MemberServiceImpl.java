package com.E1I4.project.member.model.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.Board;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.member.model.dao.MemberDAO;
import com.E1I4.project.member.model.vo.Member;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member login(Member m) {
		return mDAO.login(sqlSession,m);
	}

	@Override
	public int checkId(String memberId) {
		return mDAO.checkId(sqlSession, memberId);
	}

	@Override
	public int checkNickName(String nickName) {
		return mDAO.checkNickName(sqlSession, nickName);
	}

	@Override
	public int insertMember(Member m) {
		return mDAO.insertMember(sqlSession, m);
	}

	@Override
	public String findId(Member m) {
		return mDAO.findId(sqlSession,m);
	}

	@Override
	public int findPwd(Member m) {
		return mDAO.findPwd(sqlSession,m);
	}

	@Override
	public int changePwd(Member m) {
		return mDAO.changePwd(sqlSession,m);
	}

	@Override
	public int checkEmailConfirm(String email) {
		return mDAO.checkEmailConfirm(sqlSession,email);
	}

	@Override
	public int updateMember(Member m) {
		return mDAO.updateMember(sqlSession,m);
	}

	@Override
	public int getProfilePhotoCount(String memberId) {
		return mDAO.getProfilePhotoCount(sqlSession,memberId);
	}

	@Override
	public int insertProfile(Attachment a) {
		return mDAO.insertProfile(sqlSession,a);
	}

	@Override
	public int updateProfile(Attachment a) {
		return mDAO.updateProfile(sqlSession,a);
	}

	@Override
	public Attachment selectProfile(String memberId) {
		return mDAO.selectProfile(sqlSession,memberId);
	}

	@Override
	public int deleteProfile(String memberId) {
		return mDAO.deleteProfile(sqlSession,memberId);
	}

	@Override
	public int deleteMember(String memberId) {
		return mDAO.deleteMember(sqlSession,memberId);
	}

	@Override
	public int deleteKakaoMember(String memberId) {
		return mDAO.deleteKakaoMember(sqlSession,memberId);
	}

	@Override
	public int getMyContentListCount(String memberId) {
		return mDAO.getMyContentListCount(sqlSession, memberId);
	}

	@Override
	public ArrayList<Board> selectBoardList(PageInfo pi, String memberId) {
		return mDAO.selectBoardList(sqlSession,pi,memberId);
	}

	@Override
	public int getLikeCount(int boardNo) {
		return mDAO.getLikeCount(sqlSession,boardNo);
	}

	@Override
	public int getReplyCount(int boardNo) {
		return mDAO.getReplyCount(sqlSession,boardNo);
	}





	
	

}
