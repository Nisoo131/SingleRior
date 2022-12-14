package com.E1I4.project.common.model.vo;

import java.sql.Date;

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
public class ReReply {
	private int rReplyNo;
	private int replyNo;
	private String rReplyContent;
	private Date rReplyCreateDate;
	private Date rReplyModifyDate;
	private String memberId;
	private int boardNo;
	private String rReplyStatus;
	private String rReplySecret;
	private String nickName;
	
}
