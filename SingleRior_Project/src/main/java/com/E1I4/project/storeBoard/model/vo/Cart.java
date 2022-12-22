package com.E1I4.project.storeBoard.model.vo;

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
public class Cart {
	// 장바구니
	private int cartNo;
	private int quantity;
	private String payStatus;
	private String memberId;
	private int productNo;
	private String option;

}
