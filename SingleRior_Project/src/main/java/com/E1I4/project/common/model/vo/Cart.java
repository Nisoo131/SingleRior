package com.E1I4.project.common.model.vo;

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
	private int cartNo;
	private int quantity;
	private String payStatus;
	private String memberId;
	private int productNo;
}
