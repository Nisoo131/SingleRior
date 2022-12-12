package com.E1I4.project.member.model.service;

import com.E1I4.project.member.model.vo.Member;

public interface MemberService {

	Member login(Member m);

	int checkId(String memberId);

	int checkNickName(String nickName);

	int insertMember(Member m);

	String findId(Member m);

}
