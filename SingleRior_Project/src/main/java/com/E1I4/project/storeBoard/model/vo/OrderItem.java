package com.E1I4.project.storeBoard.model.vo;

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
public class OrderItem {
	// view에서 전달 받을 값
 private int productNo;
 private String productQty;
 private String finalPrice;
 
   // DB에서 꺼내올 값
 private String boardTitle;
 private int productPrice;
 private int discount;
 
  // 만들어야 할 값
 private int salePrice;
 private int totalPrice;
 private int point;
 
 
 
  
}
