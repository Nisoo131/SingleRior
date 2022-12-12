package com.E1I4.project.member.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String phone;
	private String email;
	private String address;
	private String memberStatus;
	private String memberAuthority;
}
