package com.E1I4.project.marketBoard.model.vo;

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
public class MarketBoard {
	private int boardNo;
	private int boardType;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private Date modifyDate;
	private String noticeStatus;
	private String status;
	private String writer;
	private int count;
	private String marketPrice;
	private int marketType;
	private int marketArray;
	
	
	//boardType 3 market
	//marketType 같이사요 0, 팝니다1, 삽니다2
	//marketArray 조회수0, 좋아요수1, 댓글수2
	
}
