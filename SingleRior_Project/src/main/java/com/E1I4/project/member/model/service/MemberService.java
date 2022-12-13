package com.E1I4.project.member.model.service;

import java.util.HashMap;

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

	String getAccessToken(String code);

	HashMap<String, Object> getUserInfo(String access_Token);

}
