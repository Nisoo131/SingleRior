package com.E1I4.project.member.model.vo;

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
public class OrderDetail {
	private int ORDER_DETAIL_NO;
	private int orderNo;
	private int productNo;
	private String status;
	private int productQuantity;
	private int productPrice;
	private String productOption;
}
