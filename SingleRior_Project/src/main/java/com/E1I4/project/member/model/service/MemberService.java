package com.E1I4.project.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.E1I4.project.common.model.vo.Attachment;
import com.E1I4.project.common.model.vo.Board;
import com.E1I4.project.common.model.vo.PageInfo;
import com.E1I4.project.common.model.vo.Product;
import com.E1I4.project.common.model.vo.ProductInquiry;
import com.E1I4.project.common.model.vo.Reply;
import com.E1I4.project.member.model.vo.Member;

public interface MemberService {

	Member login(Member m);

	int checkId(String memberId);

	int checkNickName(String nickName);

	int insertMember(Member m);

	String findId(Member m);

	int findPwd(Member m);

	int changePwd(Member m);

	int checkEmailConfirm(String email);

	int updateMember(Member m);

	int getProfilePhotoCount(String memberId);

	int insertProfile(Attachment a);

	int updateProfile(Attachment a);

	Attachment selectProfile(String memberId);

	int deleteProfile(String memberId);

	int deleteMember(String memberId);

	int deleteKakaoMember(String memberId);

	int getMyContentListCount(HashMap<String, String> map);

	ArrayList<Board> selectBoardList(PageInfo pi, HashMap<String, String> map);

	int getLikeCount(int boardNo);

	int getReplyCount(int boardNo);

	int getMyReplyListCount(HashMap<String, String> map);

	ArrayList<Reply> selectReplyList(PageInfo pi, HashMap<String, String> map);

	Board selectReplyBoardList(HashMap<String, Integer> replyMap);

	int getMyAskListCount(String memberId);

	ArrayList<ProductInquiry> selectMyAskList(PageInfo pi, String memberId);

	Attachment getImageProduct(int productNo);

	Product getDetailProduct(String boardNo);



}
