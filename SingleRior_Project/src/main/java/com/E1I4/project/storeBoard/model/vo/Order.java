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
public class Order {
	// view에서 전달 받을 값
 private int productNo;
 private int productCount;
 private String memberId;
 
   // DB에서 꺼내올 값
 private String boardTitle;
 private int productPrice;
 private int discount;
 
  // 만들어야 할 값
 private int salePrice;
 private int totalPrice;
 private int point;
 
 private int orderNo;
 private int boardNo;
 private String deliveryMessage;
 private String recipient;
 private String address;
 private String phone;
 private Date orderDate;
 private int productQuantity;
 private String status;
 private String productOption;
 private String imgRename;
 
}
